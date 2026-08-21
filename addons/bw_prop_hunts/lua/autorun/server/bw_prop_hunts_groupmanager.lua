-- ProjectBW: управление группами игроков через админ-меню (серверная часть).
-- Назначение сохраняется ULib/ULX в users.txt.

if not ULib or not ULib.ucl or not BW_PHX_GROUPS then return end

local GROUP_RANK = {
    user = 0,
    uncommon = 10,
    rare = 20,
    mythical = 30,
    legendary = 40,
    immortal = 50,
    ancient = 60,
    moderator = 80,
    admin = 90,
    superadmin = 100,
}

local function isValidGroup(group)
    if group == "user" then return true end
    for _, g in ipairs(BW_PHX_GROUPS) do
        if g.id == group then return true end
    end
    return false
end

local function getRank(ply)
    if not IsValid(ply) then return -1 end
    return GROUP_RANK[string.lower(ply:GetUserGroup() or "user")] or 0
end

local function canManageGroup(ply, group)
    local requesterRank = getRank(ply)
    local targetRank = GROUP_RANK[group] or -1

    -- Только Admin/Superadmin могут назначать Moderator/Admin.
    if targetRank >= GROUP_RANK.moderator and requesterRank < GROUP_RANK.admin then
        return false
    end

    -- Нельзя выдавать себе/другому группу равного или более высокого уровня.
    if targetRank >= requesterRank and requesterRank < GROUP_RANK.superadmin then
        return false
    end

    return requesterRank >= GROUP_RANK.moderator
end

net.Receive("BW.PHX.SetGroup", function(_, ply)
    if not IsValid(ply) then return end

    local steamid = net.ReadString()
    local group = string.lower(net.ReadString() or "")

    if not isValidGroup(group) then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Неизвестная группа")
        net.Send(ply)
        return
    end

    if not canManageGroup(ply, group) then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Недостаточно прав для назначения этой группы")
        net.Send(ply)
        return
    end

    local target = player.GetBySteamID(steamid)
    if not IsValid(target) then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Игрок не найден")
        net.Send(ply)
        return
    end

    -- Нельзя менять SuperAdmin через это меню.
    if string.lower(target:GetUserGroup() or "user") == "superadmin" then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Нельзя изменить группу SuperAdmin")
        net.Send(ply)
        return
    end

    -- Нельзя понижать/менять другого игрока, который находится на уровне выше текущего.
    if getRank(target) >= getRank(ply) and getRank(ply) < GROUP_RANK.superadmin then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Нельзя изменить группу игрока с равными или более высокими правами")
        net.Send(ply)
        return
    end

    if group == "user" then
        ULib.ucl.removeUser(steamid)
    else
        ULib.ucl.addUser(steamid, nil, nil, group)
    end

    net.Start("BW.PHX.SetGroupResult")
    net.WriteBool(true)
    net.WriteString(BW_PHX_GroupDisplay(group))
    net.Send(ply)

    net.Start("BW.PHX.SetGroupNotif")
    net.WriteString(BW_PHX_GroupDisplay(group))
    net.Send(target)
end)
