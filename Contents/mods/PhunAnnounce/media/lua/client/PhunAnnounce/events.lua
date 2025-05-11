if isServer() then
    return
end
local Core = PhunAnnounce
local Commands = require("PhunAnnounce/commands")


local function setup()
    Events.OnTick.Remove(setup)
    Core:ini()
    sendClientCommand(Core.name, Core.commands.playerSetup, {})
end

Events.OnTick.Add(setup)