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
    for _, frame in ipairs(vgui.GetWorldPanel():GetChildren() or {}) do
        if IsValid(frame) and frame.GetTitle and frame:GetTitle() == PHX:FTranslate("TM_WINDOW_TITLE") then
            TranslatePanel(frame)
        end
    end
end

timer.Create("BWPHX_TauntRussianUI", 0.25, 0, TranslateTauntWindows)
