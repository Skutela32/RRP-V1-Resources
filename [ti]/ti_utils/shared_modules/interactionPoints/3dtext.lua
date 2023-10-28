local function drawText3D(coords, text, size, font)
    local v = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)

    local camCoords = GetFinalRenderedCamCoord()
    local distance = #(v - camCoords)
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = (size / distance) * 2 * fov

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(v.x, v.y, v.z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local mt = {}

function mt:render(dist)    
    if not self.interact_dist or dist > self.interact_dist then
        drawText3D(self.position, self.text_far, self.size, self.font)
        return
    end

    drawText3D(self.position, self.text_near, self.size, self.font)

    if not self.interact_control or not IsControlJustPressed(0, self.interact_control) then
        return
    end
    
    self:onInteract()
end

local extended = Extend(InteractionPoint, mt)

local function t3d(obj, ip, onInteract)
    local position
    
    if ip.offset then
        position = obj.center + ip.offset
    else
        position = obj.center
    end

    return extended:new({
        position = position,
        text_near = ip.text_near,
        text_far = ip.text_far,
        interact_dist = ip.interact_dist,
        interact_control = ip.interact_control,
        size = ip.size or 1,
        font = ip.font or 0,
        onInteract = onInteract
    })
end

_ENV.T3D = t3d