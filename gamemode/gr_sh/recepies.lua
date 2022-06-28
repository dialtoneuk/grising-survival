GM.Receipes = GM.Receipes or {}

function GM.RegisterRecepies(tab)
    for k, v in pairs(tab) do
        if (not v.Key) then
            v.Key = k
        end

        --Server only recepies are secret and not shared with the client
        if (v.Server ~= nil and (v.Server and CLIENT)) then continue end

        if (not v.Resources or table.IsEmpty( v.Resources )) then
            error("recepie ingredients are empty")
        end

        GM.RegisterRecepie(v)
    end
end

function GM.RegisterRecepie(recepie)
    if (not recepie.Key) then
        error("Key is required")
    end

    GM.Recepies[recepie.Key] = table.Copy(table.Merge(recepie, {
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
    }))
end