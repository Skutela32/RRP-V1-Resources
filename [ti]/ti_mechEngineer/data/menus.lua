Menus = {
    engineStandPreview = {        
        label = "Engine Stand",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this engine stand.",
        retEvent = "ti_mechEngineer:standPreviewInteract"
    },

    machinePreview = {        
        label = "Production Machine",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this production machine.",
        retEvent = "ti_mechEngineer:machinePreviewInteract"
    },

    deliveryPreview = {        
        label = "Delivery",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this delivery point.",
        retEvent = "ti_mechEngineer:deliveryPreviewInteract"
    },

    inventoryPreview = {        
        label = "Inventory",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this inventory point.",
        retEvent = "ti_mechEngineer:inventoryPreviewInteract"
    },

    cranePreview = {        
        label = "Engine Crane",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this engine crane.",
        retEvent = "ti_mechEngineer:cranePreviewInteract"
    },

    swapPointPreview = {        
        label = "Engine Swap Point",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this engine swap point.",
        retEvent = "ti_mechEngineer:swapPointInteract"
    },

    trashPreview = {
        label = "Trash Point",
        icon = "fa-solid fa-circle-info",
        text = "Interact with this component trash point.",
        retEvent = "ti_mechEngineer:trashPreviewInteract"        
    },

    detachCompMenu = {
        {
            isHeader = true,
            label = "Detach",
            icon = "fa-solid fa-circle-info",
        },
        {
            label = "To Inventory",
            text = "Detach this component into your inventory.",
            icon = "",
            retEvent = "ti_mechEngineer:detachToInventory"
        },
        {
            label = "To Kart",
            text = "Detach this component onto a kart.",
            icon = "",
            retEvent = "ti_mechEngineer:detachToKart"
        },        
    },

    detachEngineMenu = {
        {
            isHeader = true,
            label = "Detach",
            icon = "fa-solid fa-circle-info",
        },
        {
            label = "To Inventory",
            text = "Detach this engine into your inventory.",
            icon = "",
            retEvent = "ti_mechEngineer:detachEngineToInventory"
        },
        {
            label = "To Kart",
            text = "Detach this engine onto a kart.",
            icon = "",
            retEvent = "ti_mechEngineer:detachEngineToKart"
        },        
    },

    -- 
    -- A
    --

    withdrawDeliveryItem = {
        {
            isHeader = true,
            label = "Withdraw",
            icon = "fa-solid fa-circle-info",
        },
        {
            label = "To Inventory",
            text = "Withdraw this component into your inventory.",
            icon = "",
            retEvent = "ti_mechEngineer:withdrawToInventory"
        },
        {
            label = "To Kart",
            text = "Withdraw this component onto a kart.",
            icon = "",
            retEvent = "ti_mechEngineer:withdrawToKart"
        },        
    },

    -- 
    -- B
    --

    withdrawInventoryMenu = {
        {
            isHeader = true,
            label = "Withdraw",
            icon = "fa-solid fa-circle-info",
        },
        {
            label = "To Inventory",
            text = "Withdraw this component into your inventory.",
            icon = "",
            retEvent = "ti_mechEngineer:withdrawInventoryToInventory"
        },
        {
            label = "To Kart",
            text = "Withdraw this component onto a kart.",
            icon = "",
            retEvent = "ti_mechEngineer:withdrawInventoryToKart"
        },        
    },

	standWithEngine = {
        {
            isHeader = true,
            label = "Engine Stand",
            icon = "fa-solid fa-circle-info",
            text = ""
        },
        {
            label = "",
            text = "Current Engine",
            icon = "fa-solid fa-circle",
            disabled = true,
        },
        {
            label = "Rename",
            text = "Rename this engine variant.",
            icon = "fa-solid fa-signature",
            retEvent = "ti_mechEngineer:renameEngine"
        },
        {
            label = "Set Sound",
            text = "Set the handling name for this engines sound.",
            icon = "fa-solid fa-signature",
            retEvent = "ti_mechEngineer:setEngineSound"
        },
        {
            label = "Inspect",
            text = "A more detailed look at the engine and its components. You can remove parts here.",
            icon = "fa-solid fa-search",
            retEvent = "ti_mechEngineer:inspectEngine"
        },
        {
            label = "Add Component",
            text = "Add or swap a component on this engine with an item from your inventory.",
            icon = "fa-solid fa-plus",
            retEvent = "ti_mechEngineer:addComponent",
        },
        {
            label = "Detach",
            text = "Detach this engine from the stand.",
            icon = "fa-solid fa-link-slash",
            retEvent = "ti_mechEngineer:detachEngine"
        },
    },

    standWithoutEngine = {
        {
            isHeader = true,
            label = "Engine Stand",
            icon = "fa-solid fa-circle-info",
            text = ""
        },
        {
            label = "No Engine",
            text = "Current Engine",
            icon = "fa-solid fa-circle",
            disabled = true,
        },
        {
            label = "Attach",
            text = "Attach an engine from your inventory to this stand.",
            icon = "fa-solid fa-link",
            retEvent = "ti_mechEngineer:attachEngine"
        }
    },

    setSoundMenu = {
        header = "Set Engine Sound",
        submitText = "Submit",
        inputs = {
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Handling Name",
                default = "BTYPE2"
            }
        }
    },

    renameMenu = {
        header = "Rename Variant",
        submitText = "Submit",
        inputs = {
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Variant Name",
                default = "MSV1"
            }
        }
    },

    craftEngineMenu = {
        header = "Engine Block",
        submitText = "Submit",
        inputs = {
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "radio",
                isRequired = true,
                name = "layout",
                text = "Layout",
                default = "inline",
                options = {
                    {
                        text = "Inline",
                        value = "inline",
                    },
                    {
                        text = "Flat",
                        value = "flat",
                    },
                    {
                        text = "v60",
                        value = "v60",
                    },
                    {
                        text = "v90",
                        value = "v90",
                    },
                }
            },
            {
                type = "radio",
                isRequired = true,
                name = "cylinders",
                text = "Cylinders",
                default = 3,
                options = {
                    {
                        text = "3",
                        value = 3,
                    },
                    {
                        text = "4",
                        value = 4,
                    },
                    {
                        text = "5",
                        value = 5,
                    },
                    {
                        text = "6",
                        value = 6,
                    },
                    {
                        text = "8",
                        value = 8,
                    },
                    {
                        text = "10",
                        value = 10,
                    },
                    {
                        text = "12",
                        value = 12,
                    },
                },
            },
            {
                type = "number",
                isRequired = true,
                name = "bore",
                text = "Bore (20-120mm)",
            },
            {
                type = "number",
                isRequired = true,
                name = "stroke",
                text = "Stroke (20-120mm)",
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftIntercoolerMenu = {
        header = "Intercooler",
        submitText = "Submit",
        inputs = {
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "number",
                isRequired = true,
                name = "size",
                text = "Peak Horsepower (100-2000)",
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }          
    },

    craftNitrousMenu = {
        header = "Nitrous",
        submitText = "Submit",
        inputs = {
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "number",
                isRequired = true,
                name = "size",
                text = "Shot Size (1-100)",
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }          
    },

    craftAspirationMenu = {
        header = "Aspiration",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "radio",
                isRequired = true,
                name = "system",
                text = "System",
                default = "turbocharger",
                options = {
                    {
                        text = "Turbocharger",
                        value = "turbocharger",
                    },
                    {
                        text = "Supercharger",
                        value = "supercharger",
                    },
                }        
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftSuperchargerMenu = {
        header = "Supercharger",
        submitText = "Submit",
        inputs = {
            {
                type = "radio",
                isRequired = true,
                name = "method",
                text = "Method",
                default = "centrifugal",
                options = {
                    {
                        text = "Centrifugal",
                        value = "centrifugal"
                    },
                    {
                        text = "Roots-type",
                        value = "positiveDisplacement"
                    }
                }
            }
        }        
    },

    craftCentrifugalSuperchargerMenu = {
        header = "Centrifugal",
        submitText = "Submit",
        inputs = {
            {
                type = "number",
                isRequired = true,
                name = "compressor",
                text = "Compressor Diameter (20-120mm)",
            }
        }          
    },

    craftPositiveDisplacementSuperchargerMenu = {
        header = "Positive Displacement",
        submitText = "Submit",
        inputs = {
            {
                type = "number",
                isRequired = true,
                name = "displacement",
                text = "Displacement (500-3000cc)",
            }
        }          
    },

    craftTurbochargerMenu = {
        header = "Turbocharger",
        submitText = "Submit",
        inputs = {
            {
                type = "radio",
                isRequired = true,
                name = "method",
                text = "Method",
                default = "single",
                options = {
                    {
                        text = "Single",
                        value = "single"
                    },
                    {
                        text = "Twin",
                        value = "twin"
                    },
                }
            }
        }        
    },

    craftSingleTurbocharger = {
        header = "Single",
        submitText = "Submit",
        inputs = {
            {
                type = "number",
                isRequired = true,
                name = "compressor",
                text = "Compressor Diameter (20-120mm)",
            },
            {
                type = "number",
                isRequired = true,
                name = "turbine",
                text = "Turbine Diameter (20-120mm)",
            }
        }          
    },

    craftTwinTurbocharger = {
        header = "Single",
        submitText = "Submit",
        inputs = {            
            {
                type = "number",
                isRequired = true,
                name = "compressor",
                text = "1: Compressor Diameter (20-120mm)",
            },
            {
                type = "number",
                isRequired = true,
                name = "turbine",
                text = "1: Turbine Diameter (20-120mm)",
            },
            {
                type = "number",
                isRequired = true,
                name = "compressor2",
                text = "2: Compressor Diameter (20-120mm)",
            },
            {
                type = "number",
                isRequired = true,
                name = "turbine2",
                text = "2: Turbine Diameter (20-120mm)",
            }
        }          
    },

    craftIntakeMenu = {
        header = "Intake",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "radio",
                isRequired = true,
                name = "system",
                text = "System",
                default = "standard",
                options = {
                    {
                        text = "Standard",
                        value = "standard",
                    },
                    {
                        text = "Performance",
                        value = "performance",
                    },
                    {
                        text = "Race",
                        value = "race"
                    }
                }        
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftFuelMenu = {
        header = "Fuel",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftValvesMenu = {
        header = "Valves",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftCrankshaftMenu = {
        header = "Crankshaft",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftConrodMenu = {
        header = "Conrod",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "number",
                isRequired = true,
                name = "length",
                text = "Length (20-120mm)"
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftPistonMenu = {
        header = "Piston",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "number",
                isRequired = true,
                name = "diameter",
                text = "Diameter (20-120mm)"
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftHeadsMenu = {
        header = "Heads",
        submitText = "Submit",
        inputs = {
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "radio",
                isRequired = true,
                name = "config",
                text = "Config",
                default = "pushrod",
                options = {
                    {
                        text = "Pushrod",
                        value = "pushrod",
                    },
                    {
                        text = "SOHC",
                        value = "sohc",
                    },
                    {
                        text = "DOHC",
                        value = "dohc",
                    },
                }        
            },
            {
                type = "radio",
                isRequired = true,
                name = "valves",
                text = "Valves",
                default = "2",
                options = {
                    {
                        text = "2",
                        value = 2,
                    },
                    {
                        text = "3",
                        value = 3,
                    },
                    {
                        text = "4",
                        value = 4,
                    },
                    {
                        text = "5",
                        value = 5,
                    },
                }        
            },
            {
                type = "radio",
                isRequired = true,
                name = "vvl",
                text = "VVL",
                default = "false",
                options = {
                    {
                        text = "False",
                        value = "false",
                    },
                    {
                        text = "True",
                        value = "true",
                    },
                }        
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftHeadersMenu = {
        header = "Headers",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "number",
                isRequired = true,
                name = "diameter",
                text = "Diameter (10-100mm)",
            },
            {
                type = "radio",
                isRequired = true,
                name = "system",
                text = "System",
                default = "logCast",
                options = {
                    {
                        text = "Log Cast",
                        value = "logCast",
                    },
                    {
                        text = "Tube Cast",
                        value = "tubeCast",
                    },
                    {
                        text = "Short Tube",
                        value = "shortTube"
                    },
                    {
                        text = "Long Tube",
                        value = "longTube"
                    },
                    {
                        text = "Race Tube",
                        value = "raceTube"
                    }
                }        
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },

    craftExhaustMenu = {
        header = "Exhaust",
        submitText = "Submit",
        inputs = {  
            {
                type = "text",
                isRequired = true,
                name = "name",
                text = "Name",
            },
            {
                type = "number",
                isRequired = true,
                name = "diameter",
                text = "Diameter (10-200mm)",
            },
            {
                type = "radio",
                isRequired = true,
                name = "system",
                text = "System",
                default = "single",
                options = {
                    {
                        text = "Single",
                        value = "single",
                    },
                    {
                        text = "Twin",
                        value = "twin",
                    },
                }        
            },
            {
                type = "radio",
                isRequired = true,
                name = "cats",
                text = "Catalytic Converters",
                default = "300cpsi",
                options = {
                    {
                        text = "300 CPSI",
                        value = "300cpsi",
                    },
                    {
                        text = "200 CPSI",
                        value = "200cpsi",
                    },
                    {
                        text = "100 CPSI",
                        value = "100cpsi",
                    },
                    {
                        text = "None",
                        value = "none"
                    }
                }
            },
            {
                type = "radio",
                isRequired = true,
                name = "mufflers",
                text = "Mufflers",
                default = "reverseFlow",
                options = {
                    {
                        text = "Reverse Flow",
                        value = "reverseFlow",
                    },
                    {
                        text = "Baffled",
                        value = "baffled",
                    },
                    {
                        text = "Straight Through",
                        value = "straightThrough",
                    },
                    {
                        text = "None",
                        value = "none",
                    },
                }
            },
            {
                type = "",
                text = "The quality of a production effects the amount of items and time required. The default value is 50.",
            },
            {
                type = "number",
                isRequired = true,
                name = "quality",
                text = "Quality (1-100)",
            }
        }
    },
}