--[[

premade item definitions for job inventories

--]]

premadeItems = {
    testEngine1 = {
        typeof = "engine",

        name = "2JZ",
        variant = "GTE",

        block = {
            name        = "2JZ",

            stats = {
                cylinders   = 6,
                bore        = 86.0,
                stroke      = 86.0,
                material    = "aluminium",
                layout      = "inline",
                quality     = 50.0,
            }
        },

        intercooler = {
            name = "2JZ-GTE Intercooler",

            stats = {
                size = 500.0,
                material = "aluminium",
                quality = 50.0
            }
        },

        aspiration = {
            name = "2JZ-GTE Twin Turbos",

            stats = {
                system = "turbocharger",
                method = "twin",
                compressor = 25.0,
                turbine = 40.0,
                compressor2 = 12.0,
                turbine2 = 25.0,
                material = "aluminium",
                quality = 50.0
            }
        },

        intake = {
            name = "2JZ-GTE Intake",

            stats = {
                system = "performance",
                material = "aluminium",
                quality = 50.0
            }
        },

        fuel = {
            name = "2JZ-GTE Fuel System",

            stats = {
                system = "injection",
                method = "direct",
                deliver = "per-cylinder",
                quality = 50.0
            }
        },

        heads = {
            name = "2JZ-GTE Heads",

            stats = {
                config = "DOHC",
                valves = 4,
                vvl = false,
                material = "aluminium",
                quality = 50.0
            }
        },

        valves = {
            name = "2JZ-GTE Valves",

            stats = {
                material = "aluminium",
                quality = 50.0
            }
        },

        crankshaft = {
            name = "2JZ-GTE Crankshaft",

            stats = {
                material = "aluminium",
                quality = 50.0,
            }
        },

        conrods = {
            name = "2JZ-GTE Conrods",

            stats = {
                length = 86.0,
                material = "aluminium",
                quality = 50.0,
            }
        },

        pistons = {
            name = "2JZ-GTE Pistons",

            stats = {
                diameter = 86.0,
                material = "aluminium",
                quality = 50.0,
            }
        },

        headers = {
            name = "2JZ-GTE Headers",

            stats = {
                diameter = 30.0,
                material = "aluminium",
                quality = 50.0,
            }
        },

        exhaust = {
            name = "2JZ-GTE Exhaust",

            stats = {
                diameter = 50.0,
                material = "aluminium",
                quality = 50.0,
            }
        },
    },

    testBlock1 = {      
        typeof = "engineblock",

        name = "2JZ",

        stats = {
            layout = "inline",
            cylinders = 6,
            bore = 86.0,
            stroke = 86.0,
            material = "aluminium",
            quality = 50.0,
        }
    },

    testComp1 = {
        typeof = "component",
        component = "valves",

        name = "2JZ-GTE Valves",

        stats = {
            quality = 50.0,
            material = "aluminium",
        }
    },

    testNitrous1 = {
        typeof = "component",
        component = "nitrous",

        name = "Super Nitrous",

        stats = {
            quality = 100.0,
            size = 100.0,
        }
    }
}