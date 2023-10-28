Config = Config or {}

Config.Fuel = "cdn-fuel" -- "ps-fuel", "LegacyFuel"
Config.ResourcePerms = 'god' -- permission to control resource(start stop restart)
Config.RenewedPhone = true -- if you use qb-phone from renewed. (multijob)

-- Key Bindings
Config.Keybindings = false
Config.AdminKey = "PageDown"
Config.NoclipKey = "PageUp"

-- Give Car
Config.DefaultGarage = "pillboxgarage"

Config.Actions = {
    ["admin_car"] = {
        label = "Admin Car",
        type = "client",
        event = "ps-adminmenu:client:Admincar",
        perms = "god",
    },

    ["ban_player"] = {
        label = "Ban Player",
        perms = "god",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Reason", option = "text" },
            {
                label = "Duration",
                option = "dropdown",
                data = {
                    { label = "Permanent",  value = "2147483647" },
                    { label = "10 Minutes", value = "600" },
                    { label = "30 Minutes", value = "1800" },
                    { label = "1 Hour",     value = "3600" },
                    { label = "6 Hours",    value = "21600" },
                    { label = "12 Hours",   value = "43200" },
                    { label = "1 Day",      value = "86400" },
                    { label = "3 Days",     value = "259200" },
                    { label = "1 Week",     value = "604800" },
                    { label = "3 Week",     value = "1814400" },
                },
            },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:BanPlayer" },
        },
    },

    ["bring_player"] = {
        label = "Bring Player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:BringPlayer" },
        },
    },

    ["change_weather"] = {
        label = "Change Weather [Dont Use]",
        perms = "god",
        dropdown = {
            {
                label = "Weather",
                option = "dropdown",
                data = {
                    { label = "Extrasunny", value = "Extrasunny" },
                    { label = "Clear",      value = "Clear" },
                    { label = "Neutral",    value = "Neutral" },
                    { label = "Smog",       value = "Smog" },
                    { label = "Foggy",      value = "Foggy" },
                    { label = "Overcast",   value = "Overcast" },
                    { label = "Clouds",     value = "Clouds" },
                    { label = "Clearing",   value = "Clearing" },
                    { label = "Rain",       value = "Rain" },
                    { label = "Thunder",    value = "Thunder" },
                    { label = "Snow",       value = "Snow" },
                    { label = "Blizzard",   value = "Blizzard" },
                    { label = "Snowlight",  value = "Snowlight" },
                    { label = "Xmas",       value = "Xmas" },
                    { label = "Halloween",  value = "Halloween" },
                },
            },
            { label = "Confirm", option = "button", type = "client", event = "ps-adminmenu:client:ChangeWeather" },
        },
    },

    ["change_time"] = {
        label = "Change Time [Dont Use]",
        perms = "god",
        dropdown = {
            {
                label = "Time Events",
                option = "dropdown",
                data = {
                    { label = "Sunrise", value = "06" },
                    { label = "Morning", value = "09" },
                    { label = "Noon",    value = "12" },
                    { label = "Sunset",  value = "21" },
                    { label = "Evening", value = "22" },
                    { label = "Night",   value = "24" },
                },
            },
            { label = "Confirm", option = "button", type = "client", event = "ps-adminmenu:client:ChangeTime" },
        },
    },

    ["change_plate"] = {
        label = "Change Plate",
        perms = "god",
        dropdown = {
            { label = "Plate", option = "text" },
            { label = "Confirm", option = "button", type = "client", event = "ps-adminmenu:client:ChangePlate" },
        },
    },

    ["clear_inventory"] = {
        label = "Clear Inventory",
        perms = "god",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:ClearInventory" },
        },
    },

    ["clothing_menu"] = {
        label = "Give Clothing Menu",
        perms = "mod",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:ClothingMenu" },
        },
    },

    ["copy_coords"] = {
        label = "Copy Coords",
        perms = "god",
        dropdown = {
            { label = "Copy Vector2", option = "button", type = "command", event = "vector2" },
            { label = "Copy Vector3", option = "button", type = "command", event = "vector3" },
            { label = "Copy Vector4", option = "button", type = "command", event = "vector4" },
            { label = "Copy Heading", option = "button", type = "command", event = "heading" },
        },
    },

    ["delete_vehicle"] = {
        label = "Delete Vehicle",
        type = "command",
        event = "dv",
        perms = "mod",
    },

    ["freeze_player"] = {
        label = "Freeze Player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:FreezePlayer" },
        },
    },

    ["set_ammo"] = {
        label = "Set Ammo",
        perms = "god",
        dropdown = {
            { label = "Ammo Ammount", option = "text" },
            { label = "Confirm", option = "button", type = "client", event = "ps-adminmenu:client:SetAmmo" },
        },
    },

    -- ["nui_focus"] = {
    --     label = "Give NUI Focus",
    --     perms = "mod",
    --     dropdown = {
    --         { label = "Player",  option = "dropdown", data = "players" },
    --         { label = "Confirm", option = "button",   type = "client", event = "" },
    --     },
    -- },

    ["god_mode"] = {
        label = "God Mode",
        type = "god",
        event = "ps-adminmenu:client:ToggleGodmode",
        perms = "mod",
    },

    ["give_car"] = {
        label = "Give Car",
        perms = "admin",
        dropdown = {
            { label = "Vehicle", option = "dropdown", data = "vehicles" },
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Plate (Optional)", option = "text"},
            { label = "Garage (Optional)", option = "text"},
            { label = "Confirm", option = "button", type = "server",  event = "ps-adminmenu:server:givecar" },
        }
    },

    ["invisible"] = {
        label = "Invisible",
        type = "client",
        event = "ps-adminmenu:client:ToggleInvisible",
        perms = "god",
    },

    ["blackout"] = {
        label = "Toggle Blackout",
        type = "server",
        event = "ps-adminmenu:server:ToggleBlackout",
        perms = "god",
    },

    ["toggle_duty"] = {
        label = "Toggle Duty",
        type = "server",
        event = "QBCore:ToggleDuty",
        perms = "mod",
    },

    ["toggle_delete_lazer"] = {
        label = "Toggle Delete Laser",
        type = "client",
        event = "ps-adminmenu:client:ToggleDeleteLaser",
        perms = "god",
    },

    ["set_perms"] = {
        label = "Set Perms",
        perms = "god",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            {
                label = "Permissions",
                option = "dropdown",
                data = {
                    { label = "Mod",   value = "mod" },
                    { label = "Admin", value = "admin" },
                    { label = "God",   value = "god" },
                },
            },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:SetPerms" },
        },
    },

    ["set_bucket"] = {
        label = "Set Routing Bucket",
        perms = "god",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Bucket", option = "text" },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:SetBucket" },
        },
    },

    ["get_bucket"] = {
        label = "Get Routing Bucket",
        perms = "god",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:GetBucket" },
        },
    },

    ["mute_player"] = {
        label = "Mute Player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "client", event = "ps-adminmenu:client:MutePlayer" },
        },
    },

    ["noclip"] = {
        label = "Noclip",
        type = "client",
        event = "ps-adminmenu:client:ToggleNoClip",
        perms = "god",
    },

    ["open_inventory"] = {
        label = "Open Inventory",
        perms = "admin",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "client", event = "ps-adminmenu:client:openInventory" },
        },
    },

    ["open_stash"] = {
        label = "Open Stash",
        perms = "god",
        dropdown = {
            { label = "Stash",  option = "text" },
            { label = "Confirm", option = "button",   type = "client", event = "ps-adminmenu:client:openStash" },
        },
    },

    ["revive_all"] = {
        label = "Revive All",
        type = "server",
        event = "ps-adminmenu:server:ReviveAll",
        perms = "god",
    },

    ["revive_player"] = {
        label = "Revive Player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:Revive" },
        },
    },

    ["revive_radius"] = {
        label = "Revive Radius",
        type = "server",
        event = "ps-adminmenu:server:ReviveRadius",
        perms = "mod",
    },

    ["refuel_vehicle"] = {
        label = "Refuel Vehicle",
        type = "client",
        event = "ps-adminmenu:client:RefuelVehicle",
        perms = "god",
    },

    ["set_job"] = {
        label = "Set Job",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Job",     option = "dropdown", data = "jobs" },
            { label = "Grade",   option = "text",     data = "grades" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:SetJob" },
        },
    },

    ["set_gang"] = {
        label = "Set Gang",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Gang",    option = "dropdown", data = "gangs" },
            { label = "Grade",   option = "text",     data = "grades" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:SetGang" },
        },
    },

    ["give_money"] = {
        label = "Give Money",
        perms = "god",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Amount", option = "text" },
            {
                label = "Type",
                option = "dropdown",
                data = {
                    { label = "Cash", value = "cash" },
                    { label = "Bank", value = "bank" },
                    { label = "Crypto", value = "crypto" },
                },
            },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:GiveMoney" },
        },
    },

    ["give_money_all"] = {
        label = "Give Money to All",
        perms = "god",
        dropdown = {
            { label = "Amount",  option = "text" },
            {
                label = "Type",
                option = "dropdown",
                data = {
                    { label = "Cash", value = "cash" },
                    { label = "Bank", value = "bank" },
                    { label = "Crypto", value = "crypto" },
                },
            },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:GiveMoneyAll" },
        },
    },

    ["remove_money"] = {
        label = "Remove Money",
        perms = "god",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Amount", option = "text" },
            {
                label = "Type",
                option = "dropdown",
                data = {
                    { label = "Cash", value = "cash" },
                    { label = "Bank", value = "bank" },
                },
            },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:TakeMoney" },
        },
    },

    ["give_item"] = {
        label = "Give Item",
        perms = "admin",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Item",    option = "dropdown", data = "items" },
            { label = "Amount",  option = "text" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:GiveItem" },
        },
    },

    ["give_item_all"] = {
        label = "Give Item to All",
        perms = "god",
        dropdown = {
            { label = "Item",    option = "dropdown", data = "items" },
            { label = "Amount",  option = "text" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:GiveItemAll" },
        },
    },

    ["spawn_vehicle"] = {
        label = "Spawn Vehicle",
        perms = "mod",
        dropdown = {
            { label = "Vehicle",    option = "dropdown", data = "vehicles" },
            { label = "Confirm", option = "button",   type = "client",  event = "ps-adminmenu:client:SpawnVehicle" },
        },
    },

    ["fix_vehicle"] = {
        label = "Fix Vehicle",
        type = "command",
        event = "fix",
        perms = "mod",
    },

    ["fix_vehicle_for"] = {
        label = "Fix Vehicle for player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:FixVehFor" },
        },
    },

    ["spactate_player"] = {
        label = "Spectate Player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:SpectateTarget" },
        },
    },

    ["telport_to_player"] = {
        label = "Teleport to Player",
        perms = "mod",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:TeleportToPlayer" },
        },
    },

    ["telport_to_coords"] = {
        label = "Teleport to Coords",
        perms = "god",
        dropdown = {
            { label = "Coords",  option = "text" },
            { label = "Confirm", option = "button", type = "client", event = "ps-adminmenu:client:TeleportToCoords" },
        },
    },

    ["teleport_to_location"] = {
        label = "Teleport to Location",
        perms = "god",
        dropdown = {
            { label = "Location",  option = "dropdown", data = "locations" },
            { label = "Confirm", option = "button", type = "client", event = "ps-adminmenu:client:TeleportToLocation" },
        },
    },

    ["teleport_to_marker"] = {
        label = "Teleport to Marker",
        type = "command",
        event = "tpm",
        perms = "god",
    },

    ["teleport_back"] = {
        label = "Teleport Back",
        type = "client",
        event = "ps-adminmenu:client:TeleportBack",
        perms = "mod",
    },

    ["vehicle_dev"] = {
        label = "Vehicle Dev Menu",
        type = "client",
        event = "ps-adminmenu:client:ToggleVehDevMenu",
        perms = "god",
    },

    ["toggle_coords"] = {
        label = "Toggle Coords",
        type = "client",
        event = "ps-adminmenu:client:ToggleCoords",
        perms = "god",
    },

    ["toggle_blips"] = {
        label = "Toggle Blips",
        type = "client",
        event = "ps-adminmenu:client:toggleBlips",
        perms = "god",
    },

    ["toggle_names"] = {
        label = "Toggle Names",
        type = "client",
        event = "ps-adminmenu:client:toggleNames",
        perms = "god",
    },

    ["toggle_cuffs"] = {
        label = "Toggle Cuffs",
        perms = "mod",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:CuffPlayer" },
        },
    },

    ["max_mods"] = {
        label = "Max Vehicle Mods",
        type = "client",
        event = "ps-adminmenu:client:maxmodVehicle",
        perms = "god",
    },

    ["warn_player"] = {
        label = "Warn Player",
        perms = "god",
        dropdown = {
            { label = "Player",  option = "dropdown", data = "players" },
            { label = "Reason",  option = "text" },
            { label = "Confirm", option = "button",   type = "server", event = "ps-adminmenu:server:WarnPlayer" },
        },
    },

    ["infinite_ammo"] = {
        label = "Infinite Ammo",
        type = "client",
        event = "ps-adminmenu:client:setInfiniteAmmo",
        perms = "god",
    },

    ["kick_player"] = {
        label = "Kick Player",
        perms = "mod",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            { label = "Reason", option = "text" },
            { label = "Confirm", option = "button", type = "server", event = "ps-adminmenu:server:KickPlayer" },
        },
    },


    ["play_sound"] = {
        label = "Play Sound",
        perms = "mod",
        dropdown = {
            { label = "Player", option = "dropdown", data = "players" },
            {
                label = "Sound",
                option = "dropdown",
                data = {
                    { label = "Alert",  value = "alert" },
                    { label = "Cuff", value = "cuff" },
                    { label = "Air Wrench", value = "airwrench" },
                },
            },
            { label = "Play Sound", option = "button", type = "client", event = "ps-adminmenu:client:PlaySound" },
        },
    },
}

AddEventHandler("onResourceStart", function()
    Wait(100)
	if GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 'ox_inventory'
    elseif GetResourceState('ps-inventory') == 'started' then
        Config.Inventory = 'ps-inventory'
    elseif GetResourceState('lj-inventory') == 'started' then
        Config.Inventory = 'lj-inventory'
    elseif GetResourceState('qb-inventory') == 'started' then
        Config.Inventory = 'qb-inventory'
	end
end)
