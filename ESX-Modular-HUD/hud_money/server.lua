local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('hud:getAccounts', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local accounts = {
        money = xPlayer.getMoney(),
        black_money = xPlayer.getAccount('black_money').money,
        bank = xPlayer.getAccount('bank').money
    }

    local job = {
        label = xPlayer.job.label,
        grade_label = xPlayer.job.grade_label
    }

    -- Envoie comptes + job au client
    TriggerClientEvent('hud:updateAccounts', src, {accounts = accounts, job = job})
end)
