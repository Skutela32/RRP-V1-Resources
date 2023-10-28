Config = {} or Config

------------------------------------------------------------------
-- Config
------------------------------------------------------------------
-- 🧙‍♂️ keep-harmony
Config.MagicTouch = false
Config.use_progressbar = true
Config.framework = 'qb'           -- [qb / esx]
Config.inventory = 'qb-inventory' -- qb-inventory / ox_inventory
Config.target = 'qb-target'       -- qb-target / ox_target
Config.menu = 'ox_lib'           -- [keep-menu / qb-menu / ox_lib]
Config.input = 'ox_lib'         -- [keep-input / qb-input / ox_lib]
Config.notification = 'ox_lib'   -- [qb / esx / ox_lib / custom
Config.emote = 'rpemotes'         -- [dpemotes / rpemotes / scully_emotemenu]
Config.language = 'en'

-- This table allows for a direct connection to the configured resources. For instance,
-- if you are using a qb-inventory with a different name,
-- you need to update its name here to ensure it's gonna work correctly.
Config.resource_names = {
    framework = 'qb-core',
    inventory = 'qb-inventory',
    target = 'qb-target',
    menu = 'ox_lib',
    input = 'ox_lib'
}
