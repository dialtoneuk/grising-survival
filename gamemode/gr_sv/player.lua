local ply = FindMetaTable("Player")

ply.Resources = ply.Resources or {}
ply.Skills = ply.Skills or {}

function ply:IncreaseSkill(skill, value)
    value = value or 1

    if (self.Skills[skill]) then
        self.Skills[skill] = {
            Level = 1,
            XP = value
        }

        return
    end

    self.Skills[skill].XP = self.Skills[skill].XP + value
end

function ply:GetSkillLevel(skill)

    if (!self.Skills[skill]) then
        return 0
    end

    return self.Skills[skill].Level
end

function ply:CheckSkills()
    for k,v in pairs(self.Skills) do

        if (!GM.SkillExists(k)) then
            error("skill does not exist")
        end

        if (v.XP >= GM.GetSkillLevelCap(k) ) then
            self.Skills[k].XP = 0
            self.Skills[k].Level = self.Skills[k].Level + 1
        end
    end
end

function ply:GetResource(key)
    return self.Resources[key]
end

function ply:HasResource(key)
    return self.Resources[key] != nil
end

function ply:SendResources()
    net.Start("SendResources")
        net.WriteTable(self.Resources)
    net.Send(self)
end

function ply:SendSkills()
    net.Start("SendResources")
        net.WriteTable(self.Skills)
    net.Send(self)
end

function ply:IncreaseResource(key, amount)
    amount = amount or 1

    if (!self.Resources[key]) then
        self.Resources[key] = amount
    end

    self.Resources[key] = self.Resources[key] + amount
end

function ply:CanCraft(schema)

    for k,v in pair(schema) do
        if (!self.Resources[k]) then
            return false
        end

        if (self.Resources[k] - v < 0 ) then
            return false
        end
    end

    return true
end

function ply:TakeCraftResources(schema)
    for k,v in pair(schema) do
        if (!self.Resources[k]) then
            continue
        end

        self.Resources[k] = self.Resources[k] - v

        if (self.Resources[k] <= 0 ) then
            self.Resources[k] = nil
        end
    end
end

function ply:DecreaseResource(key, amount)
    amount = amount or 1
    self.Resources[key] = self.Resources[key] - amount
end

function ply:AddResource(key, start_value)
    start_value = start_value or 0
    self.Resources[key] = start_value
end

function ply:DeleteResource(key)
    self.Resources[key] = nil
end

function ply:SaveData()

    local file_data = {
        Skills = {},
        Resources = {},
    }

    if (!table.IsEmpty(self.Resources)) then
        file_data.Resources = self.Resources
    end

    if (!table.IsEmpty(self.Skills)) then
        file_data.Skills = self.Skills
    end

    file.Write( self:GetFileName(), util.TableToJSON(file_data))
end

function ply:GetFileName()
    return "gr/player_data/" .. self:SteamID64() .. ".json"
end

function ply:ReadData()

    if (!file.Exists( self:GetFileName(), "DATA")) then
        return {}
    end

    local file_data = util.JSONToTable(file.Read( self:GetFileName(), "DATA"))

    self.Resources = file_data.Resources
    self.Skills = file_data.Skills
end