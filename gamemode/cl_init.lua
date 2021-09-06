include("shared.lua")

--don't draw these hud elements as we have our own
GM.HUDIgnore = {
	"CHudHealth"
}

--[[
	Fonts
--]]

surface.CreateFont( "IconFont", {
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

hook.Add("Initialize", "RegisterPanels", function()

	local panels = {
		--our inventory hud panel
		InventoryHud = {
			Admin = false,
			Hidden = false,
			OnContext = function(panel, opened)

			end,
			OnScoreboard = function(panel, opened)

			end,
		}
	}

	GM.RegisterPanels(panels) --registers our panels with the panel controller
end)

hook.Add("HUDSHouldDraw", "HUDIgnore", function(name)
	if (table.HasValue(name)) then return false end
end)