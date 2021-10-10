local DiscordData = {}

DiscordData.Webhooks = {
    ["log"] = "YOUR_WEBHOOK_HERE"
}

DiscordData.UsernameForWebhook = 'Roda-Invocation' --The name of the webhook xd
DiscordData.Picture = 'https://p4.wallpaperbetter.com/wallpaper/196/582/357/cat-4k-of-desktop-background-wallpaper-preview.jpg'
DiscordData.Colors = {
    ["default"] = 16711680,
    ["blue"] = 25087,
    ["green"] = 762640, 
    ["white"] = 16777215,
    ["black"] = 0,
    ["orange"] = 16743168,
    ["lightgreen"] = 65309,
    ["yellow"] = 15335168,
    ["turqois"] = 62207,
    ["pink"] = 16711900,
    ["red"] = 16711680, 
}


RegisterServerEvent('Roda-Invocation:SendDiscordLogs')
AddEventHandler('Roda-Invocation:SendDiscordLogs', function(name, title, color, message, tagEveryone, tagcontent )
    local tag = tagEveryone ~= nil and tagEveryone or false
    local webHook = DiscordData.Webhooks[name] ~= nil and DiscordData.Webhooks[name] or DiscordData.Webhooks[name]

    local embedData = {
        {
            ["title"] = title,
            ["color"] = DiscordData.Colors[color] ~= nil and DiscordData.Colors[color] or DiscordData.Colors[name],
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = message,
        }
    }

    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = DiscordData.UsernameForWebhook, embeds = embedData, avatar_url = DiscordData.Picture}), { ['Content-Type'] = 'application/json' })

    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = DiscordData.UsernameForWebhook, content = tagcontent, avatar_url = DiscordData.Picture}), { ['Content-Type'] = 'application/json' })
    end
end)
