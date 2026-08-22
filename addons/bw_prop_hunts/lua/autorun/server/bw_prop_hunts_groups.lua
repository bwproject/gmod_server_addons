-- ProjectBW Prop Hunt groups (server)
-- Создаёт группы ULib/ULX по общему списку BW_PHX_GROUPS.

hook.Add("InitPostEntity", "BW.PHX.GroupsInit", function()
    if not istable(BW_PHX_GROUPS) then return end
    if not ULib or not ULib.ucl then return end

    for _, g in ipairs(BW_PHX_GROUPS) do
        if not ULib.ucl.groups[g.id] and g.id ~= "user" then
            local inherit = BW_PHX_GROUP_INHERITS and BW_PHX_GROUP_INHERITS[g.id]
            ULib.ucl.addGroup(g.id, {}, inherit and inherit[1] or "user")
        end
    end
end)
