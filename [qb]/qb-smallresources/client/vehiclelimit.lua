local maxSpeeds = {
    [0] = 180.0,   -- Compacts
    [1] = 180.0,   -- Sedans
    [2] = 180.0,   -- SUVs
    [3] = 180.0,   -- Coupes
    [4] = 180.0,   -- Muscle
    [5] = 180.0,   -- Sports Classics
    [6] = 180.0,   -- Sports
    [7] = 180.0,   -- Super
    [8] = 180.0,   -- Motorcycles
    [9] = 180.0,   -- Off-road
    [10] = 180.0,  -- Industrial
    [11] = 180.0,  -- Utility
    [12] = 180.0,  -- Vans
    [13] = 180.0,  -- Cycles
    [14] = 180.0,  -- Boats
    [15] = 180.0,  -- Helicopters
    [16] = 180.0,  -- Planes
    [17] = 180.0,  -- Service
    [18] = 180.0,  -- Emergency
    [19] = 180.0,  -- Military
    [20] = 180.0,  -- Commercial
    [21] = 1000.0   -- Trains
  }
  
  Citizen.CreateThread(function()
    while true do 
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local speed = GetEntitySpeed(vehicle)
        local mph = 2.23694  -- Conversion factor from km/h to mph
        local vehicleClass = GetVehicleClass(vehicle)
        local maxSpeed = maxSpeeds[vehicleClass]
        
        Citizen.Wait(10)
        
        if maxSpeed then
            if math.floor(speed * mph) == maxSpeed then
                cruise = GetEntitySpeed(vehicle)
                SetEntityMaxSpeed(vehicle, cruise)
            else
                SetEntityMaxSpeed(vehicle, maxSpeed)
            end
        end
    end
  end)