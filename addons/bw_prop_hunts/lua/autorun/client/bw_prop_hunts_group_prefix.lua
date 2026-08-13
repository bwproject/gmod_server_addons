-- ProjectBW Prop Hunt - User Group Chat Prefixes
-- Adds a privilege prefix before the player's nickname in chat.
-- User remains without a prefix.

local GROUP_PREFIX = {
    uncommon  = "[Uncommon]",
    rare      = "[Rare]",
    mythical  = "[Mythical]",
    legendary = "[Legendary]",
    immortal  = "[Immortal]",
    ancient   = "[Ancient]",
    moderator = "[Moderator]",
    admin     = "[Admin]",
}

local GROUP_COLOR = {
    uncommon  = Color(120, 200, 120),
    rare      = Color(90, 150, 255),
    mythical  = Color(180, 100, 255),
    legendary = Color(255, 170, 50),
    immortal  = Color(255, 90, 90),
    ancient   = Color(255, 215, 80),
    moderator = Color(80, 200, 255),
    admin     = Color(255, 80, 80),
}

hook.Add("OnPlayerChat", "BW.PropHunt.GroupPrefix", function(ply, text, teamOnly, isDead)
    if not IsValid(ply) then return end

    local group = string.lower(ply:GetUserGroup() or "user")
    local prefix = GROUP_PREFIX[group]

    -- Ordinary players keep the standard chat format.
    if not prefix then return end

    local nameColor = team.GetColor(ply:Team()) or color_white
    local prefixColor = GROUP_COLOR[group] or color_white

    local extra = {}
    if isDead then
        table.insert(extra, Color(255, 80, 80))
        table.insert(extra, "*DEAD* ")
    end

    if teamOnly then
        table.insert(extra, Color(100, 180, 255))
        table.insert(extra, "(TEAM) ")
    end

    table.insert(extra, prefixColor)
    table.insert(extra, prefix)
    table.insert(extra, Color(255, 255, 255))
    table.insert(extra, " ")
    table.insert(extra, nameColor)
    table.insert(extra, ply:Nick())
    table.insert(extra, Color(255, 255, 255))
    table.insert(extra, ": ")
    table.insert(extra, text)

    chat.AddText(unpack(extra))
    return true
end)
