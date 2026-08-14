-- ProjectBW Prop Hunt: единый источник данных о группах (общий для клиента и сервера).

if not BW_PHX_GROUPS then
    BW_PHX_GROUPS = {
        { id = "player",    label = "Player",    desc = "обычный игрок" },
        { id = "uncommon",  label = "Uncommon",  desc = "донат 1" },
        { id = "rare",      label = "Rare",      desc = "донат 2" },
        { id = "mythical",  label = "Mythical",  desc = "донат 3" },
        { id = "legendary", label = "Legendary", desc = "донат 4" },
        { id = "immortal",  label = "Immortal",  desc = "донат 5" },
        { id = "ancient",   label = "Ancient",   desc = "донат 6" },
        { id = "moderator", label = "Moderator", desc = "модер" },
        { id = "admin",     label = "Admin",     desc = "админ" },
    }
end

-- Наследование групп ULib: player <- uncommon <- ... ; moderator <- admin.
if not BW_PHX_GROUP_INHERITS then
    BW_PHX_GROUP_INHERITS = {
        player    = { "user" },
        uncommon  = { "player" },
        rare      = { "uncommon" },
        mythical  = { "rare" },
        legendary = { "mythical" },
        immortal  = { "legendary" },
        ancient   = { "immortal" },
        moderator = { "player" },
        admin     = { "moderator" },
    }
end

-- Отображаемое имя группы, например "Uncommon (донат 1)".
function BW_PHX_GroupDisplay(id)
    for _, g in ipairs(BW_PHX_GROUPS) do
        if g.id == id then
            return g.label .. " (" .. g.desc .. ")"
        end
    end
    return id
end
