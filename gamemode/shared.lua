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

/*
    Hooks
*/

--registers our resources
hook.Add("PostGamemodeLoaded","RegisterResources", function()

    local resources = {
        Wood = {
            Value = 15, --sale value
            Admin = false, --not an admin item
            Use = function()
                --potential use function
            end
        },
        Stone = {
            Value = 15,
        },
        Special_Stone = {
            Value = 15,
            Admin = true
        },
        Crabs = {
            Comment = "Its tasty!"
        }
    }

    GM.RegisterResources(resources)
end)

--registers our recepies
hook.Add("PostGamemodeLoaded","RegisterRecepies", function()

    local recepies = {
        Wooden_Bowl = {
            Ingredients = {
                Wood = 15
            },
            XP = 15 --15 xp for crafting
        },
        --admin only
        Special_Wooden_Bowl = {
            Ingredients = {
                Wood = 15
            },
            Admin = true,
            XP = 15 --15 xp for crafting
        },
    }

    GM.RegisterRecepies(recepies)
end)


/*
    Gamemode Overrides
*/

function GM:Initialize()
    --todo
end
