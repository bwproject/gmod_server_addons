-- ProjectBW: управление группами игроков через админ-меню (серверная часть).
-- Назначение сохраняется ULib/ULX в users.txt.

if not istable(BW_PHX_GROUPS) then return end

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

    if targetRank >= GROUP_RANK.moderator and requesterRank < GROUP_RANK.admin then
        return false
    end

    if targetRank >= requesterRank and requesterRank < GROUP_RANK.superadmin then
        return false
    end

    return requesterRank >= GROUP_RANK.moderator
end

local function sendResult(ply, ok, msg)
    net.Start("BW.PHX.SetGroupResult")
    net.WriteBool(ok)
    net.WriteString(msg)
    net.Send(ply)
end

net.Receive("BW.PHX.SetGroup", function(_, ply)
    if not IsValid(ply) then return end

    if not ULib or not ULib.ucl then
        sendResult(ply, false, "ULib не загружен")
        return
    end

    local steamid = net.ReadString()
    local group = string.lower(net.ReadString() or "")

    if not isValidGroup(group) then
        sendResult(ply, false, "Неизвестная группа")
        return
    end

    if not canManageGroup(ply, group) then
        sendResult(ply, false, "Недостаточно прав для назначения этой группы")
        return
    end

    local target = player.GetBySteamID(steamid)
    if not IsValid(target) then
        sendResult(ply, false, "Игрок не найден")
        return
    end

    if string.lower(target:GetUserGroup() or "user") == "superadmin" then
        sendResult(ply, false, "Нельзя изменить группу SuperAdmin")
        return
    end

    if getRank(target) >= getRank(ply) and getRank(ply) < GROUP_RANK.superadmin then
        sendResult(ply, false, "Нельзя изменить группу игрока с равными или более высокими правами")
        return
    end

    if group == "user" then
        ULib.ucl.removeUser(steamid)
    else
        ULib.ucl.addUser(steamid, nil, nil, group)
    end

    sendResult(ply, true, BW_PHX_GroupDisplay and BW_PHX_GroupDisplay(group) or group)

    net.Start("BW.PHX.SetGroupNotif")
    net.WriteString(BW_PHX_GroupDisplay and BW_PHX_GroupDisplay(group) or group)
    net.Send(target)
end)
