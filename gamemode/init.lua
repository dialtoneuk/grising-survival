include("shared.lua")
AddCSLuaFile("shared.lua")

--[[
    Network Strings
]]--

util.AddNetworkString("SendResources")
util.AddNetworkString("SendSkills")

--[[
    Server hooks
--]]

hook.Add("PlayerInitialSpawn", "InitialSpawn", function(ply)

    ply:ReadData() --load resources and skills from file
    ply:SendResources() --send resources to player
    ply:SendSkills() --sends the skills to the player
end)

--save the players data when they disconnect
hook.Add("PlayerDisconnected", "Disconnected", function(ply)
    ply:SaveData()
end)

--save player data on shutdown
hook.Add("ShutDown", "Shutdown", function()
    for k,v in pairs(player.GetAll()) do
        ply:SaveData()
    end
end)