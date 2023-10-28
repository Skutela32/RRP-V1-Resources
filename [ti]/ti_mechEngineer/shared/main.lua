function CanAddItem(engine, category)
    if category == "block" then
        return false
    end

    local requires = {
        intercooler = {'aspiration'},
        aspiration = {'headers','intake'},
        intake = {'fuel'},
        fuel = {'heads','valves'},
        heads = {'block'},
        valves = {},
        crankshaft = {'block'},
        conrods = {'crankshaft'},
        pistons = {'conrods'},
        headers = {'block'},
        exhaust = {'headers'},
        nitrous = {'fuel'}
    }

    for _,cat in ipairs(requires[category]) do
        if not engine[cat] then
            return false,cat
        end
    end

    return true
end

function CanRemoveItem(engine, category)
    if category == "block" then
        return false
    end

    local requires = {
        intercooler = {},
        aspiration = {'intercooler'},
        intake = {'aspiration'},
        fuel = {'intake','nitrous'},
        heads = {'aspiration','exhaust','valves'},
        valves = {'intake'},
        crankshaft = {},
        conrods = {'crankshaft'},
        pistons = {'heads','conrods'},
        headers = {'exhaust','aspiration'},
        exhaust = {},
		nitrous = {}
    }

    for _,cat in ipairs(requires[category]) do
        if engine[cat] then
            return false
        end
    end

    return true
end