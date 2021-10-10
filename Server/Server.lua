local cooldown = 1
local puedo = true
if Config.framework == 'esx' then 
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)   
    for k,v in pairs(Config.ItemsToUse) do 
        ESX.RegisterUsableItem(v, function(source)
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
                TriggerEvent('checkCoolsv')
                xPlayer.removeInventoryItem(v, 1)
                TriggerClientEvent('Roda-ApplyEfect', _source)
                TriggerEvent('Roda-Invocation:SendDiscordLogs','log', 'Transform', 'green', 'The user **['.._source..'] '..GetPlayerName(_source)..'** use  a **'..v..'**' , false)  --You can put true for @everyone.
        end)
    end 
elseif Config.framework == 'qbcore' then 
    local QBCore = exports['qb-core']:GetCoreObject()
    for k,v in pairs(Config.ItemsToUse) do 
    QBCore.Functions.CreateUseableItem(v, function(source)
        local source = source
        local ply = QBCore.Functions.GetPlayer(source)
        ply.Functions.RemoveItem(v, 1)
        TriggerClientEvent('Roda-ApplyEfect', source)
    end)
    end 
end

