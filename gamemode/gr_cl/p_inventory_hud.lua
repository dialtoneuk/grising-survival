local panel = {}
--get the metatable for the base panel
DEFINE_BASECLASS("Base")

function panel:Init()
    --call base init
    BaseClass.Init()
    self:SetPositionInverted(true, false) --will position right to left instead
    --third argument specifies that we are using a precentage of the screen for scale, since forth argument
    --is not passed and equal to true the second parameter will be treat as a normal px value
    self:SetPanelScale(10, 400, true) --Will take up 10% of the screen and be 400 tall
    self:SetPosition(10, 10) --Position is flipped horiziontally so the origin will be the top right of screen
    --Create neccesary components for the panel to function
    self.Grid = vgui.Create("DGrid", self)
    self.Grid:SetCols(2)
    self.Grid:SetColWidth(self:GetWide() / 2)
    self.Grid:SetColHeight(self:GetTall() / 10)
    self.Grid:Dock(FILL)
end

function panel:EmptyGrid()
    for k, v in pairs(self.Grid:GetItems()) do
        self.Grid:RemoveItem(v)
    end

    self.Grid:InvalidateLayout()
end

function panel:SetResources(resources)
    self:EmptyGrid() --empty grid before

    --TODO: Update already present items
    for k, v in pairs(resources) do
        local elm = vgui.Create("ItemIcon", self.Grid)

        elm:SetResource(table.Merge(table.Copy(GM.Resources[k] or {}), {
            Name = "Unknown",
            Key = k,
            Amount = v or 0
        }))

        self.Grid:AddItem(elm)
    end
end

function panel:Paint()
    surface.SetDrawColor(GM.Colours.FadedGray)
    surface.DrawRect(0, 0, self:GetTall(), self:GetWide())
    surface.SetDrawColor(GM.Colours.Black)
    surface.DrawOutlinedRect(0, 0, self:GetTall(), self:GetWide(), 1)
end

vgui.Register("InventoryHud", panel, "BaseFrame")