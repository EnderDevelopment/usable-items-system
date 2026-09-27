local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bandage', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('usable_items:useItem', source, 'bandage')
end)

ESX.RegisterUsableItem('medkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('usable_items:useItem', source, 'medkit')
end)

RegisterNetEvent('usable_items:useItemServer')
AddEventHandler('usable_items:useItemServer', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Config.UsableItems[itemName] then
        local itemConfig = Config.UsableItems[itemName]

        if itemConfig.removeItem then
            xPlayer.removeInventoryItem(itemName, 1)
        end

        if itemConfig.healAmount then
            xPlayer.addHealth(itemConfig.healAmount)
        end

        TriggerClientEvent('esx:showNotification', source, 'You used ' .. itemConfig.label)
    end
end)