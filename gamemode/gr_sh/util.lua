GM.LogContext = GM.LogContext or {
    General = "General",
    Resources = "Resources",
    Skills = "Skills",
    Recipies = "Recipies"
}

function GM.Log(str, context)
    print(str .. " [" .. context .. "]")
end