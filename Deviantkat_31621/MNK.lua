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
    SHOULDER_TACKLE = 'ShoulderTackle',
    ONE_INCH_PUNCH = 'OneInchPunch',
    BACKHAND_BLOW = 'BackhandBlow',
    RAGING_FISTS = 'RagingFists',
    SPINNING_ATTACK = 'SpinningAttack',
    HOWLING_FIST = 'HowlingFist',
    DRAGON_KICK = 'DragonKick',
    ASURAN_FISTS = 'AsuranFists',

    -- Ability
    FOCUS = 'Focus',
    DODGE = 'Dodge',
    CHAKRA = 'Chakra',
    BOOST = 'Boost',
    COUNTERSTANCE = 'Counterstance',
    CHI_BLAST = 'ChiBlast',
    FOOTWORK = 'Footwork',
    PERFECT_COUNTER = 'PerfectCounter',

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
        Main = 'Maochinoli',
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Behemoth Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterStanceGearset(consts.TP, {
        -- Optimize for combat vs. IT+
        -- Bonuses to Haste, Acc, Subtle Blow
        Main = 'Maochinoli',
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Behemoth Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterStanceGearset(consts.CAST, {
        -- Bonuses to MP, Refresh, MND
        Main = 'Maochinoli',
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Wing Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Behemoth Mantle',
        Waist = 'Brown Belt',
        Legs = 'Melee Hose',
        Feet = 'Sarutobi Kyahan',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- -Def, +Eva, +HP, +Counter
        -- Note: Def from equipment has no effect under Counterstance
        Main = 'Maochinoli',
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Wing Earring',
        Body = 'Scorpion Harness',
        Hands = 'Ochimusha Kote',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Behemoth Mantle',
        Waist = 'Muscle Belt',
        Legs = 'Melee Hose',
        Feet = 'Melee Gaiters',
    });
    main.RegisterStanceGearset(consts.UTILITY, {
        Head = 'Sprout Beret',
        Body = 'Kupo Suit',
        Ring1 = 'Warp Ring',
        Ring2 = 'Emperor Band',
        Back = 'Nexus Cape',
    });
    main.RegisterStanceGearset(consts.SPECIAL, {
        Main = 'Knuckles of Trials',
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
    main.RegisterWeaponskillGearset(consts.COMBO, 'Combo', {
        -- Description:	Delivers a threefold attack. Damage varies with TP.
        -- Modifiers:	STR:30% ; DEX:30%
    });
    main.RegisterWeaponskillGearset(consts.SHOULDER_TACKLE, 'Shoulder Tackle', {
        -- Description:	Stuns target. Chance of stunning varies with TP.
        -- Modifiers:	VIT:100%
    });
    main.RegisterWeaponskillGearset(consts.ONE_INCH_PUNCH, 'One Inch Punch', {
        -- Description:	Delivers an attack that ignores target's defense. Amount ignored varies with TP.
        -- Modifiers:	VIT:100%
    });
    main.RegisterWeaponskillGearset(consts.BACKHAND_BLOW, 'Backhand Blow', {
        -- Description:	Deals critical damage. Chance of critical hit varies with TP.
        -- Modifiers:	STR:50% DEX:50%
    });
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
