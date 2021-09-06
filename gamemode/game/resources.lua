--registers our resources
hook.Add("PostGamemodeLoaded","RegisterResources", function()

    local resources = {
        Wood = {
            Value = 15, --sale value
            Admin = false, --not an admin item,
            Model = "models/player/kleiner.mdl",
            ServerUse = function(ply)
                --potential use function
            end,
            ClientUse = function(ply)

            end
        },
        Stone = {
            Value = 15,
            Model = "models/player/alyx.mdl"
        },
        Special_Stone = {
            Value = 15,
            Admin = true,
            Model = "models/player/barney.mdl"
        },
        Crabs = {
            Comment = "Its tasty!"
        }
    }

    GM.RegisterResources(resources)
end)