--[[

    Functions

]]

function kickAllPlayers()
    local players = GetPlayers()
    for i, v in ipairs(players) do
        DropPlayer(v, "RESTART 🐒")
    end
end

function restartServer()
    kickAllPlayers()
    Citizen.Wait(1000)
    io.popen("start START.bat")
    Citizen.Wait(300)
    os.exit()
end

function gitPull()
    io.popen("start GITPULL.bat")
end

--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(90000)

    TriggerEvent("cron:runAt", 11, 50, gitPull)
    TriggerEvent("cron:runAt", 12, 00, restartServer)
    TriggerEvent("cron:runAt", 23, 50, gitPull)
    TriggerEvent("cron:runAt", 24, 00, restartServer)
end)