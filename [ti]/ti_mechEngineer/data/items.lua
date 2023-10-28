local Items = {
    {
        name = "aluminium",
        label = "Aluminium",
        weight = 0.5,
        description = "A billet of processed aluminium",
        image = "aluminium.png",
    },
    {       
        typeof = "item",
        name = "engine",
        label = "Engine",
        description = "",
        weight = 10.0,
        unique = true,
        image = "engine.png",
        useable = false,
        shouldClose = false,
        combinable = false,
        rare = false,
        canRemove = true,
        degradeModifier = 1.0
    },
    {       
        typeof = "item",
        name = "engine_block",
        label = "Engine Block",
        description = "",
        weight = 10.0,
        unique = true,
        image = "engine_block.png",
        useable = false,
        shouldClose = false,
        combinable = false,
        rare = false,
        canRemove = true,
        degradeModifier = 1.0
    },
    {       
        typeof = "item",
        name = "engine_component",
        label = "Engine Component",
        description = "",
        weight = 5.0,
        unique = true,
        image = "engine_component.png",
        useable = false,
        shouldClose = false,
        combinable = false,
        rare = false,
        canRemove = true,
        degradeModifier = 1.0
    },
}

_ENV.Items = Items