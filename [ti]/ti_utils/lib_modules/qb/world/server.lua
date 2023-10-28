local module = {}

function module.getTime()
    local easyTime = GetResourceState("cd_easytime"):find("start")

    if not easyTime then
        local hours,minutes = exports["qb-weathersync"]:getTime()
        local seconds = 1

        return hours,minutes,seconds
    else
        local weather = exports.cd_easytime:GetWeather()
    
        return weather.hours,weather.mins,1
    end
end

function module.getWeather()
    local easyTime = GetResourceState("cd_easytime"):find("start")

    if not easyTime then
        return exports["qb-weathersync"]:getWeatherState()
    else
        local weather = exports.cd_easytime:GetWeather()
    
        return weather.weather
    end
end

return module