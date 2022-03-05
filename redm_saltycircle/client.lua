-- Made by hobbs --
local markerType = 0x94FDAE17 -- Change Marker of your choice - https://github.com/femga/rdr3_discoveries/blob/master/graphics/markers/marker_types.lua

local markerColorR = 205 -- Change Marker color (R)
local markerColorG = 0 -- Change Marker color (G)
local markerColorB = 0 -- Change Marker color (B)
local markerAlpha = 0.1 -- Marker opacity (0.0-1.0)

local afterBurn = 1000 -- How long do you want to see the marker after changing the range?

local isDrawing = false -- hands off!
local curProx = 0.0 -- hands off!

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(range)
   
    isDrawing = true
    curProx = tonumber(range)

    CreateThread(function() 
     drawMarker()
    end)
    Wait(afterBurn)
   
    isDrawing = false

end)

function drawMarker()
       
    while isDrawing do
          
        local posPlayer = GetEntityCoords(PlayerPedId())
     
        Citizen.InvokeNative(0x2A32FAA57B937173, markerType, posPlayer.x, posPlayer.y, posPlayer.z - 0.7, 0, 0, 0, 0, 0,0, curProx * 2, curProx * 2, 0.8001, markerColorR, markerColorG, markerColorB, markerAlpha, 0, 0, 0)

        Wait(1)

    end

end
