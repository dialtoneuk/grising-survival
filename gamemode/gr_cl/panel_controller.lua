GM.Panels = GM.Panels or {}

--Registers a panel so that it can be created when we need it
function GM.RegisterPanels(panels)
    for k, v in pairs(panels) do
        if (not v.Class) then
            v.Class = k
        end

        GM.RegisterPanel(v)
    end
end

--Registers a panel
function GM.RegisterPanel(panel)
    if (not panel.Class) then
        error("element required")
    end

    GM.Panels[panel.Class] = table.Merge(v, {
        Admin = false,
        Hidden = true,
        Class = panel.Class,
        Panel = nil,
        OnContext = nil,
        OnScoreboard = nil,
        PostInit = nil
    })
end

--creates a panel from a table and shows/hides it if needed, will remove if PostInit returns false
function GM.CreatePanel(element)
    if (IsValid(element.Panel)) then
        element.Panel:Remove()
    end

    if (element.Admin and not LocalPlayer():IsAdmin()) then continue end
    element.Panel = vgui.Create(element.Class)

    if (not element.Hidden) then
        element.Panel:Show()
    else
        element.Panel:Hide()
    end

    if (element.PostInit and type(v.PostInit) == "function" and not v.PostInit(element.Panel)) then
        element.Panel:Remove()
    end

    return element
end

-- Creates all of the panels
function GM.CreateAllPanels(reinstantiate)
    if (reinstantiate == nil) then
        reinstantiate = false
    end

    for k, element in pairs(GM.Panels) do
        if (IsValid(element.Panel) and not reinstantiate) then continue end
        GM.CreatePanel(element)
    end
end

--abstraction for checking if panel is valid
function GM.IsValidPanel(element)
    return IsValid(GM.Panels[element].Panel)
end