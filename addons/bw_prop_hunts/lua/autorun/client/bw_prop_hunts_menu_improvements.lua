-- ProjectBW Prop Hunt X - menu improvements.
-- Не переписывает оригинальный cl_menu.lua: заменяет только ProjectBW Donate-панель
-- и добавляет безопасное повторное открытие меню.

if SERVER then return end

local PATCH_NAME = "BW.ProjectBWMenuImprovements"
local PATCH_TRIES = 0

local function applyPatch()
    PATCH_TRIES = PATCH_TRIES + 1

    if not PHX or not PHX.UI or not PHX.UI.BaseMainMenu then
        return PATCH_TRIES < 100
    end

    if PHX.UI.ProjectBWMenuImproved then
        return true
    end

    local originalBaseMainMenu = PHX.UI.BaseMainMenu

    PHX.UI.BaseMainMenu = function(ply, cmd, args)
        if not IsValid(ply) then
            ply = LocalPlayer()
        end

        if not IsValid(ply) then return end

        if IsValid(PHX.UI.MainForm) then
            PHX.UI.MainForm:Close()
            PHX.UI.MainForm = nil
        end

        return originalBaseMainMenu(ply, cmd, args)
    end

    function PHX.UI:DonationPanel()
        local panel = vgui.Create("DPanel", PHX.UI.PnlTab)
        panel:Dock(FILL)
        panel:DockMargin(10, 10, 0, 0)
        panel:SetPaintBackground(false)

        local title = panel:Add("DLabel")
        title:Dock(TOP)
        title:SetTall(30)
        title:SetFont("Trebuchet24")
        title:SetText("Поддержать проект")

        local description = panel:Add("DLabel")
        description:Dock(TOP)
        description:DockMargin(0, 6, 0, 10)
        description:SetTall(38)
        description:SetFont("HudHintTextLarge")
        description:SetText("Если вам нравится Prop Hunt и вы хотите поддержать развитие проекта, вы можете помочь разработчику или приобрести привилегию на сервере.")
        description:SetWrap(true)

        local buttons = panel:Add("DPanel")
        buttons:Dock(TOP)
        buttons:SetTall(170)
        buttons:SetPaintBackground(false)

        local rush = buttons:Add("DButton")
        rush:Dock(TOP)
        rush:DockMargin(0, 4, 0, 8)
        rush:SetTall(48)
        rush:SetText("Скинуть разрабу на Adrenaline Rush")
        rush:SetFont("HudHintTextLarge")
        rush.DoClick = function()
            gui.OpenURL("https://dalink.to/the_mr_mes109")
        end

        local shop = buttons:Add("DButton")
        shop:Dock(TOP)
        shop:SetTall(48)
        shop:SetText("Купить привилегию на сервере")
        shop:SetFont("HudHintTextLarge")
        shop.DoClick = function()
            gui.OpenURL("https://projectbw.ru/shop")
        end

        local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, PHX.BWGetMenuAsset("Donate", "vgui/phx_menu/m_donate.png"))
        PHX.UI.PaintTabButton(PanelModify, "Поддержать")
    end

    PHX.UI.ProjectBWMenuImproved = true
    return true
end

hook.Add("InitPostEntity", PATCH_NAME, function()
    timer.Create(PATCH_NAME, 0.1, 100, function()
        if applyPatch() then
            timer.Remove(PATCH_NAME)
        end
    end)
end)
