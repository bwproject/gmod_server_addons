-- ProjectBW Prop Hunt group labels
-- Internal ULX/ULib group IDs stay lowercase for compatibility.
-- This only changes what staff see in the Prop Hunt Admin Groups menu.

local GROUP_LABELS = {
    uncommon  = "Uncommon",
    rare      = "Rare",
    mythical  = "Mythical",
    legendary = "Legendary",
    immortal  = "Immortal",
    ancient   = "Ancient",
    moderator = "Moderator",
    admin     = "Admin",
}

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
