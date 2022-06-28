AddCSLuaFile()
ENT.Base = "base_nextbot"
ENT.Spawnable = true

function ENT:Initialize()
    self:SetModel("models/zombie.mdl")
    self.LoseTargetDist = 2000 -- How far the enemy has to be before we lose them
    self.SearchRadius = 1000 -- How far to search for enemies
end