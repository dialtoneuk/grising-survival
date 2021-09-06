GM.Resources = GM.Resources or {}

function GM.RegisterResources(tab)
    for k,v in pairs(tab) do

        if (!v.Name) then
            v.Name = k
        end

        if (v.Server != nil and ((v.Server and CLIENT ) or (!v.Server and SERVER))) then
            continue
        end

        GM.RegisterResources(table.Merge(v, {
            Admin = false,
            Value = 1,
            Use = false,
            Cursed = false,
            Server = false,
            Comment = "Unknown"
        }))
    end
end

function GM.RegisterResource(res)

    if (!res.Name) then error("Name is required") end
    GM.Resources[res.Name] = table.Copy(res)
end

function GM.ResourceExists(name)
    return GM.Resources[name] != nil
end

function GM.GetResource(name)
    return GM.Resources[name]
end