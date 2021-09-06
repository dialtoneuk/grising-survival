GM.Panels = GM.Panels or {}

function GM.RegisterPanels(panels)

	for k,v in pairs(panels) do

		if (!v.Element) then
			v.Element = k
		end

		GM.RegisterPanel(table.Merge(v, {
			Admin = false,
			Hidden = true,
			Panel = nil,
			OnContext = nil,
			OnScoreboard = nil,
			PostInit = nil
		}))
	end
end

function GM.RegisterPanel(panel)

	if (!panel.Element) then
		error("element required")
	end

	GM.Panels[panel.Element] = table.Copy(panel)
end

function GM.InstantiatePanel(element)

	if (IsValid(element.Panel)) then
		element.Panel:Remove()
	end

	if (element.Admin and !LocalPlayer():IsAdmin()) then
		continue
	end

	element.Panel = vgui.Create(element.Element)

	if (!element.Hidden) then
		element.Panel:Show()
	else
		element.Panel:Hide()
	end

	if (element.PostInit and !v.PostInit(element.Panel)) then
		element.Panel:Remove()
	end
end

function GM.InstantiatePanels(reinstantiate)

	if (reinstantiate == nil ) then reinstantiate = false end

	for k,element in pairs(GM.Panels) do

		if (IsValid(element.Panel) and !reinstantiate) then
			continue
		end

		GM.InstantiatePanel(element)
	end
end

function GM.IsValidPanel(element)
	return IsValid(GM.Panels[element].Panel)
end