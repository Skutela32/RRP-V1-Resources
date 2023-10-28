local mt = {}

function mt:render(dist)  
    if dist > self.interact_dist then
        if self.rendered then
            self.rendered = false
            ti.menus.close()
        end
    else
        if not self.rendered then
            self.rendered = true

            if self.typeof == "menu" then
                ti.menus.preview(self.elements)
            elseif self.typeof == "input" then
                ti.menus.input(self.elements)
            end
        end
    end
end

function mt:stop()
    if self.rendered then
        self.rendered = false
        ti.menus.close()
    end
end

local extended = Extend(InteractionPoint, mt)

local function menu(obj, ip)
    return extended:new({
        typeof = ip.typeof or "menu",
        rendered = false,
        elements = ip.elements,
        interact_dist = ip.interact_dist or 2.0
    })
end

_ENV.Menu = menu