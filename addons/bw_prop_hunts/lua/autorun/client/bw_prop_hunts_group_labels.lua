-- ProjectBW Prop Hunt group labels (client)
-- Внутренние ID групп ULib/ULib остаются в нижнем регистре для совместимости.
-- Это меняет только то, что персонал видит в меню "Группы" админки Prop Hunt.

local GROUP_LABELS = {}
if BW_PHX_GROUPS then
    for _, g in ipairs(BW_PHX_GROUPS) do
        GROUP_LABELS[g.id] = BW_PHX_GroupDisplay(g.id)
    end
end

hook.Add("PH_CustomTabMenu", "ProjectBW.GroupDisplayNames", function()
    timer.Simple(0, function()
        if not vgui or not vgui.GetAll then return end

        for _, panel in ipairs(vgui.GetAll()) do
            if not IsValid(panel) or not panel.GetText or not panel.SetText then continue end

            local text = panel:GetText()
            local label = GROUP_LABELS[string.lower(text or "")]
            if label and panel:GetClassName() == "DCheckBoxLabel" then
                panel:SetText(label)
            end
        end
    end)
end)
