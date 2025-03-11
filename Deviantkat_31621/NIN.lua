local main = require('main');

--
-- Constants
--

local consts = {
    -- Stances
    FARM = 'Farm',
    TP = 'TP',
    RECOVER = 'Recover',
    TANK = 'Tank',
    UTILITY = 'Utility',
    SPECIAL = 'Special',

    -- Ranged Weapons
    RANGED = 'Ranged',

    -- Ranged Ammo
    SHURIKEN = 'Shuriken',

    -- Weaponskills
    BLADE_JIN = 'BladeJin',
    BLADE_TEN = 'BladeTen',

    -- Ability
    -- None

    -- Stances (Time of Day)
    FARM_NIGHT = 'FarmNight',
    RECOVER_NIGHT = 'RecoverNight',
    TANK_NIGHT = 'TankNight',
    TP_NIGHT = 'TPNight',
    UTILITY_NIGHT = 'UtilityNight',

    -- Stances (Weekday)
    -- None

    -- Stances (Moon Phase)
    -- None

    -- Stances (Weather)
    -- None
}



--
-- Configuration
--

local profile = {};

profile.OnLoad = function()
    -- Initialize with defaults
    main.Initialize(
        consts.TANK,
        consts.RANGED,
        consts.SHURIKEN,
        {
            F1 = consts.FARM,
            F2 = consts.TP,
            F3 = consts.RECOVER,
            F4 = consts.TANK,
            F5 = consts.UTILITY,
            F6 = consts.SPECIAL,
            F10 = main.Consts.STATUS,
            F11 = main.Consts.DEBUG,
            F12 = main.Consts.ENABLE,
        },
        {
            -- Custom settings
            -- None for now
        }
    );

    -- Stances
    main.RegisterStanceGearset(consts.FARM, {
        -- Optimize for combat vs. EP-
        -- Bonuses to Haste, Atk, STR
        Main = 'Mamushito',
        Sub = 'Mamushito',
        Head = 'Pln. Qalansuwa',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Windurstian Ring',
        Back = 'Rancorous Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.TP, {
        -- Optimize for combat vs. IT+
        -- Bonuses to Haste, Acc, Subtle Blow
        Main = 'Mamushito',
        Sub = 'Mamushito',
        Head = 'Pln. Qalansuwa',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Windurstian Ring',
        Back = 'Behemoth Cloak',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.RECOVER, {
        -- Bonuses to Eva, HP, Def
        Main = 'Mamushito',
        Sub = 'Mamushito',
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Wing Earring',
        Body = 'Scorpion Harness',
        Hands = 'Ninja Tekko',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Windurstian Ring',
        Back = 'Bat Cloak',
        Waist = 'Survival Belt',
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- Bonuses to Eva, HP, Def
        Main = 'Mamushito',
        Sub = 'Mamushito',
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Wing Earring',
        Body = 'Scorpion Harness',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Windurstian Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.UTILITY, {
        Head = 'Sprout Beret',
        Body = 'Kupo Suit',
        Ring1 = 'Warp Ring',
        Ring2 = 'Emperor Band',
        Back = 'Nexus Cape',
        Feet = 'Ninja Kyahan',
    });
    main.RegisterStanceGearset(consts.SPECIAL, {
        -- Nothing just yet
    });

    -- Ranged Weapons
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_THROW, consts.RANGED, {
        Range = nil,
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_THROW, consts.SHURIKEN, {
        Ammo = 'Fuma Shuriken',
    });

    -- Weaponskills
    main.RegisterWeaponskillGearset(consts.BLADE_JIN, 'Blade: Jin', {
        -- Nothing just yet
    });
    main.RegisterWeaponskillGearset(consts.BLADE_TEN, 'Blade: Ten', {
        -- Nothing just yet
    });

    -- Abilities
    -- main.RegisterAbilityGearset(consts.HIDE, consts.HIDE, { });

    -- Casting
    main.RegisterPrecastGearset(main.Consts.PRECAST, {
        -- Bonuses to Haste
        Head = 'Koga Hatsuburi',
        Neck = 'Cataract Choker',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Phantom Earring',
        Back = 'Federal Army Mantle',
    });
    main.RegisterMidcastGearset(main.Consts.MIDCAST, {
        -- Bonuses to INT, Ninjutsu
        Head = 'Koga Hatsuburi',
        Neck = 'Cataract Choker',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Phantom Earring',
        Back = 'Federal Army Mantle',
    });

    -- Ranged
    main.RegisterPreshotGearset(main.Consts.PRESHOT, {
        -- Bonuses to Haste
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ninja Tekko',
        Ring1 = 'Scorpion Ring',
        Ring2 = 'Archer\'s Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Flagellant\'s Rope',
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    });
    main.RegisterMidcastGearset(main.Consts.MIDSHOT, {
        -- Bonuses to RAcc, RAtk, AGI
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ninja Tekko',
        Ring1 = 'Scorpion Ring',
        Ring2 = 'Archer\'s Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Flagellant\'s Rope',
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    });

    -- Resting
    main.RegsiterRestingGearset(main.Consts.RESTING, {
        -- Nothing just yet
    });

    -- Stances (Time-of-day)
    main.RegisterTimeOfDayGearset(consts.FARM, consts.FARM_NIGHT, 18, 6, {
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    });
    main.RegisterTimeOfDayGearset(consts.TP, consts.TP_NIGHT, 18, 6, {
        Legs = 'Ninja Hakama',
    });
    main.RegisterTimeOfDayGearset(consts.RECOVER, consts.RECOVER_NIGHT, 18, 6, {
        Legs = 'Ninja Hakama',
    });
    main.RegisterTimeOfDayGearset(consts.TANK, consts.TANK_NIGHT, 18, 6, {
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    });
    main.RegisterTimeOfDayGearset(consts.UTILITY, consts.UTILITY_NIGHT, 18, 6, {
        Body = 'Pln. Khazagand',
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    });

    -- Stances (Weekday)
    -- main.RegisterWeekdayGearset(consts.TANK, consts.TANK_ICEDAY, main.Consts.ICEDAY, { });

    -- Stances (Moon Phase)
    -- main.RegisterMoonPhaseGearset(consts.TANK, consts.TANK_WAXING_CRESCENT, main.Consts.WAXING_CRESCENT, { });

    -- Stances (Weather Element)
    -- main.RegisterWeatherElementGearset(consts.TANK, consts.TANK_EARTH_WEATHER, main.Consts.EARTH, { });
end

profile.OnUnload = function()
    main.OnUnload();
end

profile.HandleCommand = function(args)
    main.HandleCommand(args);
end

profile.HandleDefault = function()
    main.HandleDefault();
end

profile.HandleAbility = function()
    main.HandleAbility();
end

profile.HandleItem = function()
    main.HandleItem();
end

profile.HandlePrecast = function()
    main.HandlePrecast();
end

profile.HandleMidcast = function()
    main.HandleMidcast();
end

profile.HandlePreshot = function()
    main.HandlePreshot();
end

profile.HandleMidshot = function()
    main.HandleMidshot();
end

profile.HandleWeaponskill = function()
    main.HandleWeaponskill();
end

return profile;
