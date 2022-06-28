--[[
    Network Strings
]]
--
util.AddNetworkString("SendResources")
util.AddNetworkString("SendSkills")

--[[
    Net sends
]]
--

--Sends the server side player resources to the player
function GM.SendPlayerResources(ply)
    if (not IsPlayer(ply)) then
        error("tried to send resources to a non player entity")
    end

    net.Start("SendResources")
    net.WriteTable(ply.Resources or {})
    net.Send(ply)
end

--Sends the server side player skills to the player
function GM.SendPlayerSkills(ply)
    if (not IsPlayer(ply)) then
        error("tried to send skills to a non player entity")
    end

    net.Start("SendResources")
    net.WriteTable(ply.Skills or {})
    net.Send(ply)
end