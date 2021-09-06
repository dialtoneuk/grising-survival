GM.Receipes = GM.Receipes or {}

function GM.RegisterRecepies(tab)

    for k,v in pairs(tab) do

        if (!v.Key) then
            v.Key = k
        end

        if (v.Server != nil and ((v.Server and CLIENT ) or (!v.Server and SERVER))) then
            continue
        end

        if (!v.Ingredients or table.IsEmpty(v.Ingredients)) then
            error("ingredients are empty")
        end

        if (v.SkillAdvancements and !v.SkillAdvancements.Crafting) then
            v.SkillAdvancements.Crafting = 5
        end

        GM.RegisterRecepie(table.Merge(v, {
            Description = "Unknown",
            Admin = false,
            SkillAdvancements = {
                Crafting = 5
            },
            Rewards = {},
            Server = false,
            SkillRequirements = {}, --
            Icon = "icon32/unknown.png"
        }))
    end
end

function GM.RegisterRecepie(recepie)
    if (!recepie.Key) then error("Key is required") end
    GM.Recepies[recepie.Key] = table.Copy(recepie)
end