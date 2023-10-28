local function drawMarker(typeof, pos, dir, rot, scale, color, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
    DrawMarker(
        typeof,
        pos.x,
        pos.y,
        pos.z,
        dir.x,
        dir.y,
        dir.z,
        rot.x,
        rot.y,
        rot.z,
        scale.x,
        scale.y,
        scale.z,
        color.r,
        color.g,
        color.b,
        color.a,
        bobUpAndDown,
        faceCamera,
        p19,
        rotate,
        textureDict,
        textureName,
        drawOnEnts
    )
end

local mt = {}

function mt:render()    
    if not self.interact_dist or dist > self.interact_dist then    
        drawMarker(
            self.marker_type, 
            self.position, 
            self.direction,
            self.rotation,
            self.scale,
            self.color,
            self.bob_up_and_down,
            self.face_camera,
            self.p19,
            self.rotate,
            self.texture_dict,
            self.texture_name,
            self.draw_on_ents
        )
        return
    end

    drawMarker(
        self.marker_type, 
        self.position, 
        self.direction,
        self.rotation,
        self.scale,
        self.color,
        self.bob_up_and_down,
        self.face_camera,
        self.p19,
        self.rotate,
        self.texture_dict,
        self.texture_name,
        self.draw_on_ents
    )

    if not self.interact_control or not IsControlJustPressed(0, self.interact_control) then
        return
    end
    
    self:onInteract()
end

local extended = Extend(InteractionPoint, mt)

local function marker(obj, ip, onInteract)
    local position

    if ip.offset then
        position = obj.center + ip.offset
    else
        position = obj.center
    end

    return extended:new({
        marker_type = ip.marker_type,
        position = position,
        direction = ip.direction or vector3(0,0,0),
        rotation = ip.rotation or vector3(0,0,0),
        scale = ip.scale or vector3(1,1,1),
        color = ip.color or {r = 255, g = 255, b = 255, a = 255},
        bob_up_and_down = ip.bob_up_and_down or false,
        face_camera = ip.face_camera or true,
        p19 = ip.p19 or 2,
        rotate = ip.rotate or false,
        texture_dict = ip.texture_dict or false,
        texture_name = ip.texture_name or false,
        draw_on_ents = ip.draw_on_ents or false,
        onInteract = onInteract
    })
end

_ENV.Marker = marker