Config = Config or {}

Config.fuel_script = 'cdn-fuel' --cdn-fuel

Config.MagicTouch = false

Config.VehicleWhiteList = {
     ['defaultPolice'] = {
          --ERPT
          { label = 'Vauxhaul Astra', model = '20mk7' },
          { label = 'Ford Kuga', model = '21kuga' },
          { label = '2022 Focus', model = '22focus' },
          { label = '2022 Volvo90', model = '22v90' },
          { label = 'BMW 530I', model = 'fbi1' },
          -- MO8
          { label = '2020 Skoda', model = '20superb' },
          { label = 'BMW 230d', model = '22330d' },
          { label = 'RPU XC90', model = '21xc90arv2' },
          { label = 'SKODA VRS', model = '21VRS' },
          { label = 'BMW 135I', model = 'polbmw135i' },
          -- MO19
          { label = 'ARV VolvoXC90', model = '21XC90ARV' },
          { label = 'ARV Range Rover', model = 'polrover' },
          { label = 'UNMARKED Volvo S60', model = '21S60RUC' },
          { label = 'ARV BMW X5', model = '21x5arv' },
          -- UC // hc
          { label = 'BMW UM X7', model = 'ucx7 ' },
          { label = 'BMW UM M3', model = 'bmwm3 ' },
     },
     ['heliPolice'] = {
          { label = 'Police Maverick', model = 'Polmav' }
     },
     ['pillboxmain'] = {
          { label = 'Unmarked Doctor Car', model = 'doctorcar' },
          { label = 'HEMS XC90', model = 'hemsxc90' },
          { label = 'Master Renault Van', model = 'master2019' },
          { label = 'Fiat NHS Van', model = 'nhs1' },
          { label = 'Volvo XC90', model = 'nhsvol' },
          { label = 'Skoda Octavia', model = 'skodarrv' },
          { label = 'NHS Box', model = 'NHSBox' },
     },
     ['gas_station'] = {
          { label = 'Adder', model = 'adder' },
          { label = 'Glendale', model = 'glendale' },
     },
     ['vagos_yard'] = {
          -- by using qb-core/shared/vehicles.lua
          allow_all = true,
          { label = 'Sheriff', model = 'Sheriff2' }, -- #TODO add support for additions
     },
}

Config.Garages = {
     --Job Garage:
     ['mrpd'] = {
          label = 'Police Garage (MRPD)',
          type = 'job',
          job = { 'police' }, -- accpets just one job
          onDuty = false,
          spawnPoint = {
               vector4(445.92, -996.92, 24.96, 270.5),
               vector4(445.92, -994.25, 24.96, 270.33),
               vector4(446.08, -991.53, 24.96, 269.54),
               vector4(445.94, -994.25, 25.12, 270.9),
               vector4(445.73, -988.81, 25.12, 269.94),
               vector4(446.24, -986.16, 25.12, 269.11),
               -- flip
               vector4(437.0, -986.11, 25.12, 88.82),
               vector4(437.06, -988.91, 25.12, 89.17),
               vector4(437.16, -991.66, 25.12, 88.86),
               vector4(437.31, -994.24, 25.12, 89.62),
               vector4(437.1, -997.01, 25.12, 89.27),
               vector4(425.99, -976.17, 25.08, 90.6),
               vector4(425.76, -979.0, 25.08, 90.9),
               vector4(425.92, -981.54, 25.08, 90.12),
               vector4(425.89, -984.25, 25.08, 89.43),
               vector4(425.77, -988.98, 25.08, 90.47),
               vector4(425.68, -991.71, 25.08, 89.45),
               vector4(425.66, -994.37, 25.09, 89.49),
               vector4(425.77, -997.05, 25.09, 88.9)
          },
          zones = {
               vector2(423, -1000),
               vector2(450, -999),
               vector2(449, -983),
               vector2(428, -982),
               vector2(428, -973),
               vector2(423, -973)
          },
          minz = 24.66,
          maxz = 28.66,
          WhiteList = Config.VehicleWhiteList['defaultPolice'],
          garage_management = {
               -- access to garage management
               ['CCG76234'] = true
          }
     },
     ['mrpd_heli_pad'] = {
          label = 'Police Heli Pad (mrpd)',
          type = 'job',
          job = { 'police' },
          spawnPoint = {
               vector4(449.22, -981.24, 43.69, 91.21)
          },
          zones = {
               vector2(459.4, -975.1),
               vector2(441.9, -974.7),
               vector2(442.1, -988.7),
               vector2(459.5, -989.1)
          },
          minz = 42.5,
          maxz = 50.95,
          WhiteList = Config.VehicleWhiteList['heliPolice'],
          garage_management = {
               -- access to garage management
               ['FCQ80676'] = true
          }
     },
     ['pillbox'] = {
          label = 'Pillbox Garage',
          type = 'job',
          job = { 'ambulance' }, -- accpets just one job
          onDuty = false,
          spawnPoint = {
               vector4(355.85, -559.37, 28.85, 153.04),
               vector4(360.33, -560.89, 28.85, 159.86),
               vector4(364.98, -562.58, 28.85, 160.86),
               vector4(369.48, -564.45, 28.85, 172.39)
          },
          zones = {
               vector2(350.8591003418, -553.09417724609),
               vector2(348.57504272461, -559.36657714844),
               vector2(370.13018798828, -567.70953369141),
               vector2(372.58703613281, -561.00073242188)
          },
          minz = 24.66,
          maxz = 31.66,
          WhiteList = Config.VehicleWhiteList['pillboxmain'],
          garage_management = {
               -- access to garage management
               ['VZT08307'] = true
          }
     },
     ['gas_station'] = {
          label = 'Gas Station',
          type = 'job',
          job = { 'oilwell' },
          spawnPoint = {
               vector4(298.68, -1241.99, 28.88, 359.68),
               vector4(294.98, -1241.8, 28.87, 0.73),
               vector4(291.94, -1241.92, 28.84, 0.5),
               vector4(288.66, -1241.81, 28.83, 358.8),
               vector4(285.18, -1241.85, 28.81, 0.51),
               vector4(281.55, -1241.91, 28.8, 2.78),
               vector4(278.7, -1241.89, 28.79, 358.64)
          },
          zones = {
               vector2(273.80, -1247.66),
               vector2(273.86, -1236.66),
               vector2(301.53, -1236.18),
               vector2(301.69, -1249.62)
          },
          minz = 28.0,
          maxz = 30.0,
          WhiteList = Config.VehicleWhiteList['gas_station'],
          garage_management = {
               -- access to garage management
               ['GBC74362'] = true
          }
     },
     ['vagos_yard'] = {
          label = 'Vagos',
          type = 'gang',
          gang = { 'vagos' }, -- accpets just one gang
          spawnPoint = {
               vector4(306.6, -2022.9, 19.92, 141.33),
               vector4(308.74, -2024.99, 19.99, 141.96),
               vector4(318.66, -2020.07, 20.3, 322.45)
          },
          zones = {
               vector2(301.20172119141, -2023.0167236328),
               vector2(311.47695922852, -2008.5593261719),
               vector2(344.26721191406, -2036.0698242188),
               vector2(332.54577636719, -2050.0180664062)
          },
          minz = 19.0,
          maxz = 24.0,
          WhiteList = Config.VehicleWhiteList['vagos_yard'],
          garage_management = {
               -- access to garage management
               ['IFD87837'] = true
          }
     },
}

function Notification(source, msg, _type)
     TriggerClientEvent('QBCore:Notify', source, msg, _type)
end

CreateThread(function()
     for garage_name, garage in pairs(Config.Garages) do
          for key, value in pairs(garage.WhiteList) do
               if key ~= 'allow_all' then
                    Config.Garages[garage_name].WhiteList[key].hash = GetHashKey(value.model:lower())
               end
          end
     end
end)
