-- Récupération ESX (NOUVELLE MÉTHODE)
ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('hud_food_thirst:getStats', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    local hungerPercent = 100
    local thirstPercent = 100

    if xPlayer then
        -- Récupération des status côté serveur
        local hungerStatus = xPlayer.getStatus('hunger')
        local thirstStatus = xPlayer.getStatus('thirst')

        if hungerStatus and hungerStatus.val then
            local max = hungerStatus._max or hungerStatus.default or 1000000
            hungerPercent = math.floor((hungerStatus.val / max) * 100)
        end

        if thirstStatus and thirstStatus.val then
            local max = thirstStatus._max or thirstStatus.default or 1000000
            thirstPercent = math.floor((thirstStatus.val / max) * 100)
        end
    end

    cb({
        hunger = hungerPercent,
        thirst = thirstPercent
    })
end)
