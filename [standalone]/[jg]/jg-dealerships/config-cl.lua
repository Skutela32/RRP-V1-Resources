RegisterNetEvent("jg-dealerships:client:purchase-vehicle:config", function(vehicle, plate, purchaseType, amount, paymentMethod, financed)

end)

RegisterNetEvent("jg-dealerships:client:start-test-drive:config", function(vehicle, plate)

end)

RegisterNetEvent("jg-dealerships:client:showroom-pre-check", function(cb)
  Framework.Client.TriggerCallback("jg-dealerships:server:showroom-pre-check", function(res) -- You can also do some server-side/database checks. This callback can be found in config-sv.lua
    if res and res.error then return false end

    local allowed = true
    -- Write some code here. Update the "allowed" variable to true or false :)
    -- This would typically be used to check you have a license, for example

    if allowed then
      return cb()
    end

    Framework.Client.Notify("You are not allowed to access the showroom", "error")
    return false
  end)
end)