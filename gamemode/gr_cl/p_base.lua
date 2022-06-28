local base = {}

base.Inverted = {
    X = false,
    Y = false
}

function base:SetPositionInverted(x, y)
    if (y == nil) then
        y = false
    end

    if (x == nil) then
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


function base:SetPanelSize(width, height)
    width = width or 400
    height = height or width
    self:SetWide(width)
    self:SetTall(height)
end

--will divide the screen space to scale the panel, if the third option is set wll treat width as precentage value
--if four arg is set to true then will treat height as percentage value
function base:SetPanelScale(width, height, percentage_value_width, percentage_value_height)
    width = width or 25 --1/4 of the screen
    height = height or width
    percentage_value_height = percentage_value_height or false
    percentage_value_width = percentage_value_width or false

    if (percentage_value_height ~= true) then
        self:SetTall(height)
    else
        self:SetTall(ScrH() * (height / 100))
    end

    if (percentage_value_width ~= true) then
        self:SetWide(width)
    else
        self:SetWide(ScrW() * (width / 100))
    end
end

function base:SetPosition(x, y)
    if (self.Inverted.X) then
        x = ScrW() - (x + self:GetWide())
    end

    if (self.Inverted.Y) then
        y = ScrW() - (y + self:GetTall())
    end

    self:SetPos(x, y)
end

function base:Think()
    --base think
end

function base:Init()
    --base init
end

local panel = table.Copy(base)
vgui.Register("BaseFrame", base, "DFrame")
vgui.Register("BasePanel", panel, "DPanel")