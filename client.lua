local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerData = {}
end)

RegisterNetEvent('usable_items:useItem')
AddEventHandler('usable_items:useItem', function(itemName)
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local playerCoords = GetEntityCoords(playerPed)

    if Config.UsableItems[itemName] then
        local itemConfig = Config.UsableItems[itemName]

        ESX.ShowNotification('Using ' .. itemConfig.label .. '...')
        ESX.Progressbar('using_item', 'Using ' .. itemConfig.label, itemConfig.useTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {}, {}, {}, function()
            TriggerServerEvent('usable_items:useItemServer', itemName)
        end)
    end
end)