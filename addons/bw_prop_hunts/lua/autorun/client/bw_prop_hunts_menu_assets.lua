-- ProjectBW Prop Hunt X - centralized menu image paths
-- Edit these paths to replace menu icons without changing cl_menu.lua.

if SERVER then return end

PHX = PHX or {}
PHX.BWMenuAssets = PHX.BWMenuAssets or {
    Admin = "vgui/ph_iconmenu/m_admin.png",
    Donate = "vgui/ph_iconmenu/m_donate.png",
    GroupAccess = "vgui/ph_iconmenu/m_groupacc.png",
    Help = "vgui/ph_iconmenu/m_help.png",
    Info = "vgui/ph_iconmenu/m_info.png",
    MapVote = "vgui/ph_iconmenu/m_map.png",
    Player = "vgui/ph_iconmenu/m_player.png",
    PlayerModel = "vgui/ph_iconmenu/m_plmodel.png",
    Plugins = "vgui/ph_iconmenu/m_plugins.png",
    Plus = "vgui/ph_iconmenu/m_plus.png",
    Voice = "vgui/ph_iconmenu/m_voice.png"
}
