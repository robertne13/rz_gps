local postals = LoadResourceFile(GetCurrentResourceName(), GetResourceMetadata(GetCurrentResourceName(), 'postal_file'))
postals = json.decode(postals)

Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)

RegisterKeyMapping(Config.command, Config.MessageCommand, 'keyboard', Config.keyDefault)

local enabled = false

RegisterCommand(Config.command,function ()
    local coords = GetEntityCoords(PlayerPedId())
    local nearestCode, distanceInMeters = findNearestCodeOptimized(coords, postals)
    SendNUIMessage({ action = 'show', code = Config.locationText ..nearestCode, meters = " (".. distanceInMeters .."m)", opentime = Config.OpenTime*1000, style = Config.Color , styleBack = Config.backgroundColor, styleFont = Config.fontColor})
    enabled = true 
    Citizen.Wait(Config.OpenTime*1000)
    enabled = false
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
        while enabled do 
            Citizen.Wait(Config.updateRate)
            local coords = GetEntityCoords(PlayerPedId())
            local nearestCode, distanceInMeters = findNearestCodeOptimized(coords ,postals)
            SendNUIMessage({ action = 'updatecoords', code = Config.locationText.." "..nearestCode, meters = " (".. distanceInMeters .."m)"})
        end
    end
end)

-- Essentials
function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end


function findNearestCodeOptimized(coords, jsonData)
    local minDistance = math.huge
    local nearestIndex = nil
    
    for i, item in ipairs(jsonData) do
        local x, y = item.x, item.y
        local dx, dy = coords.x - x, coords.y - y
        local d = math.sqrt(dx * dx + dy * dy)
        
        if not nearestIndex or d < minDistance then
            nearestIndex = i
            minDistance = d
        end
    end
    
    local nearestCode = jsonData[nearestIndex].code
    local distanceInMeters = string.format("%.2f", minDistance)
    
    return nearestCode, distanceInMeters
end