local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-wildhorse/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-----------------------------------------------------------------------

RegisterServerEvent('rsg-sellwildhorse:server:reward')
AddEventHandler('rsg-sellwildhorse:server:reward', function(rewardmoney, rewarditem)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local xp = Config.Xp

    if Config.Debug then
        print("Money    : "..tostring(rewardmoney))
        print("Item     : "..tostring(rewarditem))
    end

    local reward = rewardmoney * Config.SaleMultiplier

    Player.Functions.AddMoney(Config.PaymentType, reward)
    Player.Functions.AddItem(rewarditem, 1)
    --addxp--Player.Functions.AddXp('main', xp)

    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], "add")

    RSGCore.Functions.Notify(src, Lang:t('success.you_have_sold_all_your_horse_for')..reward, 'success', 3000)

    TriggerEvent('rsg-log:server:CreateLog', 'testwebhook', 'WILD HORSE 🐎', 'yellow', firstname..' '..lastname..' Horse sold for '..rewardmoney..' 💰 ')
end)

--save to stables

-- Mapping of horse model hashes to their names
local horseModels = {
    [-1261814606] = "a_c_horse_nokota_whiteroan",
    [1772321403] = "a_c_donkey_01",
    [-1963397600] = "A_C_Horse_AmericanPaint_Greyovero",
    [-450053710] = "A_C_Horse_AmericanPaint_Overo",
    [1792770814] = "A_C_Horse_AmericanPaint_SplashedWhite",
    [-1679658797] = "A_C_Horse_AmericanPaint_Tobiano",
    [-1250098797] = "A_C_Horse_AmericanStandardbred_Black",
    [-318278790] = "A_C_Horse_AmericanStandardbred_Buckskin",
    [55096099] = "A_C_Horse_AmericanStandardbred_PalominoDapple",
    [-458397856] = "A_C_Horse_AmericanStandardbred_SilverTailBuckskin",
    [-444610976] = "A_C_Horse_Andalusian_DarkBay",
    [705691988] = "A_C_Horse_Andalusian_Perlino",
    [746627200] = "A_C_Horse_Andalusian_RoseGray",
    [-1028075925] = "A_C_Horse_Appaloosa_BlackSnowflake",
    [2130094044] = "A_C_Horse_Appaloosa_Blanket",
    [-1029277326] = "A_C_Horse_Appaloosa_BrownLeopard",
    [604357666] = "A_C_Horse_Appaloosa_FewSpotted_PC",
    [-1140650619] = "A_C_Horse_Appaloosa_Leopard",
    [-1554827654] = "A_C_Horse_Appaloosa_LeopardBlanket",
    [-1999198818] = "A_C_Horse_Arabian_Black",
    [84224102] = "A_C_Horse_Arabian_Grey",
    [1496579364] = "A_C_Horse_Arabian_RedChestnut",
    [-1523757120] = "A_C_Horse_Arabian_RedChestnut_PC",
    [-403470324] = "A_C_Horse_Arabian_RoseGreyBay",
    [1576849913] = "A_C_Horse_Arabian_WarpedBrindle_PC",
    [-925223936] = "A_C_Horse_Arabian_White",
    [-1547438906] = "A_C_Horse_Ardennes_BayRoan",
    [-2026265047] = "A_C_Horse_Ardennes_IronGreyRoan",
    [-635239558] = "A_C_Horse_Ardennes_StrawberryRoan",
    [-586898625] = "A_C_Horse_Belgian_BlondChestnut",
    [937246805] = "A_C_Horse_Belgian_MealyChestnut",
    [549900435] = "A_C_Horse_Buell_WarVets",
    [687445866] = "A_C_Horse_DutchWarmblood_ChocolateRoan",
    [861505058] = "A_C_Horse_DutchWarmblood_SealBrown",
    [1593035738] = "A_C_Horse_DutchWarmblood_SootyBuckskin",
    [-1760684159] = "A_C_Horse_Gang_Bill",
    [-548014618] = "A_C_Horse_Gang_Charles",
    [1800725969] = "A_C_Horse_Gang_Charles_EndlessSummer",
    [-1391147923] = "A_C_Horse_Gang_Dutch",
    [-646460384] = "A_C_Horse_Gang_Hosea",
    [-1181161469] = "A_C_Horse_Gang_Javier",
    [-1642485146] = "A_C_Horse_Gang_John",
    [-1486704931] = "A_C_Horse_Gang_Karen",
    [1139858530] = "A_C_Horse_Gang_Kieran",
    [-1053639984] = "A_C_Horse_Gang_Lenny",
    [-941733863] = "A_C_Horse_Gang_Micah",
    [-1084397164] = "A_C_Horse_Gang_Sadie",
    [-575759638] = "A_C_Horse_Gang_Sadie_EndlessSummer",
    [-1718100160] = "A_C_Horse_Gang_Sean",
    [979093383] = "A_C_Horse_Gang_Trelawney",
    [1760888205] = "A_C_Horse_Gang_Uncle",
    [291878635] = "A_C_Horse_Gang_Uncle_EndlessSummer",
    [-819697512] = "A_C_Horse_HungarianHalfbred_DarkDappleGrey",
    [-1896838685] = "A_C_Horse_HungarianHalfbred_LiverChestnut",
    [1705182311] = "A_C_Horse_HungarianHalfbred_FlaxenChestnut",
    [-78273782] = "A_C_Horse_HungarianHalfbred_PiebaldTobiano",
    [-2063289686] = "A_C_Horse_John_EndlessSummer",
    [-147265944] = "A_C_Horse_KentuckySaddle_Black",
    [-1516219602] = "A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC",
    [-1265030920] = "A_C_Horse_KentuckySaddle_ChestnutPinto",
    [2024948086] = "A_C_Horse_KentuckySaddle_Grey",
    [1696286663] = "A_C_Horse_KentuckySaddle_SilverBay",
    [-1342159303] = "A_C_Horse_MissouriFoxTrotter_AmberChampagne",
    [-420599285] = "A_C_Horse_MissouriFoxTrotter_SableChampagne",
    [-1154406788] = "A_C_Horse_MissouriFoxTrotter_SilverDapplePinto",
    [2030804811] = "A_C_Horse_Morgan_Bay",
    [1230359523] = "A_C_Horse_Morgan_BayRoan",
    [-1038436471] = "A_C_Horse_Morgan_FlaxenChestnut",
    [-1063137731] = "A_C_Horse_Morgan_LiverChestnut_PC",
    [96930969] = "A_C_Horse_Morgan_Palomino",
    [808655744] = "A_C_Horse_MP_Mangy_Backup",
    [917402668] = "A_C_Horse_MurfreeBrood_Mange_01",
    [-914712122] = "A_C_Horse_MurfreeBrood_Mange_02",
    [-598917269] = "A_C_Horse_MurfreeBrood_Mange_03",
    [-2145697477] = "A_C_Horse_Nokota_BlueRoan",
    [107013696] = "A_C_Horse_Nokota_ReverseDappleRoan",
    [-1230516683] = "A_C_HorseMule_01",
    [594040097] = "A_C_HorseMulePainted_01",
    [-363708904] = "P_C_horse_01",
    [1072019803] = "A_C_Horse_tennesseewalker_blackrabicano",--
    [1074477367] = "a_c_horse_tennesseewalker_chestnut",
    [-85890205] = "a_c_horse_tennesseewalker_dapplebay",
    [-1667789645] = "a_c_horse_tennesseewalker_flaxenroan",
    [1048964673] = "A_C_Horse_TennesseeWalker_GoldPalomino_PC",
    [446670976] = "a_c_horse_tennesseewalker_mahoganybay",
    [-727455979] = "a_c_horse_tennesseewalker_redroan",
    -- Add more mappings for other horse models here
}

--main
RegisterServerEvent('rms-wildhorsestable:server:WildHorseStable')
AddEventHandler('rms-wildhorsestable:server:WildHorseStable', function(modelHash, horsename, gender)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    -- Define the required job and item
    local requiredJob = "horsetrainer" -- Change this to your desired job name or identifier
    local requiredItem = "saddlebag" -- Change this to the item name or identifier

    -- Check if the player has the required job "horsetrainer"
    if Player.PlayerData.job.name ~= requiredJob then
        RSGCore.Functions.Notify(src, 'You need to be a horsetrainer to save a wild horse.', 'error', 3000)
        return
    end

    -- Check if the player has the required item "saddlebag" and remove it
    if Player.Functions.RemoveItem(requiredItem, 1) then
        -- Check if the provided modelHash exists in the mapping table
        local modelName = horseModels[modelHash]

        if not modelName then
            RSGCore.Functions.Notify(src, 'Invalid horse model.', 'error', 3000)
            return
        end

        -- Function to generate a unique horse ID
        local function GenerateHorseid()
            local seed = tonumber(tostring(os.time()):reverse():sub(1, 6)) -- Get a 6-digit timestamp-based seed
            math.randomseed(seed)
            local randomNum = math.random(10000, 99999)
            return tostring(seed) .. tostring(randomNum)
        end

        local horseid = GenerateHorseid()

		-- Insert the wild horse into the 'player_horses' table as a wild horse, you are able to monitor how many horses are caught in the wild.
		MySQL.Async.insert('INSERT INTO player_horses(citizenid, horseid, name, horse, gender, active, wild) VALUES(@citizenid, @horseid, @name, @horse, @gender, @active, @wild)', {
			['@citizenid'] = Player.PlayerData.citizenid,
			['@horseid'] = horseid,
			['@name'] = horsename,
			['@horse'] = modelName, -- Store the model name instead of the hash
			['@gender'] = gender,
			['@active'] = false,
			['@wild'] = true,
		}, function(inserted)
			if inserted then
				RSGCore.Functions.Notify(src, 'You have successfully saved a wild horse and used your saddle bag.', 'success', 3000)
				
				-- Trigger the client event to delete the horse entity
				TriggerClientEvent('RSGCore:Command:DeleteVehicle', src)
			  
			else
				RSGCore.Functions.Notify(src, 'Failed to save the wild horse. Please try again later.', 'error', 3000)
				-- Add code for handling the case where the horse insertion fails, such as returning the item to the player.
			end
		end)
    else
        RSGCore.Functions.Notify(src, 'You need a saddlebag to save a wild horse.', 'error', 3000)
    end
end)

--debug
if Config.Debug then
    -- Debug Command to Set Any Horse as Wild Horse
    RSGCore.Commands.Add('sethorsewild', 'Make current Horse a Wild Horse to test/debug Horse Taming activity', {}, false, function(source)
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)

        if not Player then return end

        TriggerClientEvent('sellwild:client:SetHorseAsWild', src)
    end, 'admin')
end

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
