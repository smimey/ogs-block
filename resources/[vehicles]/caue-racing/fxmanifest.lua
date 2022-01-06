fx_version "cerulean"
games { "gta5" }

ui_page "nui/dist/index.html"

files {
    "nui/dist/index.html",
    "nui/dist/js/app.js",
    "nui/dist/css/app.css",
    "nui/dist/img/tablet.png",
}

server_scripts {
    "@caue-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts{
    "@caue-lib/client/cl_rpc.lua",
    "client/config.lua",
    "client/utils.lua",
    "client/api.lua",
    "client/exports.lua",
    "client/commands.lua",
    "client/events.lua",
    "client/nui_cb.lua",
    "client/creation.lua",
    "client/checkpoint_race.lua",
}