local panel = {}
panel.Model = "models/props_borealis/bluebarrel001.mdl"
panel.Name = "Unknown"
panel.Resource = {}
panel.Key = ""
panel.Amount = 0

function panel:Init()
    self.Icon = vgui.Create("SpawnIcon", self) -- SpawnIcon
    self.Icon:Dock(FILL)
end

function panel:Paint()
    draw.SimpleText(self.Name, "IconFont", 0, 0)
    draw.SimpleText(self.Amount .. "x", "IconFont", 0, self:GetTall() - 12)
end

function panel:SetResource(resource)

    if (not resource.Key) then
        error("Key is not specified")
        return;
    end

    self.Key = resource.Key
    self.Amount = resource.Amount or "0"
    self.Name = resource.Name or "Unknown"
    self.Icon:SetModel(resource.Model or self.Model)
    self.Resource = resource
end

vgui.Register("ItemIcon", panel, "BasePanel")