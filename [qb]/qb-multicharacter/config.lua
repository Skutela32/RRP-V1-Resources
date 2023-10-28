Config = {}
Config.Interior = vector3(556.23, -417.38, -69.65) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(556.23, -417.38, -69.65) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(558.93, -447.29, -69.65, 320.71) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(556.23, -417.38, -69.65, 236.46) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(561.13, -444.96, -69.63, 137.07) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not
Config.customNationality = false -- Defines if Nationality input is custom of blocked to the list of Countries

Config.DefaultNumberOfCharacters = 3 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:9f716c1063835ec48d868e564c0ceaf4717692a4", numberOfChars = 8 },
}