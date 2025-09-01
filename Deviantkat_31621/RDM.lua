local main = require('main');

--
-- Constants
--

local consts = {
    -- Stances
    HEAL = 'Heal',
    NUKE = 'Nuke',
    DPS = 'DPS',
    TANK = 'Tank',
    NIN = 'NIN',
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
        consts.HEAL,
        consts.RANGED,
        consts.AMMO,
        {
            F1 = consts.HEAL,
            F2 = consts.NUKE,
            F3 = consts.DPS,
            F4 = consts.TANK,
            F5 = consts.NIN,
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
    main.RegisterStanceGearset(consts.HEAL, {
        -- Bonuses to MP, Refresh, MND
        Main = 'Tamaxchi',
        Sub = 'Darksteel Buckler',
        Head = 'Yigit Turban',
        Neck = 'Colossus\'s Torque',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Crm. Scale Mail',
        Hands = 'Yigit Gages',
        Ring1 = 'Zoredonite Ring',
        Ring2 = 'Setae Ring',
        Back = 'Peiste Mantle',
        Waist = 'Tarutaru Sash',
        Legs = 'Warlock\'s Tights',
        Feet = 'Duelist\'s Boots',
    });
    main.RegisterStanceGearset(consts.NUKE, {
        -- Bonuses to MP, Refresh, MND
        Main = 'Tamaxchi',
        Sub = 'Darksteel Buckler',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Aesir Torque',
        Ear1 = 'Elemental Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Crm. Scale Mail',
        Hands = 'Yigit Gages',
        Ring1 = 'Zoredonite Ring',
        Ring2 = 'Setae Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Tarutaru Sash',
        Legs = 'Duelist\'s Tights',
        Feet = 'Yigit Crackows',
    });
    main.RegisterStanceGearset(consts.DPS, {
        Main = 'Xiutleato',
        Sub = 'Darksteel Buckler',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Colossus\'s Torque',
        Ear1 = 'Lycopodium Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Warlock\'s Tabard',
        Hands = 'Yigit Gages',
        Ring1 = 'Fencer\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Behemoth Mantle',
        Waist = 'Tarutaru Sash',
        Legs = 'Duelist\'s Tights',
        Feet = 'Yigit Crackows',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- Bonuses to Eva, HP, Def, Resistance
        Main = 'Xiutleato',
        Sub = 'Darksteel Buckler',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Cataract Choker',
        Ear1 = 'Lycopodium Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Yigit Gages',
        Ring1 = 'Zoredonite Ring',
        Ring2 = 'Setae Ring',
        Back = 'Peiste Mantle',
        Waist = 'Tarutaru Sash',
        Legs = 'Duelist\'s Tights',
        Feet = 'Yigit Crackows',
    });
    main.RegisterStanceGearset(consts.NIN, {
        Main = 'Batardeau',
        Sub = 'Xiutleato',
        Ear2 = 'Suppanomimi',
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
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_THROW, consts.RANGED, {
        Range = nil,
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_THROW, consts.AMMO, {
        Ammo = 'Mana Ampulla',
    });

    -- Weaponskills
    -- main.RegisterWeaponskillGearset(consts.BLADE_JIN, 'Blade: Jin', { });

    -- Abilities
    -- main.RegisterAbilityGearset(consts.HIDE, consts.HIDE, { });

    -- Casting
    -- main.RegisterPrecastGearset(main.Consts.PRECAST, { });
    -- main.RegisterMidcastGearset(main.Consts.MIDCAST, { });

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
        Main = 'Mst.Cst. Pole',
        -- Ammo = 'Mana Ampulla', -- Disabled because ammo gearswap covers it
        --Head = 'Yigit Turban', -- Get this item
        Neck = 'Opo-opo Necklace',
        Body = 'Yigit Gomlek',
        Hands = 'Yigit Gages',
        Waist = 'Qiqirn Sash',
        Legs = 'Libra Subligar',
        --Legs = 'Yigit Tights', -- Get this item
        Feet = 'Yigit Crackows',
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
