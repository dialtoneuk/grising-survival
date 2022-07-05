local ply = FindMetaTable("Player")
--server side copy of our skills and resources
ply.Resources = ply.Resources or {}
ply.Skills = ply.Skills or {}

function ply:IncreaseSkill(skill, value)
    value = value or 1

    if (GM.Skills[skill] == nil) then
        error("Tried to add skill which does not exist: " + skill)
    end

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
    if (not self.Skills[skill]) then return 0 end

    return self.Skills[skill].Level
end

function ply:CheckSkills()
    for k, v in pairs(self.Skills) do
        if (not GM.SkillExists(k)) then
            error("skill does not exist")
        end

        if (v.XP >= GM.GetSkillLevelCap(k)) then
            self.Skills[k].XP = 0
            self.Skills[k].Level = self.Skills[k].Level + 1
        end
    end
end

function ply:GetResource(key)
    return self.Resources[key]
end

function ply:HasResource(key)
    return self.Resources[key] ~= nil and self.Resources[key] >= 0
end

function ply:IncreaseResource(key, amount)
    amount = amount or 1

    if (not self.Resources[key]) then
        self.Resources[key] = amount
    end

    self.Resources[key] = self.Resources[key] + amount
end

function ply:CanCraft(recipie)
    for k, v in pair(recipie.resources or recipie) do
        if (not self.Resources[k]) then return false end
        if (self.Resources[k] - v < 0) then return false end
    end

    if (recipie.requirements ~= nil) then return self:HasSkillRequirements(recipie.requirements) end

    return true
end

function ply:HasSkillRequirements(requirements)
    for k, v in pairs(requirements) do
        if (not self.Skills[k]) then return false end
        if (self.Skills[k].Level < v) then return false end
    end

    return true
end

function ply:TakeCraftResources(recipie)
    for k, v in pair(recipie) do
        if (not self.Resources[k]) then continue end
        self.Resources[k] = self.Resources[k] - v

        if (self.Resources[k] <= 0) then
            self.Resources[k] = nil
        end
    end
end

function ply:DecreaseResource(key, amount)
    amount = amount or 1
    self.Resources[key] = math.max(0, self.Resources[key] - amount)

    if (self.Resources[key] <= 0) then
        self.Resources[key] = nil
    end
end

function ply:AddResource(key, start_value)
    if (GM.Resources[key] == nil) then
        error("tried to add unknown resource to player: " .. key)
    end

    start_value = start_value or 0
    self.Resources[key] = start_value
end

function ply:DeleteResource(key)
    self.Resources[key] = nil
end

--Saves skills/resources for the player to the servers data folder
function ply:SavePersistentData()
    local file_data = {
        Skills = {},
        Resources = {},
    }

    file_data.Resources = self.Resources or {}
    file_data.Skills = self.Skills or {}
    file.Write(GM.GetPersistentDataFilename(self), util.TableToJSON(file_data))
end

--reads a players persistent data (skills + reources)
function ply:ReadPersitentData()
    if (not file.Exists(GM.GetPersistentDataFilename(self), "DATA")) then
        print("Persistant data does not exist for: " .. self:GetName())

        return
    end

    local file_data = util.JSONToTable(file.Read(GM.GetPersistentDataFilename(self), "DATA"))
    self.Resources = file_data.Resources
    self.Skills = file_data.Skills
end