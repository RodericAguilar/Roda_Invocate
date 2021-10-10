if Config.framework == 'esx' then 
    
    ESX = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(10)
        end
    end)

elseif Config.framework == 'qbcore' then 
    QBCore = exports['qb-core']:GetCoreObject()
end

local tiempo = Config.Time
local tiempocol = Config.Cooldown
local segundos = 0
local cooldown = 0
local transformado = false
local cooldownstring = false

RegisterNetEvent("Roda-ApplyEfect")
AddEventHandler("Roda-ApplyEfect", function()
    if Config.InteracSound then 
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'risa', 1.0)
    end
    Citizen.Wait(1000)
    local particleAsset = Config.Diccionario
    local particleName = Config.Particula
    local coords = GetEntityCoords(PlayerPedId())
    
    RequestNamedPtfxAsset(particleAsset)
    
    while not HasNamedPtfxAssetLoaded(particleAsset) do
        Citizen.Wait(1)
    end

    UseParticleFxAssetNextCall(particleAsset)
    StartParticleFxNonLoopedAtCoord(particleName, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false, false)
    local Ped = GetHashKey(Config.RandomPeds[math.random(1, #Config.RandomPeds)])
    RequestModel(Ped)
    while not HasModelLoaded(Ped) do
    Wait(100)
    end

    Citizen.Wait(1000)
    SetPlayerModel(PlayerId(), Ped)
    SetModelAsNoLongerNeeded(Ped)
    transformado = true
    cooldownstring = true
    segundos = tiempo
    cooldown = tiempocol
end)


Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if transformado then
            sleep = 1000
            if cooldown > 0 then 
                segundos = segundos -1
                cooldown = cooldown -1
                SendNUIMessage({
                    trans = true; 
                    vel = segundos; 
                    cooldown2 = cooldown;
                })
                if segundos == 0 then 
                    GetOwnSkin()
                end
            else
                SendNUIMessage({
                    trans = false; 
                })
                transformado = false
            end
        end
        Citizen.Wait(sleep)
    end
end)


Citizen.CreateThread(function()
    while true do
        local sleep = 500
        if cooldown  > 0 then
            sleep = 0
            DisableControlAction(0, 289	, true) -- F2
            DisableControlAction(1, 25, true )
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 23, true)
        end
        Citizen.Wait(sleep)
    end
end)


function GetOwnSkin()

    local particleAsset = Config.DiccionarioDissapear
    local particleName = Config.ParticulaDissapear
    local coords = GetEntityCoords(PlayerPedId())

if Config.framework == 'esx' then
 

    RequestNamedPtfxAsset(particleAsset)
    
    while not HasNamedPtfxAssetLoaded(particleAsset) do
        Citizen.Wait(1)
    end
    if Config.InteracSound then 
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'end', 1.0)
    end
    Citizen.Wait(1000)
    UseParticleFxAssetNextCall(particleAsset)
    StartParticleFxNonLoopedAtCoord(particleName, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false, false)

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local model = nil
    
        if skin.sex == 0 then
          model = GetHashKey("mp_m_freemode_01")
        else
          model = GetHashKey("mp_f_freemode_01")
        end
    
        RequestModel(model)
        while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(1)
        end
    
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
    
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
elseif Config.framework == 'qbcore' then 
    RequestNamedPtfxAsset(particleAsset)
    
    while not HasNamedPtfxAssetLoaded(particleAsset) do
        Citizen.Wait(1)
    end
    if Config.InteracSound then 
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'end', 1.0)
    end
    SetPlayerInvincible(PlayerId(), false)
    TriggerServerEvent("qb-clothes:loadPlayerSkin") 
    UseParticleFxAssetNextCall(particleAsset)
    StartParticleFxNonLoopedAtCoord(particleName, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false, false)
end

end
