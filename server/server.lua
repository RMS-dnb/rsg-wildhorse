local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent('rsg-sellwildhorse:server:reward')
AddEventHandler('rsg-sellwildhorse:server:reward', function(rewardmoney, rewarditem, riding)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local firstname = xPlayer.PlayerData.charinfo.firstname
    local lastname = xPlayer.PlayerData.charinfo.lastname
    local xp = Config.Xp
    if Config.Debug == true then
        print("money: "..tostring(rewardmoney))
        print("item: "..tostring(rewarditem))
        print("riding: "..tostring(riding))
    end
    if riding == 'sold' then
        xPlayer.Functions.AddMoney(Config.PaymentType, rewardmoney * Config.SaleMultiplier)
        xPlayer.Functions.AddItem(rewarditem, 1)
        xPlayer.Functions.AddXp('main', xp)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], "add")
    end
    TriggerEvent('rsg-log:server:CreateLog', 'testwebhook', 'WILD HORSE 🐎', 'yellow', firstname..' '..lastname..' Horse sold for '..rewardmoney..' 💰 ')
end)
