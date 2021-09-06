local panel = {}

panel.Model = ""
panel.Name = "Unknown"
panel.Value = 0

function panel:Init()
    self.Icon = vgui.Create( "SpawnIcon" , self ) -- SpawnIcon
    self.Icon:Dock(FILL)
end

function panel:Paint()
    draw.SimpleText(panel.Name, "IconFont", 0, 0)
    draw.SimpleText(panel.Value .. "x", "IconFont", 0, self:GetTall() - 12)
end

function panel:SetResource(resource)

    if (!resource.Model) then
        resource.Model = "models/props_borealis/bluebarrel001.mdl"
    end

    self.Icon:SetModel(resource.Model)
end

vgui.Register("ItemIcon", panel, "DPanel")