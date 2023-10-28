local mt = {}

function mt:render() end
function mt:stop() end

function mt:hide()
    self.visible = false
end

function mt:reveal()
    self.visible = true
end

function mt:delete()
    self = nil
end

_ENV.InteractionPoint = mt