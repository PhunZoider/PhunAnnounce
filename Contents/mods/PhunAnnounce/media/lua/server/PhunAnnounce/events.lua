
if isClient() then
    return
end
require "PhunAnnounce/core"
local Commands = require "PhunAnnounce/commands"
local Core = PhunAnnounce

Events.OnServerStarted.Add(function()
    Core:ini()
end)

Events[Core.events.onReady] = function()
    Core:queueAnnouncements()
end