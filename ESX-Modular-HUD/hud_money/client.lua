-- Mettre à jour les comptes et le job
RegisterNetEvent('hud:updateAccounts', function(data)
    -- data = {accounts = {...}, job = {...}}
    SendNUIMessage({
        action = 'updateMoney',
        money = data.accounts.money,
        black = data.accounts.black_money,
        bank = data.accounts.bank
    })

    SendNUIMessage({
        action = 'updateJob',
        jobLabel = data.job.label,
        jobGrade = data.job.grade_label
    })
end)

-- Thread pour récupérer les comptes toutes les secondes
CreateThread(function()
    while true do
        TriggerServerEvent('hud:getAccounts')
        Wait(1000)
    end
end)

-- Mise à jour au spawn du joueur
AddEventHandler('playerSpawned', function()
    Wait(3000)
    TriggerServerEvent('hud:getAccounts')
end)
