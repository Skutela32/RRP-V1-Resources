TuningParameters = {
    Stance = {
        xOff = {
            label = "Wheel Offset",
            min = -2.0,
            max =  2.0,
            default = 0.0,
        },

        yRot = {
            label = "Wheel Camber",
            min = -2.0,
            max =  2.0,
            default = 0.0,
        },

        wheelSize = {
            label = "Wheel Size",
            min = 0.5,
            max = 1.5,
            default = 1.0
        },

        wheelWidth = {
            label = "Wheel Width",
            min = 0.5,
            max = 1.5,
            default = 1.0
        },
    },
    
    Handling = {
        -- TRANSMISSION

        fDriveBiasFront = {
            label = "Drive Bias Front",
            description = "",
            category = "transmission",
            min = 0.0,
            max = 1.0,
        },

        -- This doesn't seem to work.
        -- More experimentation needed?
        -- nInitialDriveGears = {
        --     label = "Drive Gears",
        --     description = "",
        --     category = "transmission",
        --     min = 1,
        --     max = 8,            
        -- },

        -- Modify transmission power output
        -- Don't allow editing of this if you want engine building to be meaningful.
        -- fInitialDriveForce = {
        --     label = "Drive Force",
        --     description = "",
        --     category = "transmission",
        --     min = 0.0,
        --     max = 10.0,            
        -- },

        -- Modify engine inertia
        -- Don't allow editing of this if you want engine building to be meaningful.
        -- fDriveInertia = {
        --     label = "Drive Inertia",
        --     description = "",
        --     category = "transmission",
        --     min = -5.0,
        --     max = 5.0,
        -- },

        -- Modify max vehicle top speed
        -- Don't allow editing of this if you want engine building to be meaningful.
        -- fInitialDriveMaxFlatVel = {
        --     label = "Max Velocity",
        --     desription = "",
        --     min = 60.0,
        --     max = config.maxVehicleSpeed
        -- },

        fClutchChangeRateScaleUpShift = {
            label = "Upshift Rate",
            description = "",
            category = "transmission",
            min = 0.0,
            max = 10.0,
        },

        fClutchChangeRateScaleDownShift = {
            label = "Downshift Rate",
            description = "",
            category = "transmission",
            min = 0.0,
            max = 10.0,
        },

        -- BRAKES

        fBrakeForce = {
            label = "Brake Force",
            description = "",
            category = "brakes",
            min = 0.0,
            max = 10.0,
        },

        fBrakeBiasFront = {
            label = "Brake Bias Front",
            description = "",
            category = "brakes",
            min = 0.0,
            max = 1.0,
        },

        fHandBrakeForce = {
            label = "Handbrake Force",
            description = "",
            category = "brakes",
            min = 0.0,
            max = 10.0,
        },

        -- TRACTION

        fTractionCurveMax = {
            label = "Traction Curve Max",
            description = "",
            category = "traction",
            min = 0.0,
            max = 10.0,
        },

        fTractionCurveMin = {
            label = "Traction Curve Min",
            description = "",
            category = "traction",
            min = 0.0,
            max = 10.0,
        },

        fTractionCurveLateral = {
            label = "Traction Curve Lateral",
            description = "",
            category = "traction",
            min = 0.0,
            max = 50.0,
        },

        fTractionSpringDeltaMax = {
            label = "Traction Spring Delta Max",
            description = "",
            category = "traction",
            min = 0.0,
            max = 10.0,
        },

        fLowSpeedTractionLossMult = {
            label = "Traction Loss Mult Low Speed",
            description = "",
            category = "traction",
            min = 0.0,
            max = 10.0,
        },

        fTractionBiasFront = {
            label = "Traction Bias Front",
            description = "",
            category = "traction",
            min = 0.0,
            max = 1.0,
        },

        fTractionLossMult = {
            label = "Traction Loss Mult",
            description = "",
            category = "traction",
            min = 0.0,
            max = 10.0,
        },

        -- SUSPENSION

        fSteeringLock = {
            label = "Steering Lock",
            description = "",
            category = "suspension",
            min = 0.0,
            max = 90.0,
        },

        fCamberStiffnesss = {
            label = "Camber Stiffness",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionForce = {
            label = "Suspension Force",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionCompDamp = {
            label = "Suspension Comp Damp",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionReboundDamp = {
            label = "Suspension Rebound Damp",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionUpperLimit = {
            label = "Suspension Upper Limit",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionLowerLimit = {
            label = "Suspension Lower Limit",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionRaise = {
            label = "Suspension Height",
            description = "",
            category = "suspension",
            min = -5.0,
            max = 5.0,
        },

        fSuspensionBiasFront = {
            label = "Suspension Bias Front",
            description = "",
            category = "suspension",
            min = 0.0,
            max = 1.0,
        },

        -- ROLLBARS

        fAntiRollBarForce = {
            label = "Anti Roll Bar Force",
            description = "",
            category = "anti roll bar",
            min = -5.0,
            max = 5.0,
        },

        fAntiRollBarBiasFront = {
            label = "Anti Roll Bar Bias Front",
            description = "",
            category = "anti roll bar",
            min = 0.0,
            max = 1.0,
        },

        fRollCentreHeightFront = {
            label = "Anti Roll Bar Center Height Front",
            description = "",
            category = "anti roll bar",
            min = -5.0,
            max = 5.0,
        },

        fRollCentreHeightRear = {
            label = "Anti Roll Bar Center Height Rear",
            description = "",
            category = "anti roll bar",
            min = -5.0,
            max = 5.0,
        },
    }
}