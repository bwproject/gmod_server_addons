-- ProjectBW Prop Hunt X - centralized menu assets.
-- Edit this file to change menu images without editing cl_menu.lua.

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
    Voice = "vgui/ph_iconmenu/m_voice.png",
    HelpPages = {
        "vgui/phhelp1.vmt", "vgui/phhelp2.vmt", "vgui/phhelp3.vmt", "vgui/phhelp4.vmt", "vgui/phhelp5.vmt",
        "vgui/phhelp6.vmt", "vgui/phhelp7.vmt", "vgui/phhelp8.vmt", "vgui/phhelp9.vmt", "vgui/phhelp10.vmt"
    }
}

function PHX.BWGetMenuAsset(name, fallback)
    return (PHX.BWMenuAssets and PHX.BWMenuAssets[name]) or fallback
end

function PHX.BWGetHelpAsset(index, fallback)
    local pages = PHX.BWMenuAssets and PHX.BWMenuAssets.HelpPages
    return (pages and pages[index]) or fallback
end
