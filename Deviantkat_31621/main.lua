local main = {};

--
-- Constants
--

main.Consts = {
    -- Debug
    ENABLE = '__Enable',
    DEBUG = '__Debug',
    STATUS = '__Status',

    -- Casting
    PRECAST = '__Precast',
    MIDCAST = '__Midcast',

    -- Ranged
    PRESHOT = '__Preshot',
    MIDSHOT = '__Midshot',

    -- Item
    ITEM = '__Item',

    -- Resting
    RESTING = '__Resting',

    -- Time-of-Day & Health
    LOOKUP_KEY = 'LookupKey',
    START_TIME = 'StartTime',
    END_TIME = 'EndTime',
    START_PERCENT = 'StartPercent',
    END_PERCENT = 'EndPercent',

    -- Weekdays (In Order)
    FIRESDAY = 'Firesday',
    EARTHSDAY = 'Earthsday',
    WATERSDAY = 'Watersday',
    WINDSDAY = 'Windsday',
    ICEDAY = 'Iceday',
    LIGHTNINGDAY = 'Lightningday',
    LIGHTSDAY = 'Lightsday',
    DARKSDAY = 'Darksday',

    -- Moon Phases (In Order)
    FULL_MOON = 'Full Moon',
    WANING_GIBBOUS = 'Waning Gibbous',
    LAST_QUARTER = 'Last Quarter',
    WANING_CRESCENT = 'Waning Crescent',
    NEW_MOON = 'New Moon',
    WAXING_CRESCENT = 'Waxing Crescent',
    FIRST_QUARTER = 'First Quarter',
    WAXING_GIBBOUS = 'Waxing Gibbous',

    -- Weather Elements
    FIRE = 'Fire',
    EARTH = 'Earth',
    WATER = 'Water',
    WIND = 'Wind',
    ICE = 'Ice',
    THUNDER = 'Thunder',
    LIGHT = 'Light',
    DARK = 'Dark',

    -- Ammo Types
    AMMO_ARROW = 'Arrow',
    AMMO_BOLT = 'Bolt',
    AMMO_BULLET = 'Bullet',
    AMMO_CANNON = 'Cannon', -- Guns like the Culverin
    AMMO_THROW = 'Throw',   -- Consumable ammo throwing weapon
    AMMO_NONE = 'None',     -- Reusable throwing weapon
};



--
-- Settings
--

main.Settings = {
    ENABLE = true,
    ENABLEColor = 8, -- 

    DEBUG = false,
    DEBUGColor = 1,  -- White

    STANCE = nil,    -- Required by Initialize()
    STANCEColor = 5, -- Magenta

    RANGED = nil,    -- Required by Initialize()
    RANGEDColor = 5, -- Magenta

    AMMO = nil,      -- Required by Initialize()
    AMMO_TYPE = nil, -- Set by Initialize()
    AMMOColor = 5,   -- Magenta

    Keybinds = {
        -- Defaults are set in main.ResetKeybinds()
    };

    DefaultKeybinds = {
        F10 = main.Consts.STATUS,
        F11 = main.Consts.DEBUG,
        F12 = main.Consts.ENABLE,
    },

    -- Misc Constants
    MessageColor = 1,   -- White
    ErrorColor = 2,     -- Yellow   ..... should it be red?
    EquipColor = 1,     -- White
    WeekdayColor = 3,   -- Blue
    WeatherColor = 3,   -- Blue
    MoonPhaseColor = 3, -- Blue
};

-- Call this after registering any gearsets you need to set up the gearswap script.
main.Initialize = function(stanceGearsetKey, rangedGearsetKey, ammoGearsetKey, keybinds, settings)
    gSettings.Debug = false;
    gSettings.AllowAddSet = true;

    main.ResetKeybinds();
    main.SetKeybinds(keybinds);
    main.SetSettings(settings);
    main.SetSTANCE(stanceGearsetKey);
    main.SetRANGED(rangedGearsetKey);
    main.SetAMMO(ammoGearsetKey);

    -- Report on initial status.
    main.PrintStatus();
end

main.SetKeybinds = function(keybinds)
    -- Loop over the keybinds overwriting main.Settings.Keybinds with any values therein.
    for key, value in pairs(keybinds) do
        main.Settings.Keybinds[key] = value;
        AshitaCore:GetChatManager():QueueCommand(-1, '/bind ' .. key .. ' /lac fwd ' .. value);
    end
end

main.ResetKeybinds = function()
    -- Unbind keys
    for key, value in pairs(main.Settings.Keybinds) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ' .. key);
    end

    -- Clear keybinds
    main.Settings.Keybinds = {};

    -- Set up default debug controls
    main.SetKeybinds(main.Settings.DefaultKeybinds);
end

main.SetSettings = function(settings)
    -- Loop over the keybinds overwriting main.Settings with any values therein.
    for key, value in pairs(settings) do
        main.Settings[key] = value;
    end
end



--
-- Event Hooks
--

-- main.OnLoad = function()
--     -- Everything is done in Initialize()
-- end

main.OnUnload = function()
    -- Unbind keys
    for key, value in pairs(main.Settings.Keybinds) do
        AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ' .. key);
    end
end

main.HandleCommand = function(args)
    local command = args[1];
    
    -- Stance: Command is a gearset key in this case.
    if (main.IsStanceRegistered(command)) then
        main.SetSTANCE(command);

    -- Ranged Weapon: Command is a gearset key in this case.
    elseif (main.IsRangedWeaponRegistered(command)) then
        local rangedWeapon = main.RangedWeapon
        main.SetRANGED(command);

    -- Ranged Ammo: Command is a gearset key in this case.
    elseif (main.IsRangedAmmoRegistered(command)) then
        main.SetAMMO(command);
    end

    -- Default debug controls: Command is a debug action.
    if (command == main.Consts.STATUS) then
        main.PrintStatus();
    elseif (command == main.Consts.DEBUG) then
        main.ToggleDEBUG();
    elseif (command == main.Consts.ENABLE) then
        main.ToggleENABLE();
    end
end

main.HandleDefault = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local player = gData.GetPlayer();
    main.EquipStanceGearset();
    main.EquipRangedWeaponGearset();
    main.EquipRangedAmmoGearset();
    main.EquipTimeOfDayGearset();
    main.EquipHealthGearset();
    main.EquipWeekdayGearset();
    main.EquipWeatherElementGearset();
    main.EquipMoonPhaseGearset();
    main.EquipRestingGearset();
end

main.HandleAbility = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local action = gData.GetAction();
    local gearsetKey = main.GearsetLookup[action.Name];
    if (gearsetKey ~= nil) then
        main.EquipGearset(gearsetKey);
    end
end

main.HandleItem = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local gearsetKey = main.GearsetLookup[main.Consts.ITEM];
    main.EquipGearset(gearsetKey);
end

main.HandlePrecast = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local gearsetKey = main.GearsetLookup[main.Consts.PRECAST];
    main.EquipGearset(gearsetKey);
end

main.HandleMidcast = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local gearsetKey = main.GearsetLookup[main.Consts.MIDCAST];
    main.EquipGearset(gearsetKey);
end

main.HandlePreshot = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local gearsetKey = main.GearsetLookup[main.Consts.PRESHOT];
    main.EquipGearset(gearsetKey);
end

main.HandleMidshot = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local gearsetKey = main.GearsetLookup[main.Consts.MIDSHOT];
    main.EquipGearset(gearsetKey);
end

main.HandleWeaponskill = function()
    if (not main.Settings.ENABLE) then
        return;
    end
    
    local action = gData.GetAction();
    local gearsetKey = main.GearsetLookup[action.Name];
    if (gearsetKey ~= nil) then
        main.EquipGearset(gearsetKey);
    end
end



--
-- Gearsets
--

-- Intentionally empty. Individual scripts will register gearsets and they'll be assigned here.

-- Maps from a gearset key to a gearset table.
main.Gearsets = {};

-- Maps from a base gearset key to a gearset key.
main.GearsetLookup = {};

-- Maps from a base gearset key name to start/end times and a gearset lookup key.
main.GearsetTimeOfDayRules = {};

-- Maps from a stance name to a gearset key.
main.GearsetStances = {};

-- Maps from a ranged ammo type to an array of gearset lookup keys.
main.GearsetRangedWeapons = {};

-- Maps from a ranged weapon key to an ammo type
main.GearsetRangedWeaponAmmoTypes = {};

-- Maps from a ranged ammo type to an array of gearset lookup keys.
main.GearsetRangedAmmos = {};

-- Maps from a ranged ammo key to an ammo type
main.GearsetRangedAmmoAmmoTypes = {};

main.EquipGearset = function(gearsetKey)
    if (main.Gearsets[gearsetKey] == nil) then
        if (main.Settings.DEBUG) then
            gFunc.Echo(main.Settings.MessageColor, 'Gearset not found: ' .. gearsetKey);
        end
        return;
    end
    gFunc.EquipSet(main.Gearsets[gearsetKey]);
    if (main.Settings.DEBUG) then
        gFunc.Echo(main.Settings.MessageColor, 'EQUIP: ' .. gearsetKey);
    end
end

main.EquipStanceGearset = function()
    main.EquipGearset(main.Settings.STANCE);
end

main.EquipRangedWeaponGearset = function()
    main.EquipGearset(main.Settings.RANGED);
end

main.EquipRangedAmmoGearset = function()
    main.EquipGearset(main.Settings.AMMO);
end

main.EquipTimeOfDayGearset = function()
    -- This limits us to one time-of-day rule per gearset.
    local environment = gData.GetEnvironment();
    local timeOfDayInfo = main.GearsetTimeOfDayRules[main.Settings.STANCE];
    if (timeOfDayInfo ~= nil) then
        local gearsetKey = timeOfDayInfo[main.Consts.LOOKUP_KEY];
        local startTime = timeOfDayInfo[main.Consts.START_TIME];
        local endTime = timeOfDayInfo[main.Consts.END_TIME];
        if (startTime < endTime and (environment.Time >= startTime and environment.Time < endTime)) then
            -- Start time is before end time and we're within the middle of the day.
            -- 0000 [ x x x <===============> x x x ] 2400
            main.EquipGearset(gearsetKey);
        elseif (startTime > endTime and (environment.Time >= startTime or environment.Time < endTime)) then
            -- End time is after midnight, the start and the end of the day.
            -- 0000 [=======> x x x x x x x <=======] 2400
            main.EquipGearset(gearsetKey);
        end
    end
end

main.EquipHealthGearset = function()
    -- This limits us to one health rule per gearset.
    local player = gData.GetPlayer();
    local healthInfo = main.GearsetHealthRules[main.Settings.STANCE];
    if (healthInfo ~= nil) then
        local gearsetKey = healthInfo[main.Consts.LOOKUP_KEY];
        local startPercent = healthInfo[main.Consts.START_PERCENT];
        local endPercent = healthInfo[main.Consts.END_PERCENT];
        if (startPercent < endPercent and (player.HPP >= startPercent and player.HPP < endPercent)) then
            -- Start percent is less than end percent, therefore HP is a continuous range.
            -- 0 [ x x x <===============> x x x ] 100
            main.EquipGearset(gearsetKey);
        elseif (startPercent > endPercent and (player.HPP >= startPercent or player.HPP < endPercent)) then
            -- End percent is less than start percent, therefore the range is split around the extremes.
            -- 0 [=======> x x x x x x x <=======] 100
            main.EquipGearset(gearsetKey);
        end
    end
end

main.EquipWeekdayGearset = function()
    local environment = gData.GetEnvironment();
    local weekdayGearsetKey = main.GetGearsetLookupKey(main.Settings.STANCE, environment.Day);
    local gearsetKey = main.GearsetLookup[weekdayGearsetKey];
    if (gearsetKey ~= nil) then
        main.EquipGearset(gearsetKey);
    end
end

main.EquipMoonPhaseGearset = function()
    local environment = gData.GetEnvironment();
    local moonPhaseGearsetKey = main.GetGearsetLookupKey(main.Settings.STANCE, environment.MoonPhase);
    local gearsetKey = main.GearsetLookup[moonPhaseGearsetKey];
    if (gearsetKey ~= nil) then
        main.EquipGearset(gearsetKey);
    end
end

main.EquipWeatherElementGearset = function()
    local environment = gData.GetEnvironment();
    local weatherElementGearsetKey = main.GetGearsetLookupKey(main.Settings.STANCE, environment.WeatherElement);
    local gearsetKey = main.GearsetLookup[weatherElementGearsetKey];
    if (gearsetKey ~= nil) then
        main.EquipGearset(gearsetKey);
    end
end

main.EquipRestingGearset = function()
    local player = gData.GetPlayer();
    if (player.Status ~= main.Consts.RESTING) then
        return;
    end

    main.EquipGearset(main.Consts.RESTING);
end

main.GetGearsetLookupKey = function(baseGearsetKey, anotherKey)
    return baseGearsetKey .. anotherKey;
end

main.IsRangedAmmoRegistered = function(gearsetKey)
    return main.GearsetRangedAmmoAmmoTypes[gearsetKey] ~= nil;
end

main.IsRangedWeaponRegistered = function(gearsetKey)
    return main.GearsetRangedWeaponAmmoTypes[gearsetKey] ~= nil;
end

main.IsStanceRegistered = function(gearsetKey)
    return main.GearsetStances[gearsetKey] ~= nil;
end

main.RegisterGearset = function(gearsetKey, gearsetTable)
    main.Gearsets[gearsetKey] = gearsetTable;
    if (main.Settings.DEBUG) then
        gFunc.Echo(main.Settings.MessageColor, 'REGISTERED GEARSET: ' .. gearsetKey);
    end
end

main.RegisterStanceGearset = function(gearsetKey, gearsetTable)
    main.GearsetStances[gearsetKey] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterRangedWeaponGearset = function(ammoType, gearsetKey, gearsetTable)
    if (main.GearsetRangedWeapons[ammoType] == nil) then
        main.GearsetRangedWeapons[ammoType] = {};
    end
    table.insert(main.GearsetRangedWeapons[ammoType], gearsetKey);
    main.GearsetRangedWeaponAmmoTypes[gearsetKey] = ammoType;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterRangedAmmoGearset = function(ammoType, gearsetKey, gearsetTable)
    if (main.GearsetRangedAmmos[ammoType] == nil) then
        main.GearsetRangedAmmos[ammoType] = {};
    end
    table.insert(main.GearsetRangedAmmos[ammoType], gearsetKey);
    main.GearsetRangedAmmoAmmoTypes[gearsetKey] = ammoType;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterTimeOfDayGearset = function(baseGearsetKey, gearsetKey, startTime, endTime, gearsetTable)
    -- This kinda sucks because it limits you to one time-of-day rule per gearset.
    main.GearsetTimeOfDayRules[baseGearsetKey] = {};
    main.GearsetTimeOfDayRules[baseGearsetKey][main.Consts.LOOKUP_KEY] = gearsetKey;
    main.GearsetTimeOfDayRules[baseGearsetKey][main.Consts.START_TIME] = startTime;
    main.GearsetTimeOfDayRules[baseGearsetKey][main.Consts.END_TIME] = endTime;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterHealthGearset = function(baseGearsetKey, gearsetKey, startPercent, endPercent, gearsetTable)
    -- This kinda sucks because it limits you to one health rule per gearset.
    main.GearsetHealthRules[baseGearsetKey] = {};
    main.GearsetHealthRules[baseGearsetKey][main.Consts.LOOKUP_KEY] = gearsetKey;
    main.GearsetHealthRules[baseGearsetKey][main.Consts.START_PERCENT] = startPercent;
    main.GearsetHealthRules[baseGearsetKey][main.Consts.END_PERCENT] = endPercent;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterWeekdayGearset = function(baseGearsetKey, gearsetKey, weekday, gearsetTable)
    local lookupKey = main.GetGearsetLookupKey(baseGearsetKey, weekday);
    main.GearsetLookup[lookupKey] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterMoonPhaseGearset = function(baseGearsetKey, gearsetKey, moonPhase, gearsetTable)
    local lookupKey = main.GetGearsetLookupKey(baseGearsetKey, moonPhase);
    main.GearsetLookup[lookupKey] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterWeatherElementGearset = function(baseGearsetKey, gearsetKey, weatherElement, gearsetTable)
    local lookupKey = main.GetGearsetLookupKey(baseGearsetKey, weatherElement);
    main.GearsetLookup[lookupKey] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterPrecastGearset = function(gearsetKey, gearsetTable)
    main.GearsetLookup[main.Consts.PRECAST] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterMidcastGearset = function(gearsetKey, gearsetTable)
    main.GearsetLookup[main.Consts.MIDCAST] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterPreshotGearset = function(gearsetKey, gearsetTable)
    main.GearsetLookup[main.Consts.PRESHOT] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterMidshotGearset = function(gearsetKey, gearsetTable)
    main.GearsetLookup[main.Consts.MIDSHOT] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterItemGearset = function(gearsetKey, gearsetTable)
    main.GearsetLookup[main.Consts.ITEM] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterAbilityGearset = function(gearsetKey, abilityName, gearsetTable)
    main.GearsetLookup[abilityName] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegisterWeaponskillGearset = function(gearsetKey, wsName, gearsetTable)
    main.GearsetLookup[wsName] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end

main.RegsiterRestingGearset = function(gearsetKey, gearsetTable)
    main.GearsetLookup[main.Consts.RESTING] = gearsetKey;
    main.RegisterGearset(gearsetKey, gearsetTable);
end



--
-- Utilities & Misc
--

main.PrintStatus = function()
    local environment = gData.GetEnvironment();
    gFunc.Echo(main.Settings.STANCEColor, 'STANCE: ' .. main.Settings.STANCE);
    gFunc.Echo(main.Settings.RANGEDColor, 'RANGED: ' .. main.Settings.RANGED);
    gFunc.Echo(main.Settings.AMMOColor, 'AMMO: ' .. main.Settings.AMMO);
    gFunc.Echo(main.Settings.WeekdayColor, environment.Day .. ' (' .. string.gsub(environment.Time, '%.', ':') .. ')');
    gFunc.Echo(main.Settings.WeatherColor, 'Weather: ' .. environment.Weather .. ' (' .. environment.WeatherElement .. ')');
    gFunc.Echo(main.Settings.MoonPhaseColor, 'Moon Phase: ' .. environment.MoonPhase .. ' (' .. environment.MoonPercent .. '%)');
end

main.SetENABLE = function(isEnabled)
    main.Settings.ENABLE = isEnabled;
    gFunc.Echo(main.Settings.ENABLEColor, main.Settings.ENABLE and 'ENABLED' or 'DISABLED')
end

main.ToggleENABLE = function()
    main.SetENABLE(not main.Settings.ENABLE)
end

main.SetDEBUG = function(isDEBUGMode)
    main.Settings.DEBUG = isDEBUGMode;
    gFunc.Echo(main.Settings.DEBUGColor, main.Settings.DEBUG and 'DEBUG: ON' or 'DEBUG: OFF');
end

main.ToggleDEBUG = function()
    main.SetDEBUG(not main.Settings.DEBUG)
end

main.SetAMMO = function(ammoGearsetKey)
    local currentAmmoType = main.GearsetRangedWeaponAmmoTypes[main.Settings.RANGED];
    local newAmmoType = main.GearsetRangedAmmoAmmoTypes[ammoGearsetKey];
    -- If trying to switch to ammo that doesn't match our current ranged weapon, ignore.
    if (currentAmmoType ~= newAmmoType) then
        return;
    end
    main.Settings.AMMO = ammoGearsetKey;
    main.Settings.AMMO_TYPE = newAmmoType;
    gFunc.Echo(main.Settings.AMMOColor, 'AMMO: ' .. main.Settings.AMMO);
end

main.SetRANGED = function(rangedGearsetKey)
    local currentAmmoType = main.GearsetRangedWeaponAmmoTypes[main.Settings.RANGED];
    local newAmmoType = main.GearsetRangedWeaponAmmoTypes[rangedGearsetKey];
    main.Settings.RANGED = rangedGearsetKey;
    gFunc.Echo(main.Settings.RANGEDColor, 'RANGED: ' .. main.Settings.RANGED);
    if (currentAmmoType == newAmmoType) then
        return;
    end

    -- Change ammo if necessary.
    main.Settings.AMMO_TYPE = newAmmoType;
    -- If this is a throwing weapon, it has the "none" ammo type, and shouldn't set a new ammo.
    if (newAmmoType ~= main.Consts.AMMO_NONE) then
        -- Use the first-registered ammo by default.
        main.SetAMMO(main.GearsetRangedAmmos[newAmmoType][1]);
    end
end

main.SetSTANCE = function(stance)
    main.Settings.STANCE = stance;
    gFunc.Echo(main.Settings.STANCEColor, 'STANCE: ' .. main.Settings.STANCE);
end

return main;