include("shared.lua")
AddCSLuaFile("shared.lua")

--[[
    Server hooks
--]]
hook.Add("PlayerInitialSpawn", "InitialSpawn", function(ply)
    ply:ReadData() --load resources and skills from file
    GM.SendPlayerResources(ply) --send resources to player
    GM.SendPlayerSkills(ply) --sends the skills to the player
end)

--save the players data when they disconnect
hook.Add("PlayerDisconnected", "Disconnected", function(ply)
    ply:SavePersistantData()
end)

--save player data on shutdown
hook.Add("ShutDown", "Shutdown", function()
    for k, v in pairs(player.GetAll()) do
        ply:SavePersistantData()
    end
end)