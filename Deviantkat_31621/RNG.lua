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
    BOW = 'Bow',
    CROSSBOW = 'Crossbow',
    GUN = 'Gun',
    CANNON = 'Cannon',

    -- Ranged Ammo
    ARROW_HORN = 'ArrowHorn',
    BOLT_MYTHRIL = 'BoltMythril',
    BOLT_ACID = 'BoltAcid',
    BOLT_BLIND = 'BoltBlind',
    BOLT_BLOODY = 'BoltBloody',
    BOLT_SLEEP = 'BoltSleep',
    BOLT_VENOM = 'BoltVemon',
    BULLET = 'Bullet',
    BULLET_SPARTAN = 'BulletSpartan',
    CANNON_SHELL = 'CannonShell', 

    -- Weaponskills
    SIDEWINDER = 'Sidewinder',
    SLUG_SHOT = 'Slug Shot',

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
        consts.BOW,
        consts.ARROW_HORN,
        {
            ['F1'] = consts.FARM,
            ['F2'] = consts.TP,
            ['F3'] = consts.CAST,
            ['F4'] = consts.TANK,
            ['F6'] = consts.UTILITY,
            ['F7'] = consts.SPECIAL,
            ['F10'] = main.Consts.STATUS,
            ['F11'] = main.Consts.DEBUG,
            ['F12'] = main.Consts.ENABLE,
            ['!1'] = consts.BOW,
            ['!2'] = consts.CROSSBOW,
            ['!3'] = consts.GUN,
            ['!4'] = consts.CANNON,
            ['^1'] = consts.BOLT_BLOODY,
            ['^2'] = consts.BOLT_SLEEP,
            ['^3'] = consts.BOLT_ACID,
            ['^4'] = consts.BOLT_VENOM,
            ['^5'] = consts.BOLT_BLIND,
            ['^0'] = consts.BOLT_MYTHRIL,
            ['^9'] = consts.BULLET,
            ['^8'] = consts.BULLET_SPARTAN,
        },
        {
            -- Custom settings
            -- None for now
        }
    );


    -- DPS/TP Configurations
    main.RegisterStanceGearset(consts.FARM, {
        -- Optimize for combat vs. EP-
        -- Bonuses to Haste, Atk, STR
        Main = 'Fransisca',
        Sub = 'Hawker\'s Knife +1',
        Head = 'Optical Hat',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });
    main.RegisterStanceGearset(consts.TP, {
        -- Optimize for combat vs. IT+
        -- Bonuses to Haste, Acc, Subtle Blow
        Main = 'Fransisca',
        Sub = 'Hawker\'s Knife +1',
        Head = 'Optical Hat',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });
    main.RegisterStanceGearset(consts.CAST, {
        -- Bonuses to MP, Refresh, MND
        Main = 'Fransisca',
        Sub = 'Hawker\'s Knife +1',
        Head = 'Optical Hat',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });
    main.RegisterStanceGearset(consts.TANK, {
        -- Bonuses to Eva, HP, Def, Resistance
        Main = 'Fransisca',
        Sub = 'Hawker\'s Knife +1',
        Head = 'Optical Hat',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
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
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_ARROW, consts.BOW, {
        Range = 'Selene\'s Bow',
    });
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_BOLT, consts.CROSSBOW, {
        Range = 'Staurobow',
    });
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_GUN, consts.GUN, {
        Range = 'Fourth Gun',
    });
    main.RegisterRangedWeaponGearset(main.Consts.AMMO_CANNON, consts.CANNON, {
        Range = 'Culverin',
    });

    -- Ranged Ammo
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_ARROW, consts.ARROW_HORN, {
        Ammo = 'Horn Arrow',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_MYTHRIL, {
        Ammo = 'Mythril Bolt',
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
        Ammo = 'Vemon Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_BOLT, consts.BOLT_BLIND, {
        Ammo = 'Blind Bolt',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_GUN, consts.BULLET, {
        Ammo = 'Bullet',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_GUN, consts.BULLET_SPARTAN, {
        Ammo = 'Spartan Bullet',
    });
    main.RegisterRangedAmmoGearset(main.Consts.AMMO_CANNON, consts.CANNON_SHELL, {
        Ammo = 'Horn Arrow',
    });

    -- Weaponskills
    main.RegisterWeaponskillGearset(consts.SIDEWINDER, consts.SIDEWINDER, {
        -- Nothing just yet
    });
    main.RegisterWeaponskillGearset(consts.SLUG_SHOT, consts.SLUG_SHOT, {
        -- Nothing just yet
    });

    -- Abilities
    -- main.RegisterAbilityGearset(consts.HIDE, consts.HIDE, { });

    -- Casting
    main.RegisterPrecastGearset(main.Consts.PRECAST, {
        -- Bonuses to Haste
        Head = 'Hunter\'s Beret',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });
    main.RegisterMidcastGearset(main.Consts.MIDCAST, {
        -- Bonuses to INT, MND
        Head = 'Hunter\'s Beret',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });

    -- Ranged
    main.RegisterPreshotGearset(main.Consts.PRESHOT, {
        -- Bonuses to Haste
        Head = 'Hunter\'s Beret',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });
    main.RegisterMidcastGearset(main.Consts.MIDSHOT, {
        -- Bonuses to RAcc, RAtk, AGI
        Head = 'Hunter\'s Beret',
        Neck = 'Ranger\'s Necklace',
        Ear1 = 'Wing Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Hunter\'s Bracers',
        Ring1 = 'Warp Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Bat Cape',
        Waist = 'Survival Belt',
        Legs = 'Hunter\'s Braccae',
        Feet = 'Hunter\'s Socks',
    });

    -- Items
    main.RegisterItemGearset(main.Consts.ITEM, {
        -- Bonuses to Haste
    });

    -- Resting
    main.RegsiterRestingGearset(main.Consts.RESTING, {
        -- Nothing just yet
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
