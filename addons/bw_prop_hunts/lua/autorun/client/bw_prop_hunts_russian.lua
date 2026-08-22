-- BW Prop Hunt X — Russian UI patch
-- Заменяет URL кнопок пожертвований на ProjectBW.

if SERVER then return end

local function BWPHX_ReplaceDonateURLs()
    if not istable(PHX) or not istable(PHX.UI) then return end
    if not istable(PHX.LANGUAGES) then return end

    local root = PHX.UI.MainForm
    if not IsValid(root) then return end

    for _, panel in ipairs(root:GetChildren() or {}) do
        for _, child in ipairs(panel:GetChildren() or {}) do
            if child.GetChildren then
                for _, button in ipairs(child:GetChildren() or {}) do
                    if IsValid(button) and button.GetText then
                        local text = button:GetText()
                        if string.find(text, "Adrenaline Rush") or string.find(text, "Coffee") then
                            button.DoClick = function()
                                gui.OpenURL("https://dalink.to/the_mr_mes109")
                            end
                        elseif string.find(text, "привилегию") or string.find(text, "Ko-Fi") then
                            button.DoClick = function()
                                gui.OpenURL("https://projectbw.ru/shop")
                            end
                        end
                    end
                end
            end
        end
    end
end

hook.Add("PostGamemodeLoaded", "BWPHX_RussianUI", function()
    timer.Simple(0, function()
        if not istable(PHX) or not istable(PHX.LANGUAGES) then return end
        local ru = PHX.LANGUAGES.ru
        if not ru then return end

        ru["PHXM_TAB_DONATE"] = "Поддержать"
        ru["PHXM_DONATE_TITLE"] = "Поддержать проект"
        ru["PHXM_DONATE_DESCRIPTION"] = "Если вам нравится наш Prop Hunt и вы хотите поддержать развитие проекта, вы можете помочь разработчику или приобрести привилегию на сервере."
        ru["PHXM_DONATE_ADRENALINE"] = "Скинуть разрабу на Adrenaline Rush"
        ru["PHXM_DONATE_SHOP"] = "Купить привилегию на сервере"
        ru["PHXM_ERROR_SINGLEPLAYER"] = "ВНИМАНИЕ: меню недоступно в одиночной игре!"
        ru["PHXM_ERROR_LANGUAGE_UNAVAILABLE"] = "Ошибка: невозможно открыть меню Prop Hunt BW, поскольку выбранный язык недоступен."
        ru["PHXM_ERROR_LANGUAGE_FALLBACK"] = "Вернитесь к языку по умолчанию, введя в консоли: ph_cl_language en_us"
        ru["PHXM_PLAYER_SEE_LANGUAGES"] = "Посмотреть все доступные языки"
        ru["PHXM_LANGUAGE_NOT_FOUND"] = "Ошибка: язык %s не найден."
        ru["PHXM_MV_CHANGEMAP_NOPLAYER"] = "Принудительно менять карту, если на сервере не осталось игроков?"
    end)

    local _bwphx_wrapped = false

    timer.Simple(0.1, function()
        if not istable(PHX) or not istable(PHX.UI) or not isfunction(PHX.UI.BaseMainMenu) then return end
        if _bwphx_wrapped then return end

        local original = PHX.UI.BaseMainMenu
        local wrapped = function(...)
            local result = original(...)
            timer.Simple(0, BWPHX_ReplaceDonateURLs)
            return result
        end
        _bwphx_wrapped = true
        PHX.UI.BaseMainMenu = wrapped
    end)
end)

timer.Simple(1, function()
    if istable(PHX) and istable(PHX.UI) then
        BWPHX_ReplaceDonateURLs()
    end
end)
