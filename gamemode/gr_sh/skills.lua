GM.Skills = GM.Skills or {}

function GM.RegisterSkills(tab)
    for k,v in pairs(tab) do

        if (!v.Key) then
            v.Key = k
        end

        if (v.Server != nil and ((v.Server and CLIENT ) or (!v.Server and SERVER))) then
            continue
        end

        GM.RegisterSkills(table.Merge(v, {
            Admin = false,
            LevelCap = 100, --xp required to level up
        }))
    end
end

function GM.GetSkillLevelCap(key)
    return GM.Skills[key].LevelCap
end

function GM.RegisterResource(res)

    if (!res.Key) then error("Key is required") end
    GM.Skills[res.Key] = table.Copy(res)
end

function GM.ResourceExists(Key)
    return GM.Skills[Key] != nil
end

function GM.GetResource(Key)
    return GM.Skills[Key]
end