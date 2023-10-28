local onTimerWeed = {}
local LastEntity = nil
lib.callback.register('drc_drugs:weed:getitem', function(source, type, entity)
    if type == "WeedPick" then
        if LastEntity ~= entity then
            LastEntity = entity
            local number = 0
            for k, v in pairs(Config.Weed.Pickup.RequiredItems) do
                if GetItem(v.item, v.count, source) then
                    number = number + 1
                end
            end
            if number == #Config.Weed.Pickup.RequiredItems then
                return true
            else
                return false
            end
        else
            return 1
        end
    elseif type == "WeedClean" then
        local number = 0
        for k, v in pairs(Config.Weed.Clean.RequiredItems) do
            if GetItem(v.item, v.count, source) then
                number = number + 1
            end
        end
        if number == #Config.Weed.Clean.RequiredItems then
            return true
        else
            return false
        end
    elseif type == "WeedPack" then
        local number = 0
        for k, v in pairs(Config.Weed.Package.RequiredItems) do
            if GetItem(v.item, v.count, source) then
                number = number + 1
            end
        end
        if number == #Config.Weed.Package.RequiredItems then
            return true
        else
            return false
        end
    end
end)

RegisterServerEvent("drc_drugs:weed:giveitems")
AddEventHandler("drc_drugs:weed:giveitems", function(type, entity)
    if onTimerWeed[source] and onTimerWeed[source] > GetGameTimer() then
        Logs(source, "Drugs (weed, Timer): Player Tried to exploit Event")
        BanPlayer(source, "Drugs (weed, Timer): Player Tried to exploit Event")
        if Config.DropPlayer then
            DropPlayer(source, "Drugs: Player Tried to exploit Event")
        end
        return
    end
    local srcCoords = GetEntityCoords(GetPlayerPed(source))
    if type == "WeedPick" then
        local dist = #(Config.Weed.Lab.coords - srcCoords)
        if dist <= 100 then
            local number = 0
            for k, v in pairs(Config.Weed.Pickup.RequiredItems) do
                if GetItem(v.item, v.count, source) then
                    number = number + 1
                end
            end
            if number == #Config.Weed.Pickup.RequiredItems then
                for k, v in pairs(Config.Weed.Pickup.RequiredItems) do
                    if v.remove then
                        RemoveItem(v.item, v.count, source)
                    end
                end
                for k, v in pairs(Config.Weed.Pickup.AddItems) do
                    AddItem(v.item, v.count, source)
                end
                onTimerWeed[source] = GetGameTimer() + (2 * 1000)
                Logs(source, Config.Weed.Pickup.Log)
            end
        else
            Logs(source, "Drugs (weed, coords): Player Tried to exploit Event")
            BanPlayer(source, "Drugs (weed, Coords): Player Tried to exploit Event")
            if Config.DropPlayer then
                DropPlayer(source, "Drugs: Player Tried to exploit Event")
            end
        end
    elseif type == "WeedClean" then
        local dist = #(Config.Weed.Clean.coords - srcCoords)
        if dist <= 20 then
            local number = 0
            for k, v in pairs(Config.Weed.Clean.RequiredItems) do
                if GetItem(v.item, v.count, source) then
                    number = number + 1
                end
            end
            if number == #Config.Weed.Clean.RequiredItems then
                for k, v in pairs(Config.Weed.Clean.RequiredItems) do
                    if v.remove then
                        RemoveItem(v.item, v.count, source)
                    end
                end
                for k, v in pairs(Config.Weed.Clean.AddItems) do
                    AddItem(v.item, v.count, source)
                end
                onTimerWeed[source] = GetGameTimer() + (2 * 1000)
                Logs(source, Config.Weed.Clean.Log)
            end
        else
            Logs(source, "Drugs (weed, coords): Player Tried to exploit Event")
            BanPlayer(source, "Drugs (weed, Coords): Player Tried to exploit Event")
            if Config.DropPlayer then
                DropPlayer(source, "Drugs: Player Tried to exploit Event")
            end
        end
    elseif type == "WeedPack" then
        local dist = #(Config.Weed.Package.coords - srcCoords)
        if dist <= 20 then
            local number = 0
            for k, v in pairs(Config.Weed.Package.RequiredItems) do
                if GetItem(v.item, v.count, source) then
                    number = number + 1
                end
            end
            if number == #Config.Weed.Package.RequiredItems then
                for k, v in pairs(Config.Weed.Package.RequiredItems) do
                    if v.remove then
                        RemoveItem(v.item, v.count, source)
                    end
                end
                for k, v in pairs(Config.Weed.Package.AddItems) do
                    AddItem(v.item, v.count, source)
                end
                onTimerWeed[source] = GetGameTimer() + (2 * 1000)
                Logs(source, Config.Weed.Package.Log)
            end
        else
            Logs(source, "Drugs (weed, coords): Player Tried to exploit Event")
            BanPlayer(source, "Drugs (weed, Coords): Player Tried to exploit Event")
            if Config.DropPlayer then
                DropPlayer(source, "Drugs: Player Tried to exploit Event")
            end
        end
    end
end)
