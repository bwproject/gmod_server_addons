-- BW Prop Hunt X — Russian UI patch
-- Дополнительная русификация интерфейса без изменения оригинального cl_menu.lua.

if SERVER then return end

local function BWPHX_Translate(text)
    local translations = {
        ["WARNING: Menu is not available in Single Player Mode!"] = "ВНИМАНИЕ: меню недоступно в одиночной игре!",
        ["Error: Cannot open Prop Hunt X Menu because the language you're using is not available."] = "Ошибка: невозможно открыть меню Prop Hunt X, поскольку выбранный язык недоступен.",
        ["Please revert to default language by typing 'ph_cl_language en_us' in the console!"] = "Вернитесь к языку по умолчанию, введя в консоли: ph_cl_language en_us",
        ["Support Prop Hunt: X!"] = "Поддержать проект",
        ["If you liked with this gamemode or update and wanted to help with PH:X2Z Development, you can help me by donating!"] = "Если вам нравится наш Prop Hunt и вы хотите поддержать развитие проекта, вы можете помочь разработчику или приобрести привилегию на сервере.",
        ["Donate via Buy me a Coffee"] = "Скинуть разрабу на Adrenaline Rush",
        ["Donate via Buy Ko-Fi"] = "Купить привилегию на сервере",
        ["Donate"] = "Поддержать",
        ["See all available Languages"] = "Посмотреть все доступные языки",
        ["Apply"] = "Применить",
        ["Apply Model"] = "Применить модель",
    }
    return translations[text] or text
end

local function BWPHX_TranslatePanel(panel)
    if not IsValid(panel) then return end

    if panel.GetText and panel.SetText then
        local ok, text = pcall(panel.GetText, panel)
        if ok and isstring(text) then
            local translated = BWPHX_Translate(text)
            if translated ~= text then
                panel:SetText(translated)
            end
        end
    end

    for _, child in ipairs(panel:GetChildren() or {}) do
        BWPHX_TranslatePanel(child)
    end
end

local function BWPHX_ApplyDonationLinks()
    if not IsValid(PHX) or not IsValid(PHX.UI) or not IsValid(PHX.UI.PnlTab) then return end

    BWPHX_TranslatePanel(PHX.UI.MainForm)

    local root = PHX.UI.MainForm
    if not IsValid(root) then return end

    -- Меняем ссылки старого Donate-блока, если оригинальный cl_menu.lua его создал.
    for _, child in ipairs(root:GetChildren() or {}) do
        BWPHX_TranslatePanel(child)
    end

    for _, panel in ipairs(root:GetChildren() or {}) do
        for _, child in ipairs(panel:GetChildren() or {}) do
            if child.GetChildren then
                for _, button in ipairs(child:GetChildren() or {}) do
                    if IsValid(button) and button.GetText then
                        local text = button:GetText()
                        if text == "Скинуть разрабу на Adrenaline Rush" then
                            button.DoClick = function()
                                gui.OpenURL("https://dalink.to/the_mr_mes109")
                            end
                        elseif text == "Купить привилегию на сервере" then
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
    -- Добавляем ключи, которые могут использоваться другими частями меню.
    timer.Simple(0, function()
        if not IsValid(PHX) or not PHX.LANGUAGES then return end
        local ru = PHX.LANGUAGES.ru
        if not ru then return end

        ru["PHXM_TAB_DONATE"] = "Поддержать"
        ru["PHXM_DONATE_TITLE"] = "Поддержать проект"
        ru["PHXM_DONATE_DESCRIPTION"] = "Если вам нравится наш Prop Hunt и вы хотите поддержать развитие проекта, вы можете помочь разработчику или приобрести привилегию на сервере."
        ru["PHXM_DONATE_ADRENALINE"] = "Скинуть разрабу на Adrenaline Rush"
        ru["PHXM_DONATE_SHOP"] = "Купить привилегию на сервере"
        ru["PHXM_ERROR_SINGLEPLAYER"] = "ВНИМАНИЕ: меню недоступно в одиночной игре!"
        ru["PHXM_ERROR_LANGUAGE_UNAVAILABLE"] = "Ошибка: невозможно открыть меню Prop Hunt X, поскольку выбранный язык недоступен."
        ru["PHXM_ERROR_LANGUAGE_FALLBACK"] = "Вернитесь к языку по умолчанию, введя в консоли: ph_cl_language en_us"
        ru["PHXM_PLAYER_SEE_LANGUAGES"] = "Посмотреть все доступные языки"
        ru["PHXM_LANGUAGE_NOT_FOUND"] = "Ошибка: язык %s не найден."
        ru["PHXM_MV_CHANGEMAP_NOPLAYER"] = "Принудительно менять карту, если на сервере не осталось игроков?"
    end)

    timer.Simple(0.1, function()
        -- Оборачиваем открытие меню: после создания всех элементов переводим
        -- оставшиеся хардкодные строки оригинального интерфейса.
        if not PHX.UI or not PHX.UI.BaseMainMenu then return end
        if PHX.UI.BaseMainMenu.__BWPHXRussian then return end

        local original = PHX.UI.BaseMainMenu
        local wrapped = function(...)
            local result = original(...)
            timer.Simple(0, BWPHX_ApplyDonationLinks)
            return result
        end
        wrapped.__BWPHXRussian = true
        PHX.UI.BaseMainMenu = wrapped
    end)
end)

-- Если меню уже было загружено до PostGamemodeLoaded.
timer.Simple(1, function()
    if IsValid(PHX) and PHX.UI then
        BWPHX_ApplyDonationLinks()
    end
end)
