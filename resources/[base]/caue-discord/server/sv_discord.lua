--[[

    Variables

]]

Commands = {}

Config = {
    ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/823843753269657680/EZiMV7VT94jZm8svZ2W8wEEx1Q8NoEotRbRXDieyKB8OznrXs7Q7WcGUf48lAh9VgtbU",
    ["DISCORD_NAME"] = "Commands Bot",
    ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
    ["BOT_TOKEN"] = "ODE5Nzg5OTQzNjcyNzk5Mjcz.YEru4Q.o2hVCFcABXSmy8xeLZqWpXYNAwU",
    ["BOT_CHANNELID"] = "823842795705335809",
    ["COMMANDS_PREFIX"] = "!",
    ["COMMANDS_TICK"] = 4000,
}

--[[

    Functions

]]

function sendToDiscord(title, text, color)
    local embed = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = text,
            ["footer"] = {
                ["text"] = os.date("%d/%m/%Y %H:%M:%S", os.time())
            },
        }
    }

    PerformHttpRequest(
        Config["DISCORD_WEBHOOK"],
        function(err, text, headers) end,
        "POST",
        json.encode({
            username = Config["DISCORD_NAME"],
            embeds = embed,
            avatar_url = Config["DISCORD_IMAGE"],
        }),
        {["Content-Type"] = "application/json"}
    )
end

function DiscordRequest(method, endpoint, jsondata)
    local data = nil

    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = {
                data = resultData,
                code = errorCode,
                headers = resultHeaders
            }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bot " .. Config["BOT_TOKEN"]
        }
    )

    while data == nil do Citizen.Wait(0) end

    return data
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function formatParams(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    table.remove(t, 1)
    return t
end

function ExecuteCommand(command, author)
    if string.starts(command, Config["COMMANDS_PREFIX"]) then
        for k, v in pairs(Commands) do
            if string.starts(command, Config["COMMANDS_PREFIX"] .. k) then
                if v["DISCORD_IDS"] and not has_value(v["DISCORD_IDS"], author["id"]) then
                    sendToDiscord("Discord Command", "You cannot use this commands", 16711680)
                    return
                end

                v["FUNCTION"](formatParams(command, " "), author)

                return
            end
        end

        sendToDiscord("Discord Command", "Command not found. Please make sure you are entering a valid command", 16711680)
    end
end

--[[

    Threads

]]

Citizen.CreateThread(function()
    while true do
        local chanel = DiscordRequest("GET", "channels/" .. Config["BOT_CHANNELID"], {})

        if chanel.data then
            local data = json.decode(chanel.data)
            local lst = data.last_message_id
            local lastmessage = DiscordRequest("GET", "channels/" .. Config["BOT_CHANNELID"] .. "/messages/" .. lst, {})

            if lastmessage.data then
                local lstdata = json.decode(lastmessage.data)
                if lastdata == nil then lastdata = lstdata.id end

                if lastdata ~= lstdata.id and lstdata.author.username ~= Config.ReplyUserName then
                    ExecuteCommand(lstdata.content, lstdata.author)
                    lastdata = lstdata.id
                end
            end
        end

        Citizen.Wait(Config["COMMANDS_TICK"])
    end
end)