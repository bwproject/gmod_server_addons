-- ProjectBW Prop Hunt groups (server)
-- Создаёт группы ULib/ULX по общему списку BW_PHX_GROUPS.
-- Имена групп остаются в нижнем регистре для совместимости.

if not ULib or not ULib.ucl or not BW_PHX_GROUPS then return end

for _, g in ipairs(BW_PHX_GROUPS) do
    if not ULib.ucl.groups[g.id] then
        ULib.ucl.addGroup(g.id, BW_PHX_GROUP_INHERITS[g.id] or { "user" }, {}, {})
    end
end
