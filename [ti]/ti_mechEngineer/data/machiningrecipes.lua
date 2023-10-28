--[[

define recipes to be crafted in machines

            'customAspiration',
            'customBlock',
            'customConrods',
            'customCrankshaft',
            'customExhaust',
            'customFuel',
            'customHeaders',
            'customHeads',
            'customIntake',
            'customIntercooler',
            'customPistons',
            'customValves'

--]]

if not config.autoGenerateRecipes then
    machiningRecipes = {
        customAspiration = {
            time = 1,
            label = "Custom Aspiration",
            typeof = "component",
            category = "aspiration",
            materials = {
                aluminium = {
                    label = "Aluminium",
                    requiredItems = {
                        {
                            name = "aluminium",
                            label = "Aluminium",
                            count = 5,
                            keep = false,
                        }
                    }
                },
            }
        },
        
        customBlock = {
            time = 1,
            label = "Custom Block",
            typeof = "engineblock",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customConrods = {
            time = 1,
            label = "Custom Conrods",
            typeof = "component",
            category = "conrods",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customCrankshaft = {
            time = 1,
            label = "Custom Crankshaft",
            typeof = "component",
            category = "crankshaft",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },

        customNitrous = {
            time = 1,
            label = "Custom Nitrous",
            typeof = "component",
            category = "nitrous",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },    
        },
        
        customExhaust = {
            time = 1,
            label = "Custom Exhaust",
            typeof = "component",
            category = "exhaust",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customFuel = {
            time = 1,
            label = "Custom Fuel",
            typeof = "component",
            category = "fuel",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customHeaders = {
            time = 1,
            label = "Custom Headers",
            typeof = "component",
            category = "headers",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customHeads = {
            time = 1,
            label = "Custom Heads",
            typeof = "component",
            category = "heads",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customIntake = {
            time = 1,
            label = "Custom Intake",
            typeof = "component",
            category = "intake",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customIntercooler = {
            time = 1,
            label = "Custom Intercooler",
            typeof = "component",
            category = "intercooler",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customPistons = {
            time = 1,
            label = "Custom Pistons",
            typeof = "component",
            category = "pistons",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
        
        customValves = {
            time = 1,
            label = "Custom Valves",
            typeof = "component",
            category = "valves",
            material = "aluminium",

            requiredItems = {
                {
                    name = "aluminium",
                    label = "Aluminium",
                    count = 5,
                    keep = false,
                },
            },      
        },
    }
else
    --
    -- Auto generate the recipes for each component type and material,
    -- Using the materials from ti_vehicleTuning/data/materials.lua.
    --
    machiningRecipes = {}

    local f = LoadResourceFile("ti_vehicleTuning", "data/materials.lua")
    local fn = load(f)

    if not fn then
        print("Failed to load materials.lua")
        return
    end

    fn()

    local extraComponentItems = config.autoGeneratedRecipeItems or {}

    for category in pairs(EngineItems) do
        local recipe = {
            time = config.generatedDefaultTime,
            label = category:sub(1,1):upper() .. category:sub(2),
            typeof = category == "block" and "engineblock" or "component",
            category = category,
            materials = {}
        }

        for name,material in pairs(Materials) do
            local extraComponentItems = extraComponentItems[category] or {}

            local requiredItems = {
                {
                    name = name,
                    label = material.label,
                    count = config.generatedDefaultMaterials * math.ceil(material.prestige * config.prestigeMaterialMultiplier),
                    keep = false,
                }
            }

            for itemName,item in pairs(extraComponentItems) do
                table.insert(requiredItems, {
                    name = itemName:lower(),
                    label = item.label,
                    count = item.count,
                    keep = false,
                })
            end

            recipe.materials[name] = {
                label = material.label,
                requiredItems = requiredItems
            }
        end

        machiningRecipes[category] = recipe
    end
end