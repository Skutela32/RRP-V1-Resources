local module = {}

function module.getTime()
    local easyTime = GetResourceState("cd_easytime"):find("start")

    if not easyTime then
        return 1,1,1
    end

    local weather = exports.cd_easytime:GetWeather()

    return weather.hours,weather.mins,1
end

function module.getWeather()
    local easyTime = GetResourceState("cd_easytime"):find("start")

    if not easyTime then
        return 1,1,1
    end

    local weather = exports.cd_easytime:GetWeather()

    return weather.weather
end

return module