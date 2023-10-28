local blips = {
    { text = "Construction Job",                     color = 46, sprite = 801,  coord = vector3(-96.7, -1014.0, 26.28) },
    { text = "Yanamize",                     color = 69, sprite = 641,  coord = vector3(875.86, -2111.84, 30.46) },
    { text = "Auto Care Repairs",                     color = 21, sprite = 402,  coord = vector3(939.68, -986.48, 38.62) },
    { text = "Bay City Bank",                     color = 68, sprite = 628,  coord = vector3(-1306.78, -823.78, 17.15) },
    { text = "Cat Cafe",                     color = 61, sprite = 89,  coord = vector3(-579.93, -1070.44, 22.33) },
    { text = "Pet Rescue Center",                     color = 5, sprite = 353,  coord = vector3(561.18, 2741.51, 42.87) },
    { text = "Airpot Storage Containers",                     color = 24, sprite = 473,  coord = vector3(-514.59, -2202.06, 5.74) },
    { text = "Davis Storage Sultions",                     color = 24, sprite = 473,  coord = vector3(210.43, -1467.9, 29.17) },
    { text = "You Tool Storage",                     color = 24, sprite = 473,  coord = vector3(2704.2, 3457.53, 55.53) },
    { text = "Paleto Diner Storages",                     color = 24, sprite = 473,  coord = vector3(-2205.2, 4242.99, 48.34) },
}

-- Don't edit below this line.
Citizen.CreateThread(function()
    for i, var in pairs(blips) do
        var.blip = AddBlipForCoord(var.coord.x, var.coord.y, var.coord.z)
        SetBlipAsShortRange(var.blip, true)
        SetBlipSprite(var.blip, var.sprite)
        SetBlipColour(var.blip, var.color)
        SetBlipDisplay(var.blip, 4)
        SetBlipScale(var.blip, 0.9)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(var.text)
        EndTextCommandSetBlipName(var.blip)
    end
end)
