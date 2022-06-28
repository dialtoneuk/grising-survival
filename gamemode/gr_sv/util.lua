
--gets the location of the users persistant data file
function GM.GetPeristantDataFilename(ply)
    if (not IsPlayer(ply)) then
        error("tried to get filename for non player entity")
    end

    return "gr/player_data/" .. ply:SteamID64() .. ".json"
end