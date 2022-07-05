GM.GeneratedColours = GM.GeneratedColours or {}

--the colours for our stuff
GM.Colours = GM.Colours or {
    Black = Color(35, 35, 35),
    Gray = Color(145, 145, 145),
    PitchBlack = Color(0, 0, 0),
    SmokeyWhite = Color(195, 195, 195),
    White = Color(255, 255, 255),
    Red = Color(255, 0, 0),
    Green = Color(0, 255, 0),
    Orange = Color(192, 102, 36),
    Pink = Color(255, 0, 200),
    Blue = Color(0, 0, 255)
}

--generates some colours but only once
if (table.IsEmpty(GM.GeneratedColours)) then
    for key, colour in pairs(GM.Colours) do
        GM.GeneratedColours["Faded" .. key] = Color(colour.r, colour.g, colour.b, 200)
        GM.GeneratedColours["Barely" .. key] = Color(colour.r, colour.g, colour.b, 75)
        GM.GeneratedColours["Transparent" .. key] = Color(colour.r, colour.g, colour.b, 25)
        GM.GeneratedColours["Inverted" .. key] = Color(255 - colour.b, 255 - colour.g, 255 - colour.r, 255)
    end

    if (not table.IsEmpty(GM.GeneratedColours)) then
        GM.Colours = table.Merge(GM.Colours, GM.GeneratedColours)
    end
end
