RegisterNetEvent("jg-dealerships:server:purchase-vehicle:config", function(playerSrc, vehNetId, plate, purchaseType, amountToPay)
  local vehicle = NetworkGetEntityFromNetworkId(vehNetId)

end)

Framework.Server.CreateCallback("jg-dealerships:server:showroom-pre-check", function(src, cb)
  local allowed = true

  -- Write some server-sided code here. Again, update the "allowed" variable

  if not allowed then
    Framework.Server.Notify(src, "You are not allowed to access the showroom (server-side)", "error")
    return cb({ error = true })
  end

  return cb()
end)