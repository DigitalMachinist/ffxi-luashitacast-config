local main = require('main');

--
-- Constants
--

local consts = {
    -- Stances
    NUKE = 'Nuke',
    HEAL = 'Heal',
    UTILITY = 'Utility',
    SPECIAL = 'Special',

    -- Ranged Weapons
    RANGED = 'Ranged',

    -- Ranged Ammo
    AMMO = 'Ammo',

    -- Weaponskills
    -- None

    -- Ability
    -- None

    -- Stances (Time of Day)
    -- None

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
        consts.FARM,
        consts.RANGED,
        consts.AMMO,
        {
            F1 = consts.NUKE,
            F2 = consts.HEAL,
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
    main.RegisterStanceGearset(consts.NUKE, {
        Main = 'Ebony Wand',
        Sub = 'Kupo Shield',
        Head = 'Wizard\'s Petasos',
        Neck = 'Torque',
        Ear1 = 'Elemental Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Wizard\'s Coat',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Zoredonite Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Qiqirn Sash',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Wizard\'s Sabots',
    });
    main.RegisterStanceGearset(consts.HEAL, {
        -- TODO
    });
    main.RegisterStanceGearset(consts.UTILITY, {
        Head = 'Sprout Beret',
        Body = 'Kupo Suit',
        Ring1 = 'Warp Ring',
        Ring2 = 'Emperor Band',
        Back = 'Nexus Cape',
    });
    main.RegisterStanceGearset(consts.SPECIAL, {
        -- Nothing just yet
    });

    -- Ranged Weapons
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_THROW, consts.RANGED, {
        Range = nil,
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_THROW, consts.AMMO, {
        Ammo = nil,
    });

    -- Weaponskills
    -- main.RegisterWeaponskillGearset(consts.BLADE_JIN, 'Blade: Jin', { });

    -- Abilities
    -- main.RegisterAbilityGearset(consts.HIDE, consts.HIDE, { });

    -- Casting
    -- main.RegisterPrecastGearset(main.Consts.PRECAST, {
    --     -- Bonuses to Haste
    -- });
    -- main.RegisterMidcastGearset(main.Consts.MIDCAST, {
    --     -- Bonuses to INT, MND
    -- });

    -- Ranged
    -- main.RegisterPreshotGearset(main.Consts.PRESHOT, {
    --     -- Bonuses to Haste
    -- });
    -- main.RegisterMidcastGearset(main.Consts.MIDSHOT, {
    --     -- Bonuses to RAcc, RAtk, AGI
    -- });


    -- Items
    main.RegisterItemGearset(main.Consts.ITEM, {
        -- Bonuses to Haste
    });

    -- Resting
    main.RegsiterRestingGearset(main.Consts.RESTING, {
        -- Main = 'Mst. Cst. Pole',
        Body = 'Seer\'s Tunic',
        Waist = 'Qiqirn Sash',
        Feet = 'Seer\'s Pumps,'
    });
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
