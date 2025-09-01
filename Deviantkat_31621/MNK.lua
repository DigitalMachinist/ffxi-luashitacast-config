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
    COMBO = 'Combo',
    SHOULDER_TACKLE = 'Shoulder Tackle',
    ONE_INCH_PUNCH = 'One Inch Punch',
    BACKHAND_BLOW = 'Backhand Blow',
    RAGING_FISTS = 'Raging Fists',
    SPINNING_ATTACK = 'Spinning Attack',
    HOWLING_FIST = 'Howling Fist',
    DRAGON_KICK = 'Dragon Kick',
    ASURAN_FISTS = 'Asuran Fists',
    FINAL_HEAVEN = 'Final Heaven',
    SHIJIN_SPIRAL = 'Shijin Spiral',

    -- Ability
    FOCUS = 'Focus',
    DODGE = 'Dodge',
    CHAKRA = 'Chakra',
    BOOST = 'Boost',
    COUNTERSTANCE = 'Counterstance',
    CHI_BLAST = 'Chi Blast',
    FOOTWORK = 'Footwork',
    PERFECT_COUNTER = 'Perfect Counter',

    -- Stances (Time of Day)
    -- None

    -- Stances (Health)
    TANK_UNDER_75_PERCENT_HP = 'TankUnder75PercentHP',

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
        Main = 'Spharai',
        Head = 'Optical Hat',
        Neck = 'Ire Torque +1',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterStanceGearset(consts.TP, {
        -- Optimize for combat vs. IT+
        -- Bonuses to Haste, Acc, Subtle Blow
        Main = 'Spharai',
        Head = 'Optical Hat',
        Neck = 'Ire Torque +1',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterStanceGearset(consts.CAST, {
        -- Bonuses to MP, Refresh, MND
        Main = 'Spharai',
        Head = 'Optical Hat',
        Neck = 'Ire Torque +1',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- -Def, +Eva, +HP, +Counter
        -- Note: Def from equipment has no effect under Counterstance
        Main = 'Spharai',
        Head = 'Gnole Crown',
        Neck = 'Ire Torque +1',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Brown Belt',
        Legs = 'Temple Hose',
        Feet = 'Melee Gaiters',
    });
    main.RegisterStanceGearset(consts.UTILITY, {
        Head = 'Sprout Beret',
        Body = 'Kupo Suit',
        Ring1 = 'Warp Ring',
        Ring2 = 'Echad Ring',
        Back = 'Nexus Cape',
    });
    main.RegisterStanceGearset(consts.SPECIAL, {
        Main = 'Maochinoli',
    });

    -- Ranged Weapons
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_THROW, consts.RANGED, {
        Range = nil,
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_THROW, consts.AMMO, {
        Ammo = 'Bomb Core',
    });

    -- Weaponskills
    -- main.RegisterWeaponskillGearset(consts.COMBO, 'Combo', {
    --     -- Description:	Delivers a threefold attack. Damage varies with TP.
    --     -- Modifiers:	STR:30% ; DEX:30%
    -- });
    -- main.RegisterWeaponskillGearset(consts.SHOULDER_TACKLE, 'Shoulder Tackle', {
    --     -- Description:	Stuns target. Chance of stunning varies with TP.
    --     -- Modifiers:	VIT:100%
    -- });
    -- main.RegisterWeaponskillGearset(consts.ONE_INCH_PUNCH, 'One Inch Punch', {
    --     -- Description:	Delivers an attack that ignores target's defense. Amount ignored varies with TP.
    --     -- Modifiers:	VIT:100%
    -- });
    -- main.RegisterWeaponskillGearset(consts.BACKHAND_BLOW, 'Backhand Blow', {
    --     -- Description:	Deals critical damage. Chance of critical hit varies with TP.
    --     -- Modifiers:	STR:50% ; DEX:50%
    -- });
    main.RegisterWeaponskillGearset(consts.RAGING_FISTS, 'Raging Fists', {
        -- Description:	Delivers a fivefold attack. Damage varies with TP.
        -- Modifiers:	STR:30% ; DEX:30%
    });
    main.RegisterWeaponskillGearset(consts.SPINNING_ATTACK, 'Spinning Attack', {
        -- Description:	Delivers an area attack. Radius varies with TP.
        -- Modifiers:	STR:100%
    });
    main.RegisterWeaponskillGearset(consts.HOWLING_FIST, 'Howling Fist', {
        -- Description:	Damage varies with TP.
        -- Modifiers:	STR:40% ; VIT:40%
    });
    main.RegisterWeaponskillGearset(consts.DRAGON_KICK, 'Dragon Kick', {
        -- Description:	Damage varies with TP.
        -- Modifiers:	STR:50% ; DEX:50%
    });
    main.RegisterWeaponskillGearset(consts.ASURAN_FISTS, 'Asuran Fists', {
        -- Description:	Delivers an eightfold attack. Accuracy varies with TP.
        -- Modifiers:	STR:20% ; VIT:20%
    });
    main.RegisterWeaponskillGearset(consts.FINAL_HEAVEN, 'Final Heaven', {
        -- Description:	Additional effect: temporarily enhances Subtle Blow effect.
        -- Modifiers:	VIT:80%
        Main = 'Spharai',
        Head = 'Optical Hat',
        Neck = 'Ire Torque +1',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        --Body = 'Pln. Khazagand',
        Body = 'Temple Cyclas',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterWeaponskillGearset(consts.SHIJIN_SPIRAL, 'Shijin Spiral', {
        -- Description:	Delivers a fivefold attack that plagues the target. Chance of additional effect varies with TP.
        -- Modifiers:	DEX:73-85%
        Head = 'Optical Hat',
        Neck = 'Ire Torque +1',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Spinel Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Brown Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Melee Gaiters',
    });

    -- Abilities
    main.RegisterAbilityGearset(consts.FOCUS, consts.FOCUS, {
        Head = 'Temple Crown',
    });
    main.RegisterAbilityGearset(consts.DODGE, consts.DODGE, {
        Feet = 'Temple Gaiters',
    });
    main.RegisterAbilityGearset(consts.CHAKRA, consts.CHAKRA, {
        -- +VIT
        Body = 'Temple Cyclas',
    });
    main.RegisterAbilityGearset(consts.BOOST, consts.BOOST, {
        -- +STR
        Hands = 'Temple Gloves',
    });
    main.RegisterAbilityGearset(consts.COUNTERSTANCE, consts.COUNTERSTANCE, {
        -- -Def, +Eva, +Counter
        Feet = 'Melee Gaiters',
    });
    main.RegisterAbilityGearset(consts.CHI_BLAST, consts.CHI_BLAST, {
        -- +MND
        Head = 'Temple Crown',
    });
    -- main.RegisterAbilityGearset(consts.FOOTWORK, consts.FOOTWORK, {
    -- });
    -- main.RegisterAbilityGearset(consts.PERFECT_COUNTER, consts.PERFECT_COUNTER, {
    -- });

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

    -- Stances (Health)
    main.RegisterHealthGearset(consts.TANK, consts.TANK_UNDER_75_PERCENT_HP, 0, 75, {
        Waist = 'Muscle Belt',
        Ring1 = 'Kampfer Ring',
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
