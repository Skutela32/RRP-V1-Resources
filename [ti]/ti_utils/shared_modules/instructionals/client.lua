local module = {}

module.init = function()
  local scaleform = ti.scaleforms.loadMovie('INSTRUCTIONAL_BUTTONS')

  ti.scaleforms.popVoid(scaleform,'CLEAR_ALL')
  ti.scaleforms.popInt(scaleform,'SET_CLEAR_SPACE',200)

  return scaleform
end

module.setControls = ti.scaleforms.addInstructionals

module.create = function(controls)
  local scaleform = module.init()

  module.setControls(scaleform,controls)

  return scaleform
end

module.draw = ti.scaleforms.drawFullscreen
module.unload = ti.scaleforms.unloadMovie

return module