GM.recipies = GM.recipies or {}

function GM.RegisterRecipies(tab)
    for k, v in pairs(tab) do
        if (not v.Key) then
            v.Key = k
        end

        --Server only recipies are secret and not shared with the client
        if (v.Server ~= nil and (v.Server and CLIENT)) then continue end

        if (not v.Resources or table.IsEmpty( v.Resources )) then
            error("recipie ingredients are empty")
        end

        GM.RegisterRecipie(v)
    end
end

function GM.RegisterRecipie(recipie)
    if (not recipie.Key) then
        error("Key is required")
    end

    GM.Recipies[recipie.Key] = table.Merge(recipie, {
        Description = "Unknown",
        Admin = false,
        Rewards = {
            Entities = {},
            Weapons = {},
            Experience = {},
            Resources = {}
        },
        Server = false,
        Resources = {},
        Requirements = {
            Crafting = 5,
        }, --
        Icon = "icon32/unknown.png"
    })
end