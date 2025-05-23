local main = require('main');

--
-- Constants
--

local consts = {
    -- Stances
    FARM = 'Farm',
    TP = 'TP',
    CAST = 'Cast',
    TANK = 'Tank',
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
            F1 = consts.FARM,
            F2 = consts.TP,
            F3 = consts.CAST,
            F4 = consts.TANK,
            F6 = consts.UTILITY,
            F7 = consts.SPECIAL,
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
        Main = 'Shinsoku',
        --Sub = 'GRIP?',
        Head = 'Optical Hat',
        Neck = 'Asura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness',
        Hands = 'Onimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Purple Belt',
        Legs = 'Raptor Trousers',
        Feet = 'Saotome Sune-Ate',
    });
    main.RegisterStanceGearset(consts.TP, {
        -- Optimize for combat vs. IT+
        -- Bonuses to Haste, Acc, Subtle Blow
        Main = 'Shinsoku',
        --Sub = 'GRIP?',
        Head = 'Optical Hat',
        Neck = 'Asura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness',
        Hands = 'Onimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Purple Belt',
        Legs = 'Raptor Trousers',
        Feet = 'Saotome Sune-Ate',
    });
    main.RegisterStanceGearset(consts.CAST, {
        -- Bonuses to MP, Refresh, MND
        Main = 'Shinsoku',
        --Sub = 'GRIP?',
        Head = 'Optical Hat',
        Neck = 'Asura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness',
        Hands = 'Onimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Purple Belt',
        Legs = 'Raptor Trousers',
        Feet = 'Saotome Sune-Ate',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- Bonuses to Eva, HP, Def, Resistance
        Main = 'Shinsoku',
        --Sub = 'GRIP?',
        Head = 'Optical Hat',
        Neck = 'Asura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness',
        Hands = 'Onimusha Kote',
        Ring1 = 'Archer\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Purple Belt',
        Legs = 'Raptor Trousers',
        Feet = 'Saotome Sune-Ate',
    });
    main.RegisterStanceGearset(consts.UTILITY, {
        Head = 'Sprout Beret',
        Body = 'Kupo Suit',
        Ring1 = 'Warp Ring',
        Ring2 = 'Echad Ring',
        Back = 'Nexus Cape',
    });
    main.RegisterStanceGearset(consts.SPECIAL, {
        -- Nothing just yet
    });

    -- Ranged Weapons
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_ARROW, consts.RANGED, {
        Range = 'War Bow',
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_ARROW, consts.AMMO, {
        Ammo = 'Horn Arrow',
    });

    -- Weaponskills
    -- main.RegisterWeaponskillGearset(consts.BLADE_JIN, 'Blade: Jin', { });

    -- Abilities
    -- main.RegisterAbilityGearset(consts.HIDE, consts.HIDE, { });

    -- Casting
    main.RegisterPrecastGearset(main.Consts.PRECAST, {
        -- Bonuses to Haste
    });
    main.RegisterMidcastGearset(main.Consts.MIDCAST, {
        -- Bonuses to INT, MND
    });

    -- Ranged
    main.RegisterPreshotGearset(main.Consts.PRESHOT, {
        -- Bonuses to Haste
    });
    main.RegisterMidcastGearset(main.Consts.MIDSHOT, {
        -- Bonuses to RAcc, RAtk, AGI
    });


    -- Items
    main.RegisterItemGearset(main.Consts.ITEM, {
        -- Bonuses to Haste
    });

    -- Resting
    main.RegsiterRestingGearset(main.Consts.RESTING, {
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
