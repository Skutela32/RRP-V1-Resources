ti.locales.set({
	en = {
		push_drawtext = "[E] Push",
		pushing_drawtext = "[E] Stop",

		err_invalid_job = "Invalid Tuning Job",

		eng_air_flow_limit = "Air Flow Limit",
		eng_air_fuel_ratio = "Air/Fuel Ratio",
		eng_ignition_timing = "Ignition Timing",
		eng_rev_limiter = "Rev Limiter",
		eng_turbo_size_1 = "Turbo Size 1",
		eng_turbo_size_2 = "Turbo Size 2",
		eng_turbo_boost_1 = "Turbo Boost 1",
		eng_turbo_boost_2 = "Turbo Boost 2",
		eng_supercharger_size = "Supercharger Size",
		eng_supercharger_boost = "Supercharger Boost",
		eng_bore_diameter = "Bore Diameter",
		eng_stroke_length = "Stroke Length",
		eng_cylinders = "Cylinders",
		eng_vvl_profile = "VVL Profile",
		eng_cam_profile = "Camshaft Profile",
		eng_comp_ratio = "Compression Ratio",
		eng_too_damaged = "Your engine is too damaged to function.",

		toggle_boost_ui = "Toggle boost UI",
		toggle_tuning_ui = "Toggle tuning UI",
		toggle_tuning_hud = "Toggle tuning HUD",
		veh_stress_toggled = "Vehicle stress toggled",
		enabled = "Enabled",
		disabled = "Disabled",

		default_engine = "Default Engine",

		using_inertia = "Using inertia",
		not_using_inertia = "Not using inertia",
		
		stats_command = "View nearby vehicle stats.",
		no_engine_found = "No engine found.",
		engine_stats = "%s <br>Peak Torque: %.2fx <br>Max RPM: %i <br>Fuel: %s",

		eng_nitrous_ramp_init = "Ramp Init",
		eng_nitrous_ramp_start = "Ramp Start",
		eng_nitrous_ramp_start_boost = "Ramp Start Boost",
		eng_nitrous_ramp_end = "Ramp End",
		eng_nitrous_ramp_end_boost = "Ramp End Boost",
		eng_nitrous_ramp_cut = "Ramp Cut",

		nitrous_enabled = "Nitrous Enabled",
		nitrous_disabled = "Nitrous Disabled",

		nitrous_purge_enabled = "Nitrous Purge Enabled",
		nitrous_purge_disabled = "Nitrous Purge Disabled",

		nitrous_command = "Toggle Nitrous",
		nitrous_purge = "Purge Nitrous",
	}
})

labels = setmetatable({},{
	__index = function(t,k)
		return ti.locales.get(k)
	end
})