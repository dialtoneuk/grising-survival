GM.Resources = GM.Resources or {}

function GM.RegisterResources(tab)
    for k, v in pairs(tab) do
        if (not v.Name) then
            v.Name = k
        end

        if (v.Server ~= nil and ((v.Server and CLIENT) or (not v.Server and SERVER))) then continue end
        GM.RegisterResources(v)
    end
end

function GM.RegisterResource(res)
    if (not res.Name) then
        error("Name is required")
    end

    GM.Resources[res.Name] = table.Copy(table.Merge(res, {
        Admin = false,
        Value = 1,
        Use = false,
        MaxCapacity = 0,
        Model = "models/player/kleiner.mdl",
        Server = false,
        Description = "A mysteriously unknown item."
    }))
end

function GM.ResourceExists(name)
    return GM.Resources[name] ~= nil
end