-- Récupération ESX (NOUVELLE MÉTHODE)
ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local hungerPercent = 100
        local thirstPercent = 100

        -- HUNGER
        TriggerEvent("esx_status:getStatus", "hunger", function(status)
            if status and status.val then
                local raw = status.val
                local max = status._max or status.default or 1000000
                hungerPercent = math.floor((raw / max) * 100)
            end
        end)

        -- THIRST
        TriggerEvent("esx_status:getStatus", "thirst", function(status)
            if status and status.val then
                local raw = status.val
                local max = status._max or status.default or 1000000
                thirstPercent = math.floor((raw / max) * 100)
            end
        end)

        -- Envoi à la NUI
        SendNUIMessage({
            action = "update",
            hunger = hungerPercent,
            thirst = thirstPercent
        })
    end
end)
