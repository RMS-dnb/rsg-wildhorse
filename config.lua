Config = {}

Config.Debug = false
Config.SellTime = 20000
Config.SellKey = 0xD8F73058
Config.Blip = {
    blipName = 'SellWildHorse', 
    blipSprite = 'blip_shop_animal_sellwildhorse', 
    blipScale = 0.2 
}

Config.SellWildHorseLocations = {
    {name = 'Valentine Horse Seller',      location = 'valentine-sellwildhorse',     coords = vector3(-382.54, 788.06, 115.91 -0.8), showblip = true }, --valentine
    {name = 'St Denis Horse Seller',       location = 'stdenis-sellwildhorse',       coords = vector3(2839.5, -1305.68, 46.66 -0.8), showblip = true }, --stdenis
    {name = 'West Elizabeth Horse Seller', location = 'westelizabeth-sellwildhorse', coords = vector3(-2543.44, 401.73, 148.28 -0.8), showblip = true }, --westelizabeth
    {name = 'Stawberry Horse Seller',      location = 'stawberry-sellwildhorse',     coords = vector3(-3641.46, -2626.49, -13.73 -0.8), showblip = true }, --stawberry
    {name = 'Tumbleweed Horse Seller',     location = 'tumbleweed-sellwildhorse',    coords = vector3(-5527.8, -2948.04, -1.56 -0.8), showblip = true }, --tumbleweed
    {name = 'Blackwater Horse Seller',     location = 'blackwater-sellwildhorse',    coords = vector3(-945.21, -1337.29, 50.65 -0.8), showblip = true }, --blackwater
    {name = 'Rhodes Horse Seller',         location = 'rhodes-sellwildhorse',        coords = vector3(1434.89, -1291.61, 77.82 -0.8), showblip = true }, --blackwater
    {name = 'Van Horn Horse Seller',       location = 'vanhorn-sellwildhorse',       coords = vector3(2932.95, 568.53, 44.99 -0.8), showblip = true }, --blackwater
}

Config.SaleMultiplier  = 1
Config.Xp = 0.05

Config.PaymentType = 'cash'

Config.Horse = { -- reward item false or 'itemname'
    
    { 
        name        = 'Donkey',
        model       = `A_C_Donkey_01`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Greyovero',
        model       = `A_C_Horse_AmericanPaint_Greyovero`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Overo',
        model       = `A_C_Horse_AmericanPaint_Overo`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SplashedWhite',
        model       = `A_C_Horse_AmericanPaint_SplashedWhite`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Tobiano',
        model       = `A_C_Horse_AmericanPaint_Tobiano`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'StandardbredBlack',
        model       = `A_C_Horse_AmericanStandardbred_Black`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'StandardbredBuckskin',
        model       = `A_C_Horse_AmericanStandardbred_Buckskin`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'StandardbredPalominoDapple',
        model       = `A_C_Horse_AmericanStandardbred_PalominoDapple`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'StandardbredSilverTailBuckskin',
        model       = `A_C_Horse_AmericanStandardbred_SilverTailBuckskin`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'AndalusianDarkBay',
        model       = `A_C_Horse_Andalusian_DarkBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Perlino',
        model       = `A_C_Horse_Andalusian_Perlino`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'RoseGray',
        model       = `A_C_Horse_Andalusian_RoseGray`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BlackSnowflake',
        model       = `A_C_Horse_Appaloosa_BlackSnowflake`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Blanket',
        model       = `A_C_Horse_Appaloosa_Blanket`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BrownLeopard',
        model       = `A_C_Horse_Appaloosa_BrownLeopard`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'FewSpottedPC',
        model       = `A_C_Horse_Appaloosa_FewSpotted_PC`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Leopard',
        model       = `A_C_Horse_Appaloosa_Leopard`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'LeopardBlanket',
        model       = `A_C_Horse_Appaloosa_LeopardBlanket`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ArabianBlack',
        model       = `A_C_Horse_Arabian_Black`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ArabianGrey',
        model       = `A_C_Horse_Arabian_Grey`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ArabianRedChestnut',
        model       = `A_C_Horse_Arabian_RedChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'RedChestnutPC',
        model       = `A_C_Horse_Arabian_RedChestnut_PC`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'RoseGreyBay',
        model       = `A_C_Horse_Arabian_RoseGreyBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'WarpedBrindlePC',
        model       = `A_C_Horse_Arabian_WarpedBrindle_PC`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ArabianWhite',
        model       = `A_C_Horse_Arabian_White`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ArdennesBayRoan',
        model       = `A_C_Horse_Ardennes_BayRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'IronGreyRoan',
        model       = `A_C_Horse_Ardennes_IronGreyRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'StrawberryRoan',
        model       = `A_C_Horse_Ardennes_StrawberryRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BlondChestnut',
        model       = `A_C_Horse_Belgian_BlondChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'MealyChestnut',
        model       = `A_C_Horse_Belgian_MealyChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'WarVets',
        model       = `A_C_Horse_Buell_WarVets`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ChocolateRoan',
        model       = `A_C_Horse_DutchWarmblood_ChocolateRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SealBrown',
        model       = `A_C_Horse_DutchWarmblood_SealBrown`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SootyBuckskin',
        model       = `A_C_Horse_DutchWarmblood_SootyBuckskin`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'EagleFlies',
        model       = `A_C_Horse_EagleFlies`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Bill',
        model       = `A_C_Horse_Gang_Bill`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Charles',
        model       = `A_C_Horse_Gang_Charles`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'CharlesEndlessSummer',
        model       = `A_C_Horse_Gang_Charles_EndlessSummer`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Dutch',
        model       = `A_C_Horse_Gang_Dutch`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Hosea',
        model       = `A_C_Horse_Gang_Hosea`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Javier',
        model       = `A_C_Horse_Gang_Javier`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'John',
        model       = `A_C_Horse_Gang_John`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Karen',
        model       = `A_C_Horse_Gang_Karen`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Kieran',
        model       = `A_C_Horse_Gang_Kieran`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Lenny',
        model       = `A_C_Horse_Gang_Lenny`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Micah',
        model       = `A_C_Horse_Gang_Micah`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Sadie',
        model       = `A_C_Horse_Gang_Sadie`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SadieEndlessSummer',
        model       = `A_C_Horse_Gang_Sadie_EndlessSummer`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Sean',
        model       = `A_C_Horse_Gang_Sean`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Trelawney',
        model       = `A_C_Horse_Gang_Trelawney`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Uncle',
        model       = `A_C_Horse_Gang_Uncle`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'UncleEndlessSummer',
        model       = `A_C_Horse_Gang_Uncle_EndlessSummer`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'DarkDappleGrey',
        model       = `A_C_Horse_HungarianHalfbred_DarkDappleGrey`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'LiverChestnut',
        model       = `A_C_Horse_HungarianHalfbred_LiverChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'HungarianHalfbredFlaxenChestnut',
        model       = `A_C_Horse_HungarianHalfbred_FlaxenChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'PiebaldTobiano',
        model       = `A_C_Horse_HungarianHalfbred_PiebaldTobiano`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'JohnEndlessSummer',
        model       = `A_C_Horse_John_EndlessSummer`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'KentuckySaddleBlack',
        model       = `A_C_Horse_KentuckySaddle_Black`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ButterMilkBuckskinPC',
        model       = `A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ChestnutPinto',
        model       = `A_C_Horse_KentuckySaddle_ChestnutPinto`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SaddleGrey',
        model       = `A_C_Horse_KentuckySaddle_Grey`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SilverBay',
        model       = `A_C_Horse_KentuckySaddle_SilverBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'AmberChampagne',
        model       = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SableChampagne',
        model       = `A_C_Horse_MissouriFoxTrotter_SableChampagne`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SilverDapplePinto',
        model       = `A_C_Horse_MissouriFoxTrotter_SilverDapplePinto`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Bay',
        model       = `A_C_Horse_Morgan_Bay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'MorganBayRoan',
        model       = `A_C_Horse_Morgan_BayRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'MorganFlaxenChestnut',
        model       = `A_C_Horse_Morgan_FlaxenChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'LiverChestnutPC',
        model       = `A_C_Horse_Morgan_LiverChestnut_PC`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Palomino',
        model       = `A_C_Horse_Morgan_Palomino`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Mangy',
        model       = `A_C_Horse_MP_Mangy_Backup`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Mange',
        model       = `A_C_Horse_MurfreeBrood_Mange_01`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Mange2',
        model       = `A_C_Horse_MurfreeBrood_Mange_02`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Mange3',
        model       = `A_C_Horse_MurfreeBrood_Mange_03`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'GoldenDun',
        model       = `A_C_Horse_Mustang_GoldenDun`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'GrulloDun',
        model       = `A_C_Horse_Mustang_GrulloDun`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'TigerStripedBay',
        model       = `A_C_Horse_Mustang_TigerStripedBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'WildBay',
        model       = `A_C_Horse_Mustang_WildBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BlueRoan',
        model       = `A_C_Horse_Nokota_BlueRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ReverseDappleRoan',
        model       = `A_C_Horse_Nokota_ReverseDappleRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'WhiteRoan',
        model       = `A_C_Horse_Nokota_WhiteRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ShireDarkBay',
        model       = `A_C_Horse_Shire_DarkBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'LightGrey',
        model       = `A_C_Horse_Shire_LightGrey`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'RavenBlack',
        model       = `A_C_Horse_Shire_RavenBlack`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'SuffolkPunchRedChestnut',
        model       = `A_C_Horse_SuffolkPunch_RedChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'PunchSorrel',
        model       = `A_C_Horse_SuffolkPunch_Sorrel`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BlackRabicano',
        model       = `A_C_Horse_TennesseeWalker_BlackRabicano`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Chestnut',
        model       = `A_C_Horse_TennesseeWalker_Chestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'DappleBay',
        model       = `A_C_Horse_TennesseeWalker_DappleBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'FlaxenRoan',
        model       = `A_C_Horse_TennesseeWalker_FlaxenRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'GoldPalominoPC',
        model       = `A_C_Horse_TennesseeWalker_GoldPalomino_PC`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'MahoganyBay',
        model       = `A_C_Horse_TennesseeWalker_MahoganyBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'RedRoan',
        model       = `A_C_Horse_TennesseeWalker_RedRoan`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BlackChestnut',
        model       = `A_C_Horse_Thoroughbred_BlackChestnut`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'BloodBay',
        model       = `A_C_Horse_Thoroughbred_BloodBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Brindle',
        model       = `A_C_Horse_Thoroughbred_Brindle`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'DappleGrey',
        model       = `A_C_Horse_Thoroughbred_DappleGrey`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'ReverseDappleBlack',
        model       = `A_C_Horse_Thoroughbred_ReverseDappleBlack`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'TurkomanDarkBay',
        model       = `A_C_Horse_Turkoman_DarkBay`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Gold',
        model       = `A_C_Horse_Turkoman_Gold`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Silver',
        model       = `A_C_Horse_Turkoman_Silver`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Winter2',
        model       = `A_C_Horse_Winter02_01`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Mule',
        model       = `A_C_HorseMule_01`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'MulePainted',
        model       = `A_C_HorseMulePainted_01`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },
    { 
        name        = 'Horse',
        model       = `P_C_Horse_01`,
        rewardmoney = math.random(15, 30),
        rewarditem  = 'water'
    },      
}
