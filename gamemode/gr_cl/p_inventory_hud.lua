local panel = {}

function panel:Init()
    self:InstantiatePanel()

    self:SetInverted(true, false) --will position right to left instead
    self:SetPanelScale(6, 400, true)
    self:SetPosition(10, 10)

    self.Grid = vgui.Create("DGrid", self)
    self.Grid:SetCols(2)
    self.Grid:SetColWidth(self:GetWide() / 2)
    self.Grid:SetColHeight(self:GetTall() / 10)
    self.Grid:Dock(FILL)
end

function panel:EmptyGrid()

    for k,v in pairs(self.Grid) do
        self.Grid:RemoveItem(v)
    end

    self.Grid:InvalidateLayout()
end

function panel:SetResources(resources)

    self:EmptyGrid() --empty grid before
    --TODO: Update already present items

    for k,v in pairs(resources) do
        local elm = vgui.Create("ItemIcon", self.Grid)
        elm:SetResource(v)
        self.Grid:AddItem(elm)
    end
end

function panel:Paint()
    surface.SetDrawColor(GM.Colours.FadedGray)
    surface.DrawRect(0, 0, self:GetTall(), self:GetWide())
    surface.SetDrawColor(GM.Colours.Black)
    surface.DrawOutlinedRect(0, 0, self:GetTall(), self:GetWide(), 1)
end

vgui.Register("InventoryHud", panel, "DPanel")