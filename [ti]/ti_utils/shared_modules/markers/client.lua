local markers = {}

local function getMarkerById(id)
    for index,marker in ipairs(markers) do
        if marker.id == id then
            return index,marker
        end
    end
end

local function renderMarker(opts)
    DrawMarker(
        opts.type, 
        opts.position,
        opts.direction,
        opts.rotation,
        opts.scale,
        opts.color.r,
        opts.color.g,
        opts.color.b,
        opts.color.a,
        opts.bobUpAndDown, 
        opts.faceCamera, 
        opts.p19, 
        opts.rotate
    )
end

ti.players.awaitReadyAsync(function()
    while true do
        local waitTime = 500

        if #markers > 0 then
            for _,marker in ipairs(markers) do
                if marker.isInside then
                    renderMarker(marker)
                    waitTime = 0
                end
            end
        else
            waitTime = 1000
        end
        
        Wait(waitTime)
    end
end)

local module = {}

module.register = function(id,position,renderDist,renderOnFoot,renderAsDriver,renderAsPassenger,characterRestrictions,jobRestrictions,groupRestrictions,markerOpts)
    local index = #markers+1
    local _index = getMarkerById(id)

    if _index then
        index = _index
    end

    local point = ti.points.new(position,renderDist,renderOnFoot,renderAsDriver,renderAsPassenger,characterRestrictions,jobRestrictions,groupRestrictions)

    local marker = {
        position = position,
        type = markerOpts.type or 1,
        direction = markerOpts.direction or vec3(0,0,0),
        rotation = markerOpts.rotation or vec3(0,0,0),
        scale = markerOpts.scale or vec3(1,1,1),
        color = markerOpts.color or {r = 255,g = 255,b = 255,a = 255},
        bobUpAndDown = markerOpts.bobUpAndDown or false,
        faceCamera = markerOpts.faceCamera or false,
        p19 = markerOpts.p19 or 2,
        rotate = markerOpts.rotate or false,
        isInside = false,
        point = point
    }

    point:onPointInOut(ti.points.getPlayerPosition,function(inside)
        marker.isInside = inside
    end)

    markers[index] = marker
end

module.refreshPermissions = function(id,...)
    local index,marker = getMarkerById(id)

    if not marker then
        return
    end

    return marker.point:refreshPermissions(...)
end

module.remove = function(id)
    local marker,index = getMarkerById(id)

    if marker then
        marker.point:destroy()
        table.remove(markers,index)
    end
end

return module