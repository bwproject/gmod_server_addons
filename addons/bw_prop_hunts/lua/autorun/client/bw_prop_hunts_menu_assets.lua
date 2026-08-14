-- ProjectBW Prop Hunt X - centralized menu assets.
-- Edit this file to change menu images without editing cl_menu.lua.

if SERVER then return end

PHX = PHX or {}
PHX.BWMenuAssets = PHX.BWMenuAssets or {
    Admin = "vgui/phx_menu/m_admin.png",
    Donate = "vgui/phx_menu/m_donate.png",
    GroupAccess = "vgui/phx_menu/m_groupacc.png",
    Help = "vgui/phx_menu/m_help.png",
    Info = "vgui/phx_menu/m_info.png",
    MapVote = "vgui/phx_menu/m_map.png",
    Player = "vgui/phx_menu/m_player.png",
    PlayerModel = "vgui/phx_menu/m_plmodel.png",
    Plugins = "vgui/phx_menu/m_plugins.png",
    Plus = "vgui/phx_menu/m_plus.png",
    Voice = "vgui/phx_menu/m_voice.png",
    HelpPages = {
        "vgui/phx_menu/phhelp1.png", "vgui/phx_menu/phhelp2.png", "vgui/phx_menu/phhelp3.png", "vgui/phx_menu/phhelp4.png", "vgui/phx_menu/phhelp5.png",
        "vgui/phx_menu/phhelp6.png", "vgui/phx_menu/phhelp7.png", "vgui/phx_menu/phhelp8.png", "vgui/phx_menu/phhelp9.png", "vgui/phx_menu/phhelp10.png"
    }
}

function PHX.BWGetMenuAsset(name, fallback)
    return (PHX.BWMenuAssets and PHX.BWMenuAssets[name]) or fallback
end

function PHX.BWGetHelpAsset(index, fallback)
    local pages = PHX.BWMenuAssets and PHX.BWMenuAssets.HelpPages
    return (pages and pages[index]) or fallback
end
