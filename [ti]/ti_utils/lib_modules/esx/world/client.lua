local module = {}

function module.getTime()
    local hours = GetClockHours()
    local minutes = GetClockMinutes()
    local seconds = GetClockSeconds()

    return hours,minutes,seconds
end

return module