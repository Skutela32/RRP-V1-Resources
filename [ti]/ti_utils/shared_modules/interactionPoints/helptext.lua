local function showHelpText(msg)
    AddTextEntry('ti_utils_help_text', msg)
    DisplayHelpTextThisFrame('ti_utils_help_text', false)
end

local mt = {}

function mt:render(dist)
    if not self.interact_dist or dist > self.interact_dist then
        showHelpText(self.text_far)
        return
    end

    showHelpText(self.text_near)

    if not self.interact_control or not IsControlJustPressed(0, self.interact_control) then
        return
    end
    
    self:onInteract()
end

local extended = Extend(InteractionPoint, mt)

local function helpText(obj, ip, onInteract)
    return extended:new({
        text_near = ip.text_near,
        text_far = ip.text_far,
        interact_dist = ip.interact_dist,
        interact_control = ip.interact_control,
        onInteract = onInteract
    })
end

_ENV.HelpText = helpText