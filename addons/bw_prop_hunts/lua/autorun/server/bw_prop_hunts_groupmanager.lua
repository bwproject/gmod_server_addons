-- ProjectBW: Управление группами игроков через админ-меню (серверная часть).
-- Назначает игрокам группы ULib (сохраняется в users.txt) через меню Prop Hunt.

if not ULib or not ULib.ucl or not BW_PHX_GROUPS then return end

local function isValidGroup(group)
    if group == "user" then return true end
    for _, g in ipairs(BW_PHX_GROUPS) do
        if g.id == group then return true end
    end
    return false
end

net.Receive("BW.PHX.SetGroup", function(_, ply)
    if not IsValid(ply) then return end
    if not ply.PHXIsStaff or not ply:PHXIsStaff() then return end

    local steamid = net.ReadString()
    local group = net.ReadString()

    if not isValidGroup(group) then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Неизвестная группа")
        net.SendToPlayer(ply)
        return
    end

    local target = player.GetBySteamID(steamid)
    if not IsValid(target) then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Игрок не найден")
        net.SendToPlayer(ply)
        return
    end

    if target:GetUserGroup() == "superadmin" then
        net.Start("BW.PHX.SetGroupResult")
        net.WriteBool(false)
        net.WriteString("Нельзя изменить группу суперадмина")
        net.SendToPlayer(ply)
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
    net.SendToPlayer(ply)

    net.Start("BW.PHX.SetGroupNotif")
    net.WriteString(BW_PHX_GroupDisplay(group))
    net.SendToPlayer(target)
end)
