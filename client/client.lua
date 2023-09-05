local RSGCore = exports['rsg-core']:GetCoreObject()

local createdEntries = {}
local selling = false
local cooldown = false
local cooldowntimer = 0

-- Delete Entity
local DeleteThis = function(horse)
    NetworkRequestControlOfEntity(horse)
    SetEntityAsMissionEntity(riding, true, true)

    Wait(100)

    DeleteEntity(horse)

    Wait(500)

    local ped = PlayerPedId()
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
    local ridingcheck = GetPedType(entitycheck)

    if ridingcheck == 0 then return true end

    return false
end

-- Prompts
CreateThread(function()
    for i = 1, #Config.SellWildHorseLocations do
        local loc = Config.SellWildHorseLocations[i]
        local name = loc.name
        local location = loc.location
        local coords = loc.coords
        local showblip = loc.showblip

        exports['rsg-core']:createPrompt(location, coords, RSGCore.Shared.Keybinds['J'], Lang:t('menu.open')..name,
        {
            type = 'client',
            event = 'rsg-sellwildhorse:client:menu',
            args = {name}
        })

        createdEntries[#createdEntries + 1] = {type = 'PROMPT', handle = location}

        if showblip then
            local SellWildHorseBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords)

            SetBlipSprite(SellWildHorseBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SellWildHorseBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SellWildHorseBlip, Config.Blip.blipName)

            createdEntries[#createdEntries + 1] = {type = 'BLIP', handle = SellWildHorseBlip}
        end
    end
end)

-- Sell Wild Horse Menu
RegisterNetEvent('rsg-sellwildhorse:client:menu', function(name)
    if selling then return end

    if Config.EnableCooldown and cooldowntimer > 0 then
        local time = 'seconds'
        local timer = cooldowntimer

        if cooldowntimer > 60 then
            timer = math.floor(cooldowntimer / 60)
            time = 'minutes'
        end

        RSGCore.Functions.Notify('You need to wait '..timer..' '..time..' before selling another Wild Horse!', 'error', 3000)

        return
    end
    
    lib.registerContext(
        {
            id = 'sellhorse_menu',
            title = name,
            position = 'top-right',
            options = {
                {
                    title = Lang:t('menu.sell_stored_horse'),
                    description = Lang:t('text.sell_store_horse'),
                    icon = 'fas fa-paw',
                    event = 'rsg-sellwildhorse:client:sellhorse',
                   
                },
                {
                    title = Lang:t('menu.save_stored_horse'),
                    description = Lang:t('text.save_store_horse'),
                    icon = 'fas fa-paw',
                    event = 'rms-wildhorsestable:client:wildhorsestable',
                },
            }
        }
    )
    lib.showContext('sellhorse_menu')
    
end)

-- Sell Horse Event
AddEventHandler('rsg-sellwildhorse:client:sellhorse', function()
    local ped = PlayerPedId()
    local horse = Citizen.InvokeNative(0xE7E11B8DCBED1058, ped)
    local myhorse = exports['rsg-horses']:CheckActiveHorse()
    local model = GetEntityModel(horse)
    local owner = Citizen.InvokeNative(0xF103823FFE72BB49, horse)
    selling = true

    if Config.Debug then
        print("Rider    : "..tostring(ped))
        print("Horse    : "..tostring(horse))
        print("Model    : "..tostring(model))
        print("Owner    : "..tostring(owner))
    end

    if not horse or horse == 0 then
        RSGCore.Functions.Notify(Lang:t('error.you_dont_have_any_horse_to_sell'), 'error', 3000)

        Wait(3000)

        selling = false

        return
    end

    if not owner or owner ~= ped then
        RSGCore.Functions.Notify(Lang:t('error.not_tamed'), 'error', 3000)

        Wait(3000)

        selling = false

        return
    end

    if myhorse and myhorse ~= 0 then
        RSGCore.Functions.Notify(Lang:t('error.owned_horse'), 'error', 3000)

        Wait(3000)

        selling = false

        return
    end

    for i = 1, #Config.Horse do
        local horses = Config.Horse[i]
        local models = horses.model

        if model == models then
            local name = horses.name
            local rewardmoney = horses.rewardmoney
            local rewarditem = horses.rewarditem

            if Config.Debug then
                print("Horse Model  : "..tostring(model))
                print("Reward Money : "..tostring(rewardmoney))
                print("Reward Item  : "..tostring(rewarditem))
            end

            RSGCore.Functions.Progressbar('sell-horse', Lang:t('progressbar.checking_horse')..name, Config.SellTime, false, true,
            {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                local deleted = DeleteThis(horse)

                if deleted then
                    TriggerServerEvent('rsg-sellwildhorse:server:reward', rewardmoney, rewarditem)

                    Wait(3000)

                    selling = false

                    if Config.EnableCooldown then
                        TriggerEvent('rsg-sellwildhorse:client:Cooldown')
                    end

                    return
                end
            end)
        end
    end

    selling = false
end)

AddEventHandler('rsg-sellwildhorse:client:Cooldown', function()
    if cooldown then return end

    CreateThread(function()
        cooldowntimer = Config.Cooldown
        cooldown = true

        while true do
            Wait(1000)

            cooldowntimer = cooldowntimer - 1

            if cooldowntimer <= 0 then
                cooldowntimer = 0
                cooldown = false

                return
            end
        end
    end)
end)

if Config.Debug then
    RegisterNetEvent('rsg-sellwildhorse:client:SetHorseAsWild')
    AddEventHandler('rsg-sellwildhorse:client:SetHorseAsWild', function()
        local ped = PlayerPedId()
        local mount = GetMount(ped)

        if mount then
            Citizen.InvokeNative(0xAEB97D84CDF3C00B, mount, true)
        end
    end)
end

-- Cleanup
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    FreezeEntityPosition(PlayerPedId(), false)

    for i = 1, #createdEntries do
        if createdEntries[i].type == 'PROMPT' then
            if createdEntries[i].handle then
                exports['rsg-core']:deletePrompt(createdEntries[i].handle)
            end
        end

        if createdEntries[i].type == 'BLIP' then
            if createdEntries[i].handle then
                RemoveBlip(createdEntries[i].handle)
            end
        end
    end
end)


---save Wild Horse to stables

local RSGCore = exports['rsg-core']:GetCoreObject()

local createdEntries = {}
local selling = false
local cooldown = false
local cooldowntimer = 0

-- Function to check if the horse is wild and untamed
function CheckIfHorseIsWildAndUntamed(model)
    -- Add your logic here to check if the horse is wild and untamed (e.g., check horse attributes)
    return true -- Return true if wild and untamed, false if not
end

function SaveWildHorseToDatabase(model, horseName, gender)
    local player = source -- Assuming this function is triggered by a player source
    local playerName = GetPlayerName(player)

    -- Adapt this SQL statement to your database structure
    local query = [[
        INSERT INTO wild_horses (player_name, model, horse_name, gender)
        VALUES (@playerName, @model, @horseName, @gender)
    ]]

    local params = {
        ["@playerName"] = playerName,
        ["@model"] = model,
        ["@horseName"] = horseName,
        ["@gender"] = gender
    }

    -- Execute the SQL query (replace 'mysql-async' with your database library)
    exports['mysql-async']:mysql_execute(query, params)
    
    -- Trigger the DeleteVehicle event after saving the horse
    TriggerClientEvent('RSGCore:Command:DeleteVehicle', source)
    
    
end






  -- Save Wild Horse Event (Client-Side)
AddEventHandler('rms-wildhorsestable:client:wildhorsestable', function()
    local ped = PlayerPedId()
    local horse = Citizen.InvokeNative(0xE7E11B8DCBED1058, ped)
    local myhorse = exports['rsg-horses']:CheckActiveHorse()
    local model = GetEntityModel(horse)
    local owner = Citizen.InvokeNative(0xF103823FFE72BB49, horse)
    local player = source 

    if Config.Debug then
        print("Rider    : "..tostring(ped))
        print("Horse    : "..tostring(horse))
        print("Model    : "..tostring(model))
        print("Owner    : "..tostring(owner))
    end

    if not horse or horse == 0 then
        RSGCore.Functions.Notify(Lang:t('error.you_dont_have_any_horse_to_save'), 'error', 3000)
        Wait(3000)
        return
    end

    if not owner or owner ~= ped then
        RSGCore.Functions.Notify(Lang:t('error.not_tamed'), 'error', 3000)
        Wait(3000)
        return
    end

    if myhorse and myhorse ~= 0 then
        RSGCore.Functions.Notify(Lang:t('error.owned_horse'), 'error', 3000)
        Wait(3000)
        return
    end

    -- Check if the horse is wild and untamed before saving
    if not CheckIfHorseIsWildAndUntamed(model) then
        RSGCore.Functions.Notify('You can only save wild and untamed horses!', 'error', 3000)
        Wait(3000)
        return
    end

    -- Prompt the player to enter horse details (name and gender)
    local horseName = GetUserInput("Enter horse name:")
    local gender = GetUserInput("Enter horse gender (Male/Female):")

    if horseName and gender then
        TriggerServerEvent('rms-wildhorsestable:server:WildHorseStable', model, horseName, gender)
        
        
    else
        RSGCore.Functions.Notify('Invalid horse name or gender.', 'error', 3000)
    end
end)

-- Function to get user input via a modal dialog (with text prompt)
function GetUserInput(prompt, defaultText)
    local input = defaultText or ""
    AddTextEntry("FMMC_KEY_TIP8", prompt)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 30)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        input = GetOnscreenKeyboardResult()
        Wait(500)
    end
    return input
end

-- Your existing code for cooldown handling
-- Your existing code for setting horses as wild (debug)

-- Cleanup
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    FreezeEntityPosition(PlayerPedId(), false)

    for i = 1, #createdEntries do
        if createdEntries[i].type == 'PROMPT' then
            if createdEntries[i].handle then
                exports['rsg-core']:deletePrompt(createdEntries[i].handle)
            end
        end

        if createdEntries[i].type == 'BLIP' then
            if createdEntries[i].handle then
                RemoveBlip(createdEntries[i].handle)
            end
        end
    end
end)

