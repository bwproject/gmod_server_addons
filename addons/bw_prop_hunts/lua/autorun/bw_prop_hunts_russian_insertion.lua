-- ProjectBW: additional Russian localization for Prop Hunt X.
-- Loaded before the gamemode Initialize hook so cl_lang.lua can insert these phrases.

local RU = {
    ["PHX_TM_FAVORITE_CATEGORY"] = "Избранные насмешки",
    ["PHX_TM_FAVORITE_NOT_FOUND"] = "Извините, в категории «Избранные насмешки» пока ничего не найдено.",
    ["PHX_TM_NO_TAUNTS_WARNING"] = "ВНИМАНИЕ: насмешки не обнаружены. Воспроизводится стандартный звук.",
    ["PHX_TM_NO_TAUNTS_CHAT"] = "ВНИМАНИЕ: насмешки не обнаружены, воспроизводится стандартный звук.",
    ["PHX_TM_CONCOMMAND_HELP"] = "Открыть меню насмешек Prop Hunt",

    ["PHXM_MV_CHANGEMAP_NOPLAYER"] = "Принудительно менять карту, если на сервере не осталось игроков?",

    ["PHXM_ERROR_SINGLEPLAYER"] = "ВНИМАНИЕ: меню недоступно в одиночной игре!",
    ["PHXM_ERROR_LANGUAGE_UNAVAILABLE"] = "Ошибка: невозможно открыть меню Prop Hunt X, поскольку выбранный язык недоступен.",
    ["PHXM_ERROR_LANGUAGE_FALLBACK"] = "Вернитесь к языку по умолчанию, введя в консоли: ph_cl_language en_us",
    ["PHXM_PLAYER_SEE_LANGUAGES"] = "Посмотреть все доступные языки",
    ["PHXM_PLAYER_FORCED_LANGUAGE"] = "Сервер принудительно использует язык: %s",

    ["PHXM_TAB_DONATE"] = "Поддержать",
    ["PHXM_DONATE_TITLE"] = "Поддержать проект",
    ["PHXM_DONATE_DESCRIPTION"] = "Если вам нравится наш Prop Hunt и вы хотите поддержать развитие проекта, вы можете помочь разработчику или приобрести привилегию на сервере.",
    ["PHXM_DONATE_ADRENALINE"] = "Скинуть разрабу на Adrenaline Rush",
    ["PHXM_DONATE_SHOP"] = "Купить привилегию на сервере",
}

list.Set("PHX.LanguageInsertion", "projectbw_russian", {
    ru = RU
})
