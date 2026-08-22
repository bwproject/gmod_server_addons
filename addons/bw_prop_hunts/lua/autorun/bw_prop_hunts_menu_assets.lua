-- ProjectBW Prop Hunt X - centralized menu assets.
-- Shared: paths/URLs are harmless server-side and needed by sh_init.lua.

PHX = PHX or {}
PHX.BWMenuAssets = PHX.BWMenuAssets or {
    Admin = "vgui/phx_menu/m_admin.png",
    BMAC = "vgui/phx_menu/bmac.png",
    Donate = "vgui/phx_menu/m_donate.png",
    GroupAccess = "vgui/phx_menu/m_groupacc.png",
    Help = "vgui/phx_menu/m_help.png",
    IDBSGuide = "vgui/phx_menu/idbs_guide.png",
    Info = "vgui/phx_menu/m_info.png",
    KOFI = "vgui/phx_menu/kofi.png",
    MapVote = "vgui/phx_menu/m_map.png",
    Player = "vgui/phx_menu/m_player.png",
    PlayerModel = "vgui/phx_menu/m_plmodel.png",
    Plugins = "vgui/phx_menu/m_plugins.png",
    Plus = "vgui/phx_menu/m_plus.png",
    TutorialControl = "vgui/phx_menu/hud_control_help.png",
    Voice = "vgui/phx_menu/m_voice.png",

    -- ProjectBW links.
    DonateRushURL = "https://dalink.to/the_mr_mes109",
    ShopURL = "https://projectbw.ru/shop",

    HelpPages = {
        "vgui/phx_menu/phhelp1.png",
        "vgui/phx_menu/phhelp2.png",
        "vgui/phx_menu/phhelp3.png",
        "vgui/phx_menu/phhelp4.png",
        "vgui/phx_menu/phhelp5.png",
        "vgui/phx_menu/phhelp6.png",
        "vgui/phx_menu/phhelp7.png",
        "vgui/phx_menu/phhelp8.png",
        "vgui/phx_menu/phhelp9.png",
        "vgui/phx_menu/phhelp10.png"
    }
}

function PHX.BWGetMenuAsset(name, fallback)
    return (PHX.BWMenuAssets and PHX.BWMenuAssets[name]) or fallback
end

function PHX.BWGetHelpAsset(index, fallback)
    local pages = PHX.BWMenuAssets and PHX.BWMenuAssets.HelpPages
    return (pages and pages[index]) or fallback
end
