local module = {}

-- Render scaleforms
module.drawFullscreen = function(sf, r, g, b, a)
  DrawScaleformMovieFullscreen(sf, r or 255, g or 255, b or 255, a or 255, 0)
end

-- Load scaleforms
module.loadMovie = function(name)
  local scaleform = RequestScaleformMovie(name)

  while not HasScaleformMovieLoaded(scaleform) do
    Wait(0)
  end

  return scaleform
end

module.loadInteractive = function(name)
  local scaleform = RequestScaleformMovieInteractive(name)

  while not HasScaleformMovieLoaded(scaleform) do
    Wait(0)
end

  return scaleform
end

module.unloadMovie = function(scaleform)
  SetScaleformMovieAsNoLongerNeeded(scaleform)
end

-- Text & labels
module.loadAdditionalText = function(gxt,count)
  for i=0,count,1 do
    if not HasThisAdditionalTextLoaded(gxt,i) then
      ClearAdditionalText(i, true)
      RequestAdditionalText(gxt, i)

      while not HasThisAdditionalTextLoaded(gxt,i) do
        Wait(0)
      end
    end
  end
end

module.setLabels = function(scaleform,labels)
  BeginScaleformMovieMethod(scaleform, "SET_LABELS")

  for i=1,#labels,1 do
    local txt = labels[i]
    BeginTextCommandScaleformString(txt)
    EndTextCommandScaleformString()
  end

  EndScaleformMovieMethod()
end

module.addInstructionals = function(scaleform,controls)  
  for i=1,#controls,1 do
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(i-1)

    for k=1,#controls[i].codes,1 do
      ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(0, controls[i].codes[k], true))
    end

    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringKeyboardDisplay(controls[i].text)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()
  end

  module.popVoid(scaleform,'DRAW_INSTRUCTIONAL_BUTTONS')
end

-- Push method vals wrappers
module.popMulti =function(scaleform,method,...)
  BeginScaleformMovieMethod(scaleform,method)

  for i=1,select("#",...),1 do
    local v = select(i,...)
    local trueType = module.trueType(v)

    if trueType == "string" then      
      ScaleformMovieMethodAddParamTextureNameString(v)
    elseif trueType == "boolean" then
      ScaleformMovieMethodAddParamBool(v)
    elseif trueType == "integer" then
      ScaleformMovieMethodAddParamInt(v)
    elseif trueType == "float" then
      ScaleformMovieMethodAddParamFloat(v)
    end
  end

  EndScaleformMovieMethod()
end

module.popString =function(scaleform,method,val)
  BeginScaleformMovieMethod(scaleform,method)
  ScaleformMovieMethodAddParamTextureNameString(val)
  EndScaleformMovieMethod()
end

module.popBool = function(scaleform,method,val)
  BeginScaleformMovieMethod(scaleform,method)
  ScaleformMovieMethodAddParamBool(val)
  EndScaleformMovieMethod()
end

module.popFloat =function(scaleform,method,val)
  BeginScaleformMovieMethod(scaleform,method)
  ScaleformMovieMethodAddParamFloat(val)
  EndScaleformMovieMethod()
end

module.popInt =function(scaleform,method,val)
  BeginScaleformMovieMethod(scaleform,method)
  ScaleformMovieMethodAddParamInt(val)
  EndScaleformMovieMethod()
end

-- Push no args
module.popRet =function(scaleform,method)                
  BeginScaleformMovieMethod(scaleform, method)
  return EndScaleformMovieMethodReturnValue()
end

module.popVoid =function(scaleform,method)
    BeginScaleformMovieMethod(scaleform, method)
  EndScaleformMovieMethod()
end

-- Get return
module.retBool = function(ret)
  return IsScaleformMovieMethodReturnValueReady(ret)
end

module.retInt = function(ret)
  return GetScaleformMovieMethodReturnValueInt(ret)
end

-- Util functions
module.trueType = function(val)
  if type(val) ~= "number" then return type(val); end
  return math.type(val)
end

return module