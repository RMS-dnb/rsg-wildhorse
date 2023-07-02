local RSGCore = exports['rsg-core']:GetCoreObject()

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
    Player.Functions.AddXp('main', xp)

    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], "add")

    RSGCore.Functions.Notify(src, Lang:t('success.you_have_sold_all_your_horse_for')..reward, 'success', 3000)

    TriggerEvent('rsg-log:server:CreateLog', 'testwebhook', 'WILD HORSE 🐎', 'yellow', firstname..' '..lastname..' Horse sold for '..rewardmoney..' 💰 ')
end)