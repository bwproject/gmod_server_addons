-- ProjectBW: Custom Prop Hunt support panel
-- Replaces the original PH:X donation panel with ProjectBW links.

hook.Add("PostGamemodeLoaded", "ProjectBW_PropHuntDonationPanel", function()
    if not PHX or not PHX.UI then return end

    function PHX.UI:DonationPanel()
        local panel = vgui.Create("DPanel", PHX.UI.PnlTab)
        panel:Dock(FILL)
        panel:DockMargin(10, 10, 0, 0)
        panel:SetPaintBackground(false)

        local title = panel:Add("DLabel")
        title:Dock(TOP)
        title:SetSize(0, 34)
        title:SetFont("Trebuchet24")
        title:SetText("Поддержать проект")
        title:SetTextColor(color_white)

        local description = panel:Add("DLabel")
        description:Dock(TOP)
        description:DockMargin(0, 6, 0, 18)
        description:SetSize(0, 42)
        description:SetFont("HudHintTextLarge")
        description:SetText("Если вам нравится наш Prop Hunt и вы хотите поддержать развитие проекта, вы можете помочь разработчику или приобрести привилегию на сервере.")
        description:SetTextColor(color_white)
        description:SetWrap(true)
        description:SetAutoStretchVertical(true)

        local buttons = panel:Add("DPanel")
        buttons:Dock(TOP)
        buttons:SetTall(90)
        buttons:SetPaintBackground(false)

        local btnDev = buttons:Add("DButton")
        btnDev:Dock(TOP)
        btnDev:SetTall(38)
        btnDev:SetText("Скинуть разрабу на Adrenaline Rush")
        btnDev:SetFont("HudHintTextLarge")
        btnDev.DoClick = function()
            gui.OpenURL("https://dalink.to/the_mr_mes109")
        end

        local btnShop = buttons:Add("DButton")
        btnShop:Dock(TOP)
        btnShop:DockMargin(0, 8, 0, 0)
        btnShop:SetTall(38)
        btnShop:SetText("Купить привилегию на сервере")
        btnShop:SetFont("HudHintTextLarge")
        btnShop.DoClick = function()
            gui.OpenURL("https://projectbw.ru/shop")
        end

        local PanelModify = PHX.UI.PnlTab:AddSheet("", panel, PHX.BWGetMenuAsset("Donate", "vgui/phx_menu/m_donate.png"))
        PHX.UI.PaintTabButton(PanelModify, "Поддержать")
    end
end)
