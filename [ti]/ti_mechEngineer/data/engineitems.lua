EngineItems = {
	block = {
		testBlock = {
			label = "Test Block",

			stats = {		
	            layout      = "inline",
	            cylinders   = 6,
	            bore        = 86.0,
	            stroke      = 86.0,
	            material    = "aluminium",
	            quality     = 50.0,
		    }
		}
	},

	intercooler = {
		testIntercooler = {
			label = "Test Intercooler",

			stats = {
				quality = 50.0
			}
		}
	},

	aspiration = {
		testTurbo = {
			label = "Test Turbocharger",

			stats = {
				system = "turbocharger",
				method = "single",
				quality = 50.0
			}
		}
	},

	nitrous = {
		testNitrous = {
			label = "Test Nitrous",

			stats = {
				size = 100.0,
				quality = 100.0
			}
		}
	},

	intake = {
		testIntake = {
			label = "Test Intake",

			stats = {
				quality = 50.0,
			}
		}
	},

	fuel = {
		testFuel = {
			label = "Test Fuel System",

			stats = {
				system = "injection",
				delivery = "direct",
				method = "per-cylinder",
				quality = 50.0
			}
		}
	},

	heads = {
		testHeads = {
			label = "Test Heads",

			stats = {		
            	config      = "DOHC",
	            valves      = 4,
	            vvl         = true,
	            material    = "aluminium",
	            quality     = 50.0,
			}
		}
	},

	valves = {
		testValves = {
			label = "Test Valves",

			stats = {
            	material = "forged-steel",
            	quality = 50.0,
			}
		}
	},

	crankshaft = {
		testCrank = {
			label = "Test Crankshaft",

			stats = {		
            	material = "cast-steel",
            	quality = 20.0,
			}
		},		
	},

	conrods = {
		testConrods = {
			label = "Test Conrods",

			stats = {				
            	material = "forged-steel",
            	quality = 80.0,
			}
		},
	},

	pistons = {
		testPistons = {
			label = "Test Pistons",

			stats = {				
            	material = "forged-steel",
            	quality = 80.0,
			}
		},
	},

	headers = {
		testHeaders = {
			label = "Test Headers",

			stats = {
				material = "stainless-steel",
				quality = 100.0
			}
		}
	},

	exhaust = {
		testExhaust = {
			label = "Test Exhaust",

			stats = {
				cats = "two-way",
				mufflers = "baffled",
				system = "twin",
				quality = 50.0
			}
		}
	},
}