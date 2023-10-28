config = {
	-- Allow wheel resizing?
	-- Currently has issues, keep disabled until resolved.
	wheelResizing = false,

	-- Complete disable stancer options
	disableStancer = true,

	-- Refresh rate/thread wait time for world vehicles stance tracker. 100 = default.
	worldRefreshRate = 100,

	-- Enable debug prints?
	enableDebugPrints = false,
	
	-- Enable the /getDefaultEngine command (purely for testing purposes).
	enableDebugCommand = true,

	-- Allow tuning of block parameters?
	allowBlockTuning = false,

	-- Engine health to set when an engine is broken beyond use.
	brokenEngineHealth = 100,

	-- Use push script?
	usePushScript = false,

	-- Blacklisted classes from push script (OPTIONAL)
	pushBlacklist = {
		-- 0, -- Compacts  
		-- 1, -- Sedans  
		-- 2, -- SUVs  
		-- 3, -- Coupes  
		-- 4, -- Muscle  
		-- 5, -- Sports Classics  
		-- 6, -- Sports  
		-- 7, -- Super  
		-- 8, -- Motorcycles  
		-- 9, -- Off-road  
		-- 10, -- Industrial  
		-- 11, -- Utility  
		-- 12, -- Vans  
		-- 13, -- Cycles  
		14, -- Boats  
		15, -- Helicopters  
		16, -- Planes  
		-- 17, -- Service  
		-- 18, -- Emergency  
		-- 19, -- Military  
		-- 20, -- Commercial  
		21, -- Trains  
		-- 22, -- Open Wheel
	},

    -- Use inertia model on engines for turbo boost?
    -- NOTE: This gives a significant performance boost to
    --       supercharged engines at lower RPMs.
    --       Smaller engines will struggle to spin a large turbo.
    useInertia = true,

	-- Used for greater control over turbo inertia model.
	-- Higher value = faster spooling.
	inertiaForceMod = 5.0,

    -- Use this item to trigger the showUiExport below.
    tunerItem = "tuning_laptop",

	-- Allow nitrous?
	allowNitrous = true,

	-- Use this item to refill nitrous.
	nitrousItem = "nitrous_refill",

	minTimeBetweenBackfires = 100, 	-- min time between backfiring when engine taking damage.
	minTimeBetweenNitrous = 10,    	-- min time between nitrous flame particles.

	nitrousRefillAmount = 100, 		-- amount of nitrous to refill per item use.
	nitrousRefillSizeMod = 0.5, 	-- effect the refill amount by this value per size. [0 - 1.0]
									-- Refill amount = nitrousRefillAmount - (engine nitrous size * nitrousRefillSizeMod)
									-- Example for 100 nitrousRefillAmount and 0.5 nitrousRefillSizeMod:
									-- Nitrous size 100  = 100 - (100 * 0.5) = 50
									-- Nitrous size 50   = 100 - (50  * 0.5) = 75
									-- Nitrous size 0    = 100 - (0   * 0.5) = 100

	useNitrousFlames = true, 	  	-- use nitrous fx?
	nitrousFlameSize = 0.8, 	  	-- max size of nitrous flame fx
	nitrousFlameLerpSize = true,  	-- lerp size based on nitrous ramp, rpm and throttle?
	nitrousFlameSizeMin = 0, 	  	-- min size of nitrous flame fx

	enginePowerMultiplier = 1.1,  	-- multiplier for raw engine power.

	nitrousBoostMin = 0.5, 			-- min torque addition for min size & quality nitrous component.
	nitrousBoostMax = 1.5, 			-- max torque addition for max size & quality nitrous component.

	nitrousDrainRate = 1.0, 		-- drain rate at max size, scale is linear.
	nitrousDrainTime = 50, 			-- drain rate every x ms

	aspirationBoost = 1.1,			-- boost addition for all aspiration.
	absoluteMax = 50.0, 			-- any torque multiplier approaching this value will have immediate repercussions regarding damage.

	-- Disable these components on vehicles with a custom engine attached
	disableComponentsWithEngine = {
		transmission = false,
		engine = false,
		nitro = false,
		turbo = false
	},

	-- Should there be an explosion added when a vehicles engine is damaged?
	-- NOTE: May trigger some anticheats.
	useExplosionOnEngineBreak = true,

	-- Modify vehicle top speed with engine power calculations?
	modifyVehicleTopSpeed = true, 
	modifyVehicleTopSpeedMultiplier = 1.0, -- modifier for end of calculation. does not control the calculation itself.

	-- Jobs that can use the showStats portion.
	-- Set to false/nil if everyone can use.
	showStatsJobs = {
		mechanic2 = 4,
	},

    -- jobName = minRank
    -- which jobs should have access to the tuning UI
    -- Set to false/remove entirely if you don't want job restrictors.
	tuningJobs = {
		mechanic2 = 4,
	},

	-- Toggle nitrous
	nitrousToggleCommand = "toggleNitrous",
	nitrousToggleExport = "toggleNitrous",
	nitrousToggleHotkey = "N",

	-- Purge nitrous
	nitrousPurgeCommand = "purgeNitrous",
	nitrousPurgeExport = "purgeNitrous",
	nitrousPurgeHotkey = "J",

    -- shows the stats of an engine in a notification
    showStatsCommand = "showEngineStats",
    showStatsExport = "showEngineStats",
    showStatsHotkey = "O",

    -- Show aspiration boost HUD.
    showAspirationCommand = "showAspirationHUD",
    showAspirationExport = "showAspirationHUD",
    --showAspirationHotkey = "M",
    
	-- Damage/stress HUD.
	-- Set to false if unwanted.
    showHudCommand = "showTuningHUD",
    showHudExport = "showTuningHUD",
    --showHudHotkey = "J",

	-- Aspiration boost controller UI.
	-- Set to false if unwanted.
    showBoostCommand = "showBoostUI",
    showBoostExport = "showBoostUI",
    --showBoostHotkey = "K",

	-- Tuning UI.
	-- Set to false if unwanted.
    showUiCommand = "showTuningUI",
    showUiExport = "showTuningUI",
    showUiHotkey = "U",

	-- Set the default value of fInitialDriveForce per class when an engine is attached.
	-- This helps either smooth the performance difference between classes, or helps you magnify the difference.
	-- Remove this entirely to keep default drive for for all classes.
	-- Remove any class definition to keep the default drive force for that class.
	classDriveForce = {
		-- [0] = 1.0,
		-- [1] = 1.0
	},

	-- Areas where players with tuningJobs can access the tuning UI.
	-- NOTE: Having any tuning areas defined will disable the command unless inside a tuning area with the correct job.
	tuningAreas = {
		{	
			blip = {
				position = vector3(205.03, -1468.75, 29.15),
				sprite = 446,
				color = 5,
				scale = 0.75,
				display = 2,
				text = "Tuner Shop",
			},

			zone = {
				vector3(217.88, -1459.27, 29.22),
				vector3(239.20, -1481.22, 29.55),
				vector3(211.86, -1509.55, 29.97),
				vector3(192.99, -1485.98, 28.99)
			}
		}
	},

	-- Should all vehicles use the default engine below?
	-- Probably not a great option to have enabled.
	useDefaultEngine = false,

	engineDefaults = {
	    -- Set to false or nil if you don't want an engine sound overwrite.
	    sound = 'BTYPE2',

	    -- The engine build is defined on creation by ti_mechEngineer.
	    build = {
	        -- Block & Heads Config
	        -- These components are not effected by stress, and have no chance of breaking.
	        -- They define the "layout" for other components.
	        block = {
	            layout      = "inline",  	-- inline, flat, v90, v60
	            cylinders   = 6, 			-- 2-12
	            bore        = 0.66,			-- 0-1
	            stroke      = 0.66,			-- 0-1
	            quality     = 1.0,			-- 0-1
	        },

	        heads = {
	            layout      = "dohc", 		-- dohc, sohc, pushrod
	            valves      = 4, 			-- 2,3,4,5
	            vvl         = true, 		-- true,false
	            quality     = 1.0, 			-- 0-1
	        },

	        -- Fuel Component Quality
	        -- Effects knocking/detonation
	        fuelDelivery = {
	            quality     = 1.0, 			-- 0-1
	        },

	        -- Interal Materials & Quality
	        -- These components are effected by stress, and can break under certain circumstances.
	        valves  = {
	            material    = "titanium", 		-- check `data/params.lua Materials` for more information
	            quality     = 1.0, 			 	-- 0-1
	        },

	        pistons = {
	            material    = "titanium", 		-- check `data/params.lua Materials` for more information
	            quality     = 1.0, 			 	-- 0-1
	        },

	        conrods = {
	            material    = "titanium", 		-- check `data/params.lua Materials` for more information
	            quality     = 1.0, 			 	-- 0-1
	        },

	        crankshaft = {
	            material    = "titanium", 		-- check `data/params.lua Materials` for more information
	            quality     = 1.0, 			 	-- 0-1
	        },

	        -- Aspiration is not effected by stress, but has the largest effect on torque curve variations.
	        -- You can comment this portion out safely if you don't want the default engine to have forced induction.
	        aspiration = {
	            typeof    = "turbocharger",	-- turbocharger, supercharger
	            system    = "twin", 		-- turbocharger: single, twin; supercharger: positiveDisplacement, centrifugal
	            size      = 1.0, 			-- 0-1
	            quality   = 1.0, 			-- 0-1
	        },

			nitrous = {
				size 	= 1.0,
				quality = 1.0,
			}
	    },

	    -- The engine tune is every tunable variable within the UI.
	    -- Don't remove anything from here, just edit them.
	    tune = {
	    	aspiration = {
	    		turboBoost1 = 0.5,
	    		turboSize1 = 0.5,

	    		turboBoost2 = 0.5,
	    		turboSize2 = 0.5,

	    		superchargerBoost = 0.5,
	    		superchargerSize = 0.5,
	    	},

	        heads = {
	            airflow    = 0.81, 			-- 0-1
	            compRatio  = 0.57, 			-- 0-1     
	            camProfile = 0.42, 			-- 0-1    
	            vvlProfile = 0.50, 			-- 0.1
	        },

	        fuel = {
	            afRatio = 0.4, 				-- 0-1
	            timing  = 0.4, 				-- 0-1
	            limiter = 0.5 				-- 0-1
	        },

			nitrous = {
				rampStart = 0.3,
				rampStartBoost = 1.0,
				rampEnd = 1.0,
				rampEndBoost = 1.0,
			}
	    }
	}
}