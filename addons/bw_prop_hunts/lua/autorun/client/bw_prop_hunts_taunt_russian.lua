-- BW Prop Hunt X — Russian patch for the Taunt Menu UI.
-- Keeps PHX.FAVORITE_CATEGORY unchanged because it is an internal identifier.

if SERVER then return end

local BWPHX_TAUNT_RU = {
    ["Favorite Taunts"] = "Избранные насмешки",
    ["Sorry, Cannot find in 'favorite' category at the moment"] = "Извините, поиск в категории «Избранные насмешки» пока недоступен.",
}

local function TranslatePanel(panel)
    if not IsValid(panel) then return end

    if panel.GetText and panel.SetText then
        local ok, text = pcall(panel.GetText, panel)
        if ok and isstring(text) then
            local translated = BWPHX_TAUNT_RU[text]
            if translated and translated ~= text then
                panel:SetText(translated)
            end
        end
    end

    for _, child in ipairs(panel:GetChildren() or {}) do
        TranslatePanel(child)
    end
end

local function TranslateTauntWindows()
    if not istable(PHX) or not isfunction(PHX.FTranslate) then return end

    local worldPanel = vgui.GetWorldPanel()
    if not IsValid(worldPanel) then return end

    for _, frame in ipairs(worldPanel:GetChildren() or {}) do
        if IsValid(frame) and frame.GetTitle and isfunction(frame.GetTitle) then
            local ok, title = pcall(frame.GetTitle, frame)
            if ok and title == PHX:FTranslate("TM_WINDOW_TITLE") then
                TranslatePanel(frame)
            end
        end
    end
end

timer.Create("BWPHX_TauntRussianUI", 1, 0, TranslateTauntWindows)
