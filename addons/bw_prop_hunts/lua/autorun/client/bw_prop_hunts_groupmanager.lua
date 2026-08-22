-- ProjectBW: Управление группами игроков через админ-меню (клиентская часть).
-- Добавляет в меню Prop Hunt вкладку "Группы" для персонала.

hook.Add("PH_CustomTabMenu", "ProjectBW.GroupManager", function(tab, pVgui, PaintFunc)
    if not IsValid(LocalPlayer()) then return end
    if not LocalPlayer().PHXIsStaff or not LocalPlayer():PHXIsStaff() then return end

    local tabcW = tab.Content:GetWide()

    local panel = tab:Add("DPanel")
    panel:SetBackgroundColor(Color(40, 40, 40, 220))
    panel:Dock(FILL)
    panel:DockMargin(4, 16, 8, 8)

    local title = panel:Add("DLabel")
    title:Dock(TOP)
    title:DockMargin(8, 12, 8, 4)
    title:SetSize(0, 28)
    title:SetText("Управление группами игроков")
    title:SetFont("PHX.MenuCategoryLabel")
    title:SetTextColor(color_white)

    local hint = panel:Add("DLabel")
    hint:Dock(TOP)
    hint:DockMargin(8, 2, 8, 6)
    hint:SetSize(0, 20)
    hint:SetText("Выберите игроку группу и нажмите «Применить». Изменения сохраняются в ULib (users.txt).")
    hint:SetFont("HudHintTextLarge")
    hint:SetTextColor(Color(255, 255, 0))

    if not BW_PHX_GROUPS then
        local missing = panel:Add("DLabel")
        missing:Dock(TOP)
        missing:DockMargin(8, 8, 8, 4)
        missing:SetSize(0, 32)
        missing:SetText("Данные о группах не загружены.")
        missing:SetFont("PHX.MenuCategoryLabel")
        missing:SetTextColor(Color(240, 72, 72))

        local sheetMiss = tab:AddSheet("", panel, PHX.BWGetMenuAsset("GroupAccess", "vgui/phx_menu/m_groupacc.png"))
        PaintFunc(sheetMiss, "Группы")
        return
    end

    local scroll = panel:Add("DScrollPanel")
    scroll:Dock(FILL)
    scroll:DockMargin(8, 4, 8, 4)

    local grid = scroll:Add("DGrid")
    grid:SetPos(8, 4)
    grid:SetCols(1)
    grid:SetColWide(tabcW - 48)
    grid:SetRowHeight(42)

    for _, ply in ipairs(player.GetAll()) do
        if not IsValid(ply) then continue end
        if ply:GetUserGroup() == "superadmin" then continue end

        local row = vgui.Create("DPanel")
        row:SetSize(grid:GetColWide(), 42)
        row.Paint = function(self, w, h)
            surface.SetDrawColor(24, 24, 24, 220)
            surface.DrawRect(0, 0, w, h)
        end

        local btn = vgui.Create("DButton", row)
        btn:SetText("Применить")
        btn:SetFont("HudHintTextLarge")
        btn:Dock(RIGHT)
        btn:DockMargin(8, 6, 4, 6)
        btn:SizeToContentsX(16)

        local combo = vgui.Create("DComboBox", row)
        combo:Dock(RIGHT)
        combo:DockMargin(8, 7, 0, 7)
        combo:SetWide(280)

        combo:AddChoice("Обычный игрок (user)", "user")

        local cur = ply:GetUserGroup()
        local selected = 1
        local known = cur == "user"
        local idx = 1
        for i, g in ipairs(BW_PHX_GROUPS) do
            if g.id ~= "user" then
                combo:AddChoice(BW_PHX_GroupDisplay(g.id), g.id)
                idx = idx + 1
                if g.id == cur then
                    selected = idx
                    known = true
                end
            end
        end
        if not known then
            combo:AddChoice(cur .. " (вне списка)", cur)
            selected = #combo.Choices
        end
        combo:ChooseOptionID(selected)

        local name = vgui.Create("DLabel", row)
        name:Dock(FILL)
        name:DockMargin(12, 0, 0, 0)
        name:SetFont("HudHintTextLarge")
        name:SetTextColor(color_white)
        name:SetContentAlignment(4)
        name:SetText(ply:Nick())
        name:SetToolTip(ply:SteamID())

        btn.DoClick = function()
            local _, value = combo:GetSelected()
            if not value then return end
            btn:SetEnabled(false)
            net.Start("BW.PHX.SetGroup")
            net.WriteString(ply:SteamID())
            net.WriteString(value)
            net.SendToServer()
        end

        grid:AddItem(row)
    end

    local mod = tab:AddSheet("", panel, PHX.BWGetMenuAsset("GroupAccess", "vgui/phx_menu/m_groupacc.png"))
    PaintFunc(mod, "Группы")
end)

net.Receive("BW.PHX.SetGroupResult", function()
    local ok = net.ReadBool()
    local msg = net.ReadString()
    if ok then
        chat.AddText(Color(34, 177, 76), "Группа обновлена: ", color_white, msg)
    else
        chat.AddText(Color(250, 86, 46), msg)
    end
end)

net.Receive("BW.PHX.SetGroupNotif", function()
    local group = net.ReadString()
    chat.AddText(Color(34, 177, 76), "Администрация выдала вам группу: ", color_white, group)
end)
