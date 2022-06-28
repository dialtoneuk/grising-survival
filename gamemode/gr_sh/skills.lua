GM.Skills = GM.Skills or {}

function GM.RegisterSkills(tab)
    for k, v in pairs(tab) do
        if (not v.Key) then
            v.Key = k
        end

        if (v.Server ~= nil and ((v.Server and CLIENT) or (not v.Server and SERVER))) then continue end
        GM.RegisterSkill(v)
    end
end

function GM.GetSkillLevelCap(currentLevel, key)
    return ((currentLevel * GM.Skills[key].AddedLevelMultiplier) + GM.Skills[key].BaseLevelMultiplier) * GM.Skills[key].LevelCap
end

function GM.RegisterSkill(skill)
    if (not skill.Key) then
        error("Key is required")
    end

    GM.Skills[skill.Key] = table.Merge(skill, {
        Admin = false,
        BaseLevelMultiplier = 1.15,
        AddedLevelMultiplier = 0.15,
        LevelCap = 100, --xp required to level up
    })
end

function GM.SkillExists(Key)
    return GM.Skills[Key] ~= nil
end