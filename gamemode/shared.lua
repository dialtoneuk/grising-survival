--sandbox pls
DeriveGamemode("sandbox")

--autoloader for our scripts
GM.Files = GM.Files or {}

--loads shared files
for k,v in pairs(file.Find("gr_sh/*.lua","LUA")) do
    if (SERVER) then
        AddCSLuaFile("gr_sh/" .. v)
    end
    include("gr_sh/" .. v)

    GM.Files.Shared =  GM.Files.Shared or {}
    GM.Files.Shared["gr_sh/" .. v] = v
end

--loads server files (does not index dirs)
if (SERVER) then
    for k,v in pairs(file.Find("gr_sv/*.lua","LUA")) do
        include("gr_sv/" .. v)
        GM.Files.Server = GM.Files.Server or {}
        GM.Files.Server["gr_sv/" .. v] = v
    end
end

--loads client files (does not index dirs)
for k,v in pairs(file.Find("gr_cl/*.lua","LUA")) do
    if (SERVER) then
        AddCSLuaFile("gr_cl/" .. v)
    else
        include("gr_cl/" .. v)
        GM.Files.Client = GM.Files.Client or {}
        GM.Files.Client["gr_cl/" .. v] = v
    end
end

--loads the game folder which contains hooks which load various shared resources such as resources and recepies
for k,v in pairs(file.Find("gr_game/*.lua","LUA")) do
    if (SERVER) then
        AddCSLuaFile("gr_game/" .. v)
    end
    include("gr_game/" .. v)

    GM.Files.Shared =  GM.Files.Shared or {}
    GM.Files.Shared["gr_game/" .. v] = v
end

/*
    Gamemode
*/

function GM:Initialize()
    --todo
end
