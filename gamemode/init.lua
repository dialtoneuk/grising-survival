include("shared.lua")
AddCSLuaFile("shared.lua")

--[[
    Server hooks
--]]
hook.Add("PlayerInitialSpawn", "InitialSpawn", function(ply)
    ply:ReadPersitentData() --load resources and skills from file
    GM.SendPlayerResources(ply) --send resources to player
    GM.SendPlayerSkills(ply) --sends the skills to the player
end)

--save the players data when they disconnect
hook.Add("PlayerDisconnected", "Disconnected", function(ply)
    ply:SavePersistentData()
end)

--save player data on shutdown
hook.Add("ShutDown", "Shutdown", function()
    for k, v in pairs(player.GetAll()) do
        ply:SavePersistentData()
    end
end)

--[[
	Gamemode
--]]
--the servers initialize
function GM:Initialize()
    --create player data folder on servers end
    if (not file.Exists("gr/player_data/", "DATA")) then
        file.CreateDir("gr/player_data/")
    end
end