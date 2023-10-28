local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['playermoney'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['robbing'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['cuffing'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['drop'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['trunk'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['stash'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['glovebox'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['banking'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['shops'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['dealers'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['powerplants'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['death'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['joinleave'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['ooc'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['report'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['me'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['pmelding'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['112'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['bans'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['anticheat'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['weather'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['bennys'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['robbery'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['casino'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['traphouse'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['911'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['palert'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['house'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['pshousing'] = 'https://discord.com/api/webhooks/1153391533341556887/UNzKBefGjxQkV7HfjEkkoFv_IxulhcQqmOVTWZDo2wj_SfGWLjc-x3MG7Jifn4u5jEeE',
    ['ps-adminmenu'] = 'https://discord.com/api/webhooks/1164665642008449045/KD2yp87Es4kggMRNHVvEBGKH0Ys13EJRh-L_yrRulNcIrj_qm0IQ9M3k9ARA9DB7aNyD'
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }

    if not logQueue[name] then logQueue[name] = {} end
    logQueue[name][#logQueue[name]+1] = {webhook = webHook, data = embedData}

    if #logQueue[name] >= 10 then
        local postData = { username = 'QB Logs', embeds = {} }

        for i = 1, #logQueue[name] do
            postData.embeds[#postData.embeds+1] = logQueue[name][i].data[1]
        end

        PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })

        logQueue[name] = {}
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds+1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
