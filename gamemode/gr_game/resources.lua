--registers our resources
hook.Add("RegisterResources","RegisterResources", function()

    local resources = {
        Wood = {
            Description = "Pretty boring fucking wood",
            Value = 2, --base sale value
            Admin = false, --not an admin item,
            MaxCapacity = 0, --May only hold this amount in inventory, zero means infinite
            Model = "models/player/kleiner.mdl",
            OnServerUsage = function(ply)
                --potential use function on the servers end
            end,
            OnClientUsage = function(ply)
                --potential use function on the clients ends
            end
        },
    }

    GM.RegisterResources(resources)
end)