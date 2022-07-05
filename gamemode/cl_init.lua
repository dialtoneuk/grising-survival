include("shared.lua")

--don't draw these hud elements as we have our own
GM.HUDIgnore = {
    CHudHealth = true
}

--[[
	Fonts
--]]
surface.CreateFont("IconFont", {
    font = "Arial",
    extended = false,
    size = 12,
    weight = 100,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
})

--[[
	Hooks
--]]
hook.Add("HUDSHouldDraw", "HUDIgnore", function(name)
    return GM.HUDIgnore[name] == true
end)

--[[
	Gamemode
--]]
--registers panels used by GM the moment we are ready
function GM:Initialize()
    local panels = {
        --our inventory hud panel, the key name is the VGUI class
        HudInventory = {
            Admin = false,
            Hidden = false,
            --Class = "VGUIClass", --can specify the VGUI class like this
            OnContext = function(panel, opened) end,
            OnScoreboard = function(panel, opened) end,
            PostInit = function(panel, opened) return true end, --return false will remove panel
        }
    }

    GM.RegisterPanels(panels) --registers our panels with the panel controller
end