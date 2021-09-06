local base = {}

base.Inverted = {
    X = false,
    Y = false
}

function base:SetInverted(x, y)

    if (y == nil ) then
        y = false
    end
    if (x == nil ) then
        x = false
    end

    self.Inverted = {
        X = x,
        Y = y
    }
end

function base:SetDockPadding(val)

    self:DockPadding(val, val, val, val)
end

function base:SetDockMargin(val)

    self:DockMargin(val, val, val, val)
end

function base:MyThink()
    --over ride me
end

function base:SetPanelSize(width, height)
    width = width or 400
    height = height or width

    self:SetWide(width)
    self:SetTall(height)
end

--will divide the screen space to scale the panel
function base:SetPanelScale(width, height, numerical_height)
    width = width or 5 --1/5 of the screen
    height = height or width --1/5 of the screen

    if (numerical_height == nil ) then
        numerical_height = true
    end

    self:SetWide(width / ScrW())

    if (numerical_height) then
        self:SetTall(height)
    else
        self:SetTall(height / ScrH())
    end

end

function base:SetPosition(x, y)

    if (self.Inverted.X) then
        x = ScrW() - ( x + self:GetWide() )
    end

    if (self.Inverted.Y) then
        y = ScrW() -  ( y + self:GetTall() )
    end

    self:SetPos(x, y )
end

function base:InstantiatePanel()

    self._Think = self.Think
    self.Think = function()

        self:_Think()
        if (self.MyThink) then
            self:MyThink()
        end
    end

    --todo: settings load here in the future
end

local panel = table.Copy(base)

vgui.Register("Base", base, "DFrame")
vgui.Register("BasePanel", panel, "DPanel")