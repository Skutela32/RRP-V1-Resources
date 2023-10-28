ti.locales.set({
    en = {
        -- Swap point
        vehicle_swap_attach = "Vehicle attached to engine swap-point.",
        vehicle_swap_detach = "Vehicle detached from engine swap-point.",
        no_swap_attached = "No vehicle attached to engine swap-point.",

        -- Engine stand
        stand_already_attached_engine = "Stand already has an engine attached.",
        stand_already_attached_block = "Stand already has an engine block attached.",

        stand_no_attached_engine = "Stand doesn't have an engine attached.",
        stand_cant_attach_component = "You can't attach this component to this engine currently (require %s).",
        stand_component_wont_fit = "This component doesn't fit with this engine.",

        attached_to_stand = "Attached to stand successfully.",
        stand_component_exists = "This type of component is already attached to this engine.",

        engine_not_complete = "This engine is not complete.",

        toggle_dims_hud = "Toggle engine & vehicle dimensions HUD.",

        -- Runtime-created menus
        menu_delivery = "Delivery Point",
        menu_production_delivery = "This stand already has an engine attached.",
        menu_nothing_to_display = "Nothing to display",
        menu_complete = "Complete",
        menu_minutes_remaining = "minutes remaining",
        menu_job_inventory = "Job Inventory",
        menu_none = "NONE",
        menu_withdraw = "Withdraw",
        menu_name = "Name",
        menu_layout = "Layout",
        menu_cylinders = "Cylinders",
        menu_bore = "Bore",
        menu_stroke = "Stroke",
        menu_quality = "Quality",
        menu_craft_time = "Craft Time",
        menu_dimensions = "Dimensions (H/W/D)",
        menu_go_back = "Go Back",
        menu_required = "Required",
        menu_minutes = "Minute(s)",
        menu_craft = "Craft",
        menu_confirm_production = "Confirm Production",
        menu_craft_item = "Craft Item",
        menu_cancel_crafting = "Cancel Crafting",
        menu_engine_component = "Engine Component",
        menu_label = "Label",
        menu_damaged = "DAMAGED",
        menu_remove_component = "Remove Component",
        menu_attach_component = "Attach Component",

        -- General interactions
        engine_wont_fit = "This engine won't fit in this vehicle.",
        no_target_vehicle = "No target vehicle.",
        no_engine_on_lift = "Lift has no engine attached.",
        no_engine_in_vehicle = "This vehicle does not have a custom engine to remove.",

        delivery_success = "Delivery successful.",
        withdraw_success = "Withdraw successful.",

        minutes_remaining_until_complete = "minutes remaining until recipe is complete.",
        return_crane = "[E] Return Crane",
        engine_removal_complete = "Engine removal complete.",
        engine_swap_complete = "Engine swap complete.",
        cant_return_crane = "Can't return crane with engine attached.",

        -- Server side errors
        invalid_permissions = "Invalid permissions.",
        item_not_found_in_inventory = "Item not found in inventory.",
        item_not_found = "Item not found.",
        item_not_ready = "Item not ready",
        recipe_not_found = "Recipe not found on machine",
        missing_item = "Missing item",
        engine_doesnt_exist = "Engine does not exist",
        cant_add_item = "Can't add this item",
        item_doesnt_fit = "This item doesn't fit",
        cant_remove_item = "Can't remove this item",
        engine_already_exists = "Engine already exists on this stand",
        stand_not_found = "Stand not found",

        inventory_item_stored = "Item stored in job inventory.",
        item_cant_be_stored = "You can't store this item in this inventory.",

        invalid_sound_definition = "The handling name you entered for the engine sound is invalid.",

        not_enough_inventory_space = "You don't have enough inventory space for this.",
    }
})

labels = setmetatable({},{
    __index = function(t,k)
        return ti.locales.get(k)
    end
})