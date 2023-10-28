local ESX = select(2,...)
local xContext = exports['esx_context']

local module = {}

module.preview = function(data)
  xContext:Preview(
    "right",
    {
      {
        title = data.label,
        icon = data.icon,
        description = data.text,
        params = {
          event = data.retEvent,
          args = data.retArgs
        }
      }
    },
    function(menu,ele)
      exports["esx_context"]:Close()

      if (ele.params and ele.params.event) then
        TriggerEvent(ele.params.event,ele.params.args)
      end
    end,
    function()
    end
  )
end

module.open = function(data)
  local eles = {}

  for _,v in ipairs(data) do
    table.insert(eles,{
      unselectable=v.isHeader,
      title=v.label,
      icon=v.icon or "",
      description=v.text,
      disabled=v.disabled,
      params = {
        event = v.retEvent,
        args = v.retArgs
      }
    })
  end

  xContext:Open(
    "right",
    eles,
    function(menu,ele)
      exports["esx_context"]:Close()

      if (ele.params and ele.params.event) then
        TriggerEvent(ele.params.event,ele.params.args)
      end
    end,
    function()
    end
  )
end

module.close = function()
  xContext:Close()
end

module.input = function(data)
  local eles = {
    {
      unselectable=true,
      icon=data.icon,
      title=data.header,
    }
  }

  for _,input in ipairs(data.inputs) do
    table.insert(eles,{
      icon=input.icon,
      title=input.text,
      input=true,
      inputType=input.type,
      inputPlaceholder=input.placeholder or input.default or "",
      inputValue=input.value,
      inputValues=input.options,
      inputMin=input.min,
      inputMax=input.max,
      name=input.name
    })
  end

  table.insert(eles,{
    icon="fas fa-check",
    title=data.submitText,
    name="submit"
  })

  local res = {}
  local ret = false
  local returning = false

  xContext:Open(
    "right",
    eles,
    function(menu,ele)
      if ele.name == "close" then
        exports["esx_context"]:Close()
      end

      if ele.name ~= "submit" then
        return
      end

      for _,ele in ipairs(menu.eles) do
        if ele.input and ele.name then
          res[ele.name] = ele.inputValue or ele.inputPlaceholder
        end
      end    

      returning = true

      exports["esx_context"]:Close()  

      Wait(0) 

      ret = true
    end,
    function()
      if returning then
        return
      end

      res = false
      ret = true
    end
  )

  while not ret do 
    Wait(0) 
  end

  return res
end

return module