local main = require('main');

--
-- Constants
--

local consts = {
    -- Stances
    FARM = 'Farm',
    TP = 'TP',
    CAST = 'Cast',
    SURVIVE = 'Survive',
    TANK = 'Tank',
    UTILITY = 'Utility',
    SPECIAL = 'Special',
    TH = 'TH',

    -- Ranged Weapons
    THROWING = 'Throwing',
    CROSSBOW = 'Crossbow',
    GUN = 'Gun',
    CANNON = 'Cannon',

    -- Ranged Ammo
    THROWING_NONE = 'ThrowingNone',
    BOLT_ACID = 'BoltAcid',
    BOLT_BLIND = 'BoltBlind',
    BOLT_BLOODY = 'BoltBloody',
    BOLT_SLEEP = 'BoltSleep',
    BOLT_VENOM = 'BoltVemon',
    BULLET = 'Bullet',
    CANNON_SHELL = 'CannonShell', 

    -- Weaponskills
    VIPER_BITE = 'Viper Bite',
    DANCING_EDGE = 'Dancing Edge',
    SHARK_BITE = 'Shark Bite',
    EVISCERATION = 'Evisceration',
    AEOLIAN_EDGE = 'Aeolian Edge',
    MERCY_STROKE = 'Mercy Stroke',
    EXENTERATOR = 'Exenterator',

    -- Ability
    HIDE = 'Hide',
    SNEAK_ATTACK = 'Sneak Attack',
    STEAL = 'Steal',
    TRICK_ATTACK = 'Trick Attack',

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
        consts.THROWING,
        consts.THROWING_NONE,
        {
            ['F1'] = consts.FARM,
            ['F2'] = consts.TP,
            ['F3'] = consts.CAST,
            ['F4'] = consts.SURVIVE,
            ['F5'] = consts.TANK,
            ['F6'] = consts.UTILITY,
            ['F7'] = consts.TH,
            ['F9'] = consts.SPECIAL,
            ['F10'] = main.Consts.STATUS,
            ['F11'] = main.Consts.DEBUG,
            ['F12'] = main.Consts.ENABLE,
            ['!1'] = consts.THROWING,
            ['!2'] = consts.CROSSBOW,
            ['!3'] = consts.GUN,
            ['!4'] = consts.CANNON,
            ['^1'] = consts.BOLT_BLOODY,
            ['^2'] = consts.BOLT_SLEEP,
            ['^3'] = consts.BOLT_ACID,
            ['^4'] = consts.BOLT_VENOM,
            ['^5'] = consts.BOLT_BLIND,
        },
        {
            -- Custom settings
            -- None for now
        }
    );

    -- Stances
    main.RegisterStanceGearset(consts.FARM, {
        -- Bonuses to STR, DEX, Atk
        Main = 'Batardeau',
        Sub = 'X\'s Knife',
        Head = 'Optical Hat',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Pln. Dastanas',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.TP, {
        -- Bonuses to DEX, Acc
        Main = 'Batardeau',
        -- Sub = 'X\'s Knife',
        Head = 'Optical Hat',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Pln. Dastanas',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Peiste Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.CAST, {
        -- Bonuses to MP, INT, MND
        Main = 'Batardeau',
        -- Sub = 'X\'s Knife',
        Head = 'Optical Hat',
        Neck = 'Aesir Torque',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Pln. Dastanas',
        Ring1 = 'Zoredonite Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Peiste Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.SURVIVE, {
        -- Bonuses to Eva, HP, Def, -Enmity
        Main = 'Batardeau',
        -- Sub = 'X\'s Knife',
        Head = 'Optical Hat',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Scorpion Harness',
        Hands = 'Pln. Dastanas',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- Bonuses to Eva, HP, Def, Enmity
        Main = 'Batardeau',
        -- Sub = 'X\'s Knife',
        Head = 'Assassin\'s Bonnet',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Assassin\'s Vest',
        Hands = 'Pln. Dastanas',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterStanceGearset(consts.UTILITY, {
        Head = 'Sprout Beret',
        Body = 'Kupo Suit',
        Ring1 = 'Warp Ring',
        Ring2 = 'Echad Ring',
        Back = 'Nexus Cape',
    });
    main.RegisterStanceGearset(consts.SPECIAL, {
        -- Currently: Unlocking Evisceration
        -- Main = 'Dagger of Trials',
    });
    main.RegisterStanceGearset(consts.TH, {
        Sub = 'Thief\'s Knife',
        Head = 'Wh. Rarab Cap +1',
        --Hands = 'Assassin\'s Armlets',
    });

    -- Ranged Weapons
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_NONE, consts.THROWING, {
        Range = 'Rising Sun',
    });
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_BOLT, consts.CROSSBOW, {
        Range = 'Staurobow',
    });
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_BULLET, consts.GUN, {
        Range = 'Seadog Gun',
    });
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_CANNON, consts.CANNON, {
        Range = 'Cannon',
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_NONE, consts.THROWING_NONE, {
        Ammo = nil,
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_BLOODY, {
        Ammo = 'Bloody Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_SLEEP, {
        Ammo = 'Sleep Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_ACID, {
        Ammo = 'Acid Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_VENOM, {
        Ammo = 'Venom Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_BLIND, {
        Ammo = 'Blind Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BULLET, consts.BULLET, {
        Ammo = 'Bullet',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_CANNON, consts.CANNON_SHELL, {
        Ammo = 'Cannon Shell',
    });

    -- Weaponskills
    main.RegisterWeaponskillGearset(consts.VIPER_BITE, consts.VIPER_BITE, {
        -- Bonuses to DEX, Atk
        Head = 'Assassin\'s Bonnet',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Brigandine Armor',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterWeaponskillGearset(consts.DANCING_EDGE, consts.DANCING_EDGE, {
        -- Bonuses to DEX, CHR, Acc
        Head = 'Optical Hat',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Corsette',
        Legs = 'Luna Subligar',
        Feet = 'Pln. Crackows',
    });
    main.RegisterWeaponskillGearset(consts.SHARK_BITE, consts.SHARK_BITE, {
        -- Bonuses to DEX, Atk
        Head = 'Assassin\'s Bonnet',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Brigandine Armor',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterWeaponskillGearset(consts.EVISCERATION, consts.EVISCERATION, {
        -- Bonuses to DEX, Acc
        Head = 'Optical Hat',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterWeaponskillGearset(consts.AEOLIAN_EDGE, consts.AEOLIAN_EDGE, {
        -- Bonuses to DEX, INT (Area)
        Head = 'Rogue\'s Bonnet',
        Neck = 'Ashura Necklace',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterWeaponskillGearset(consts.MERCY_STROKE, consts.MERCY_STROKE, {
        -- Bonuses to STR
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Rogue\'s Vest',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Savage Gaiters',
    });
    main.RegisterWeaponskillGearset(consts.EXENTERATOR, consts.EXENTERATOR, {
        -- Bonuses to AGI, Acc
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Pln. Dastanas',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Swordbelt',
        Legs = 'Rogue\'s Culottes',
        Feet = 'Leaping Boots',
    });

    -- Abilities
    main.RegisterAbilityGearset(consts.HIDE, consts.HIDE, {
        Body = 'Rogue\'s Vest',
    });
    main.RegisterAbilityGearset(consts.STEAL, consts.STEAL, {
        -- Bonuses to Steal, DEX
        Head = 'Rogue\'s Bonnet',
        Neck = 'Rabbit Charm',
        Hands = 'Thief\'s Kote',
        Ring1 = 'Rogue\'s Ring',
        Legs = 'Rogue\'s Culottes',
        Feet = 'Rogue\'s Poulaines',
    });
    main.RegisterAbilityGearset(consts.SNEAK_ATTACK, consts.SNEAK_ATTACK, {
        -- Bonuses to DEX, Atk
        Head = 'Assassin\'s Bonnet',
        Neck = 'Ashura Necklace',
        Ear1 = 'Giant\'s Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Brigandine Armor',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Aesir Mantle',
        Waist = 'Swordbelt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });
    main.RegisterAbilityGearset(consts.TRICK_ATTACK, consts.TRICK_ATTACK, {
        -- Bonuses to AGI, Atk
        Head = 'Empress Hairpin',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Swordbelt',
        Legs = 'Rogue\'s Culottes',
        Feet = 'Leaping Boots',
    });

    -- Casting (no distinction between precast and midcast for now)
    main.RegisterPrecastGearset(main.Consts.PRECAST, {
        -- Bonuses to Haste
    });
    main.RegisterMidcastGearset(main.Consts.MIDCAST, {
        -- Bonuses to MP, INT, MND
        Head = 'Rogue\'s Bonnet',
        Neck = 'Ashura Necklace',
        Ear1 = 'Phantom Earring',
        Ear2 = 'Phantom Earring',
        Body = 'Pln. Khazagand',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Demon\'s Ring',
        Ring2 = 'Demon\'s Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Peiste Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });

    -- Ranged (no distinction between preshot and midshot for now)
    main.RegisterPreshotGearset(main.Consts.PRESHOT, {
        -- Bonuses to Haste
    });
    main.RegisterMidcastGearset(main.Consts.MIDSHOT, {
        -- Bonuses to RAcc, RAtk, AGI
        Head = 'Optical Hat',
        Neck = 'Ashura Necklace',
        Ear1 = 'Aesir Ear Pendant',
        Ear2 = 'Suppanomimi',
        Body = 'Pln. Khazagand',
        Hands = 'Rogue\'s Armlets',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Scorpion Ring',
        Back = 'Federal Army Mantle',
        Waist = 'Peiste Belt',
        Legs = 'Pln. Seraweels',
        Feet = 'Pln. Crackows',
    });

    -- Items
    main.RegisterItemGearset(main.Consts.ITEM, {
        -- Bonuses to Haste
    })

    -- Resting
    main.RegsiterRestingGearset(main.Consts.RESTING, {
        Body = 'Pln. Khazagand',
    });

    -- Stances (Time-of-day)
    -- main.RegisterTimeOfDayGearset(consts.TANK, consts.TANK_NIGHT, 18, 6, { });

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
