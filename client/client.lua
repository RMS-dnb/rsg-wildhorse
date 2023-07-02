local RSGCore = exports['rsg-core']:GetCoreObject()
local sellwildhorse
local name
-----------------------------------------------------------------------------------

-- prompts
Citizen.CreateThread(function()
    for sellwildhorse, v in pairs(Config.SellWildHorseLocations) do
        local name = v.name
        exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds['J'],  Lang:t('menu.open') .. v.name, {
            type = 'client',
            event = 'rsg-sellwildhorse:client:menu',
            args = { name },
        })
        if v.showblip == true then
            local SellWildHorseBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SellWildHorseBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SellWildHorseBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SellWildHorseBlip, Config.Blip.blipName)
        end
    end
end)

-----------------------------------------------------------------------------------

-- sellwildhorse menu
RegisterNetEvent('rsg-sellwildhorse:client:menu', function(sellwildhorse)
    exports['rsg-menu']:openMenu({
        {
            header =  Lang:t('menu.sellwildhorse_menu'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.sell_stored_horse'),
            txt = Lang:t('text.sell_store_horse'),
            icon = "fas fa-paw",
            params = {
                event = 'rsg-sellwildhorse:client:sellhorse',
                isServer = false,
                args = {}
            }
        },
        {
            header = Lang:t('menu.close_menu'),
            txt = '',
            params = {
                event = 'rsg-menu:closeMenu',
            }
        },
    })
end)
-----------------------------------------------------------------------------------
RegisterNetEvent('rsg-sellwildhorse:client:sellhorse')
AddEventHandler('rsg-sellwildhorse:client:sellhorse', function(quality)
    local ped = PlayerPedId()
    local riding = Citizen.InvokeNative(0xE7E11B8DCBED1058, ped)
    local model = GetEntityModel(riding)
    local quality = Citizen.InvokeNative(0x7BCC6087D130312A, riding)
    
    if Config.Debug == true then
        print("model: "..tostring(model))
        print("riding: "..tostring(riding))
        print("quality: "..tostring(quality))
    end 
      
    if riding ~= false then
        for i = 1, #Config.Horse do
            if model == Config.Horse[i].model then
                local name = Config.Horse[i].name
                local model = Config.Horse[i].model
                local rewardmoney = Config.Horse[i].rewardmoney
                local rewarditem = Config.Horse[i].rewarditem
                
                if Config.Debug == true then
                    print("reward money: "..tostring(rewardmoney))
                    print("reward item: "..tostring(rewarditem))
                    print("name: "..tostring(model))
                end
                RSGCore.Functions.Progressbar('sell-horse',  Lang:t('progressbar.checking_horse').. name ..' . . ', Config.SellTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    local deleted = DeleteThis(riding)
                    if deleted then
                        TriggerServerEvent('rsg-sellwildhorse:server:reward', rewardmoney, rewarditem, 'sold') -- poor quality reward
                    else
                        RSGCore.Functions.Notify(Lang:t('error.something_went_wrong'), 'error')
                    end
                end)
            end
        end
    else
        RSGCore.Functions.Notify(Lang:t('error.dont_have_animal'), 'error')
    end
end)

function DeleteThis(riding)
    NetworkRequestControlOfEntity(riding)
    SetEntityAsMissionEntity(riding, true, true)
    Wait(100)
    DeleteEntity(riding)
    Wait(500)
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local ridingcheck = GetPedType(entitycheck)
    if ridingcheck == 0 then
        return true
    else
        return false
    end
end
