-- ProjectBW Prop Hunt groups
-- Keeps the default ULX/ULib "user" group and adds donor/staff groups.
-- Group names are lowercase internally; the Prop Hunt admin menu displays them with proper capitalization.

if not ULib or not ULib.ucl then return end

local groups = {
    { name = "uncommon",  inherits = { "user" } },
    { name = "rare",      inherits = { "uncommon" } },
    { name = "mythical",  inherits = { "rare" } },
    { name = "legendary", inherits = { "mythical" } },
    { name = "immortal",  inherits = { "legendary" } },
    { name = "ancient",   inherits = { "immortal" } },
    { name = "moderator", inherits = { "user" } },
    { name = "admin",     inherits = { "moderator" } },
}

for _, group in ipairs(groups) do
    if not ULib.ucl.groups[group.name] then
        ULib.ucl.addGroup(group.name, group.inherits, {}, {})
    end
end
