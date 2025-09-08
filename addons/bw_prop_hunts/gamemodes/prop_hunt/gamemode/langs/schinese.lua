-- Kindly free to improve the language.

-- Originally written by: 辣雞 | LaGi

local L={}

L.code = "zh-CN"

L.Name 		 	= "简体中文"
L.NameEnglish	= "Simplified Chinese"
L.Author			= "辣雞 | LaGi, Ph.X"
-- Can Accept: String, and Table.
L.AuthorURL		= {
     "http://steamcommunity.com/profiles/76561198057744616",
     "https://steamcommunity.com/profiles/76561198034356313"
}

-- Special Section that isn't String-based
L.SUICIDEMSG = {  -- Fix me: there was addition text here but feel free to add more.
	"自杀!", -- i believe this was from 9gag joke.
	"神秘的死亡.",
	"离奇的消失.",
	"盲狙自己.",
	"愤怒的弹出去了.",
	"醉倒了.",
	"阵亡. 祝下次好运!",
	"为杀害无辜物品而后悔.",
	"穿越到暗房.",
	"正在努力灭绝.",
	"挂了.",
	"惊慌失措并试图杀死所有物品.",
	"停手, 找人帮忙.",
	"把自己给拍没了.",
	"被棍子绊倒了.",
	"死于力量之下.",
	"变成布娃娃了.",
}

L.RANDOM_SPECTATORS = { --> FRETTA
	"观看与休息.",
	"看他们闲逛.",
	"看一些东西.",
	" ",
}

L["PHX_TEAM_CONNECTING"] = "正在连接"
L["PHX_TEAM_PROPS"]		= "物品"
L["PHX_TEAM_HUNTERS"] 	= "猎人"
L["PHX_TEAM_UNASSIGNED"]	= "未分配"
L["PHX_TEAM_SPECTATOR"] 	= "观众"

-- List of string-based translation

-- // FRETTA SECTION \\
--  FRETTA: Kill text (X killed Y)
L["HUD_KILLED"]				= "杀了"

-- FRETTA: HUDs
L["HUD_TIME"] 				= "时间"
L["HUD_ROUND"]				= "回合"
L["HUD_WAITPLY"]				= "正在等待玩家..."
L["HUD_DEAD"]				= "(死亡) "

L["HUD_TEAMWIN"]				= "%s 胜利!"
L["HUD_LOSE"]				= "平手, 大家都是输家!"
L["MISC_TIMELEFT"]			= "时间剩余: %s"
L["MISC_GAMEEND"] 			= "本回合游戏结束"

-- FRETTA: Team selection screen (F2)
L["DERMA_TEAMSELECT"]		= "选择队伍"

-- FRETTA: F1 screeen
L["DERMA_RTV"] 				= "投票选择 (RTV)"
L["DERMA_PHMENU"] 			= "物品猎杀菜单"
L["DERMA_CHANGETEAM"]		= "变更队伍"

-- FRETTA: Scoreboard
L["DERMA_PLAYER"]			= "(%d 玩家)"	
L["DERMA_PLAYERS"]			= "(%d 玩家)"
L["DERMA_NAME"]				= "名称"
L["DERMA_KILLS"]				= "击杀"
L["DERMA_DEATHS"]			= "死亡"
L["DERMA_PING"]				= "Ping"
L["DERMA_SERVER_TAG"]		= "SV" --Fix Me
L["DERMA_BOT_TAG"]			= "BOT" -- Fix Me
L["DERMA_GAMEMODE_CREDITS"]	= "%s | Version: %s - Rev. %s" -- Fix Me

L["CHAT_JOINED"]				= " 已加入 "
L["CHAT_JOINEDTHE"]			= " 加入了 "

L["CHAT_SWAPBALANCE"]		= "为了平衡队伍，将 %s 送到 %s 了."
L["CHAT_SWAPBALANCEYOU"]		= "你被换队以实现完美的游戏平衡." -- Smile... for even in death, you have become children of Thanos

-- FRETTA: Splash Starting Screen
L["SPASHSCREEN_BY_X"]		= "by %s"	--Fix Me
-- RichTextBox
L["HELP_DONATORS_AND_CONTRIBUTORS"]  = "\n\nDonators & Contributors:\n- %s" --Fix Me
-- // END OF FRETTA SECTION \\

L["HELP_F1"] 				= [[物品猎杀 X 项目.

本项目旨在让物品猎杀更加现代化与可定制.

详情请访问:
https://gmodgameservers.com/prophuntx

要查看更多信息、帮助和指南，请按[F1]键，然后点击[物品猎杀菜单]按钮.

版本: ]].. PHX.VERSION ..[[ 修订版: ]].. PHX.REVISION ..[[

祝您玩得开心!]]

-- Important!
L["LANGUAGE_CHANGED"]		= "首选语言更改为 %s"

-- internal cl_menutypes section.
L["SUBTYPE_PREFERED_LANG"]	= "首选语言"
--L["SUBTYPE_TEXTENTRY_?"]	= "???"

-- Events
L["EV_PLAYER_CONNECT"]		= "%s 已连接服务器."
L["EV_PLAYER_JOINED"]		= "%s 加入了服务器."
L["EV_PLAYER_DISCONNECT"]	= "%s 离开了服务器 (原因: %s)"

-- HUD elements
L["HUD_HP"]					= "生命"
L["HUD_AMMO"] 				= "弹药"	-- obsolete
L["HUD_MAGSEC"]				= "弹匣. / 次要." --Magazine Counts (separator) Secondary Magazine Counts

-- !!WEAPON NAMES CANNOT BE TRANSLATED, THEY USE FROM language.GetPhrase THEREFORE IT'S IMPOSSIBLE TO DO.

L["TEAM_PROPS"]				= L["PHX_TEAM_PROPS"]
L["TEAM_HUNTERS"]			= L["PHX_TEAM_HUNTERS"]

L["HUD_ROTLOCK"]				= "物品旋转: 锁定"
L["HUD_ROTFREE"]				= "物品旋转: 自由"
L["HUD_KILLEDBY"]			= "你被 %s 击杀"

L["HUD_AUTOTAUNT"]			= "在 %d 秒后自动嘲讽"
L["HUD_AUTOTAUNT_ALT"]		= "在 %d 后自动嘲讽"

L["HUD_TargetID"]			= "玩家: %s (%d%%)" -- Player: <NAME> (<HEALTH>%)

L["HUD_BLINDED"]				= "%s 将在 %s 秒后复明并开始行动"
L["HUD_UNBLINDED"]			= "准备好了吗，咱们来喽!"

L["BLIND_RESPAWN_TEAM"]		= "失明时间内，你在 %d 秒后在 %s队伍中复活."
L["BLIND_RESPAWN"]			= "失明时间内，你在 %d 秒后复活."

L["MISC_ACCEPT"]				= "接受"
L["MISC_OK"]					= "OK"
L["MISC_CLOSE"]				= "关闭"
L["MISC_PREV"]				= "< 前页"
L["MISC_NEXT"]				= "后页 >"
L["MISC_ACCESSDENIED"]		= "拒绝访问"

-- Chat messages
L["CHAT_NOPLAYERS"]			= "没有足够的玩家来开始游戏!"
L["CHAT_SWAP"]				= "队伍已交换!"

L["CHAT_SWAPTEAM_WARNING"]   = "你已经变更队伍 %dx (最多 %dx). 之后将无法再变更队伍。"
L["CHAT_SWAPTEAM_REVERT"]	= "不能变更到 %s 队伍，因为你超出变更次数."

L["CHAT_PROP_NO_ROOM"] 		= "没有足够的空间变形该物品!"

-- Notification
L["NOTIFY_IN_PROP_TEAM"]		= "你在物品队伍中获得旋转能力! 你可以移动鼠标来旋转."
L["NOTIFY_ROTATE_NOTICE"]	= "你可以按下(默认)[R]键来切换锁定旋转!"

-- Custom Taunt Window
L["TM_WARNING_CT_DISABLE"]	= "[PHX - 嘲讽] 警告: 本服务器禁用自定义嘲讽."
L["TM_NO_TAUNTS"]			= "警告: 在此类别中未找到嘲讽."
L["TM_PLAY_ONLY_ALIVE"] 		= "仅能在活着的时候使用自定义嘲讽."

L["TM_WINDOW_TITLE"]			= "物品猎杀自订嘲讽窗口"
L["TM_NOTICE_PLSWAIT"]		= "随机嘲讽种,请稍等 %s 秒!"
L["TM_NOTICE_PLAYPREVIEW"]	= "预览嘲讽: %s"

L["TM_TOOLTIP_PLAYTAUNT"] 	= "播放嘲讽"
L["TM_TOOLTIP_PREVIEW"]		= "预览嘲讽"
L["TM_TOOLTIP_PLAYCLOSE"]	= "播放嘲讽并关闭"
L["TM_TOOLTIP_PLAYRANDOM"]	= "随机播放嘲讽"
L["TM_TOOLTIP_CLOSE"]		= "关闭"
L["TM_MENU_CLOSE"]			= "关闭菜单"

L["TM_DELAYTAUNT_NOT_EXIST"] = "服务器找不到你选择的嘲讽!"
L["TM_DELAYTAUNT_PLSWAIT"]	= "稍等 %s 秒!"

--[[
	PHX Menu window
]]
L["PHXM_WINDOW_TITLE"]		= "物品猎杀 X - 高级设置 & 菜单"
L["SERVER_INFO_MOTD"]		= "服务器信息 & 规则 [MOTD]"

L["PHXM_TAB_HELP"]			= "帮助 & 指南"
L["PHXM_TAB_MUTE"]			= "玩家(取消)静音"
L["PHXM_TAB_PLAYER"]			= "玩家设置"
L["PHXM_TAB_MODEL"] 			= "玩家模型浏览器"
L["PHXM_TAB_MODEL_DISABLED"]	= "玩家模型浏览器 (已禁用)"
L["PHXM_TAB_ADMIN"]			= "管理员设置"
L["PHXM_TAB_ABOUT"]			= "关于物品猎杀 X"
L["PHXM_TAB_MAPVOTE"]		= "地图投票"

L["PHXM_CVAR_CHANGED"]		= "[设置] CVar %q 已更改为 %q"

--[[
	Player Mute Settings
]]
L["PHXM_MUTE_SELECT"]		= "选择你想要禁言的玩家."

--[[ 
	Player Settings
]]
L["PHXM_PLAYER_OPTIONS"]		= "玩家选项"
L["PHXM_PLAYER_LANG"]		= "语言"
L["PHXM_PLAYER_BIND"]		= "绑定"
L["PHXM_PLAYER_HUDSETTINGS"]	= "HUD设置"

L["PHXM_PLAYER_TAUNT_KEY"]			= "随机嘲讽按键"
L["PHXM_PLAYER_TAUNTWINDOW_KEY"]		= "嘲讽菜单按键"
L["PHXM_PLAYER_ROTATLOCK_KEY"]		= "旋转锁定按键"

L["PHXM_PLAYER_TOGGLE_HALOS"]		= "切换选择物品时的光晕效果"
L["PHXM_PLAYER_IDNAMES"]				= "显示队伍玩家名称(穿透墙壁可见)"
L["PHXM_PLAYER_ENDROUND_CUE"]		= "播放回合结束声音提示"
L["PHXM_PLAYER_TAUNTMENU_AUTOCLOSE"]	= "双击嘲讽视窗时自动关闭选项"
L["PHXM_PLAYER_SEE_HUNTER_LINE"]		= "在猎人身上画线，在旁观模式下可见猎人的目标"
L["PHXM_PLAYER_SEE_LBALL_ICONS"]		= "生成 '幸运球' 图标后将其显示"
L["PHXM_PLAYER_SEE_CRYSTAL_ICONS"]	= "生成 '恶魔球' 图标后将其显示"

L["PHXM_PLAYER_USE_NEW_HUD"]			= "使用新 PH: 增强 HUD"
L["PHXM_PLAYER_SHOW_TUTOR"]			= "显示教程弹出视窗 (在每个物品生成时只显示2次)"
L["PHXM_PLAYER_USE_NEW_CROSSHAIR"]	= "开启自定义准心"
L["PHXM_PLAYER_SHOW_TEAM_TOPBAR"]	= "左上角显示还活着的玩家栏(至少显示4位玩家)"

--[[
	Player model Browser Section
]]
L["QUERY_MODEL_SELECTED"]	= "将在重生后，变更已选择的模型 %s !"
L["QUERY_MODEL_INFO"]		= "模型名称: %s - 适用于: 每个人"

L["MDL_MENU_REFRESH"] 		= "刷新图标"
L["MDL_MENU_PREVIEW"] 		= "预览模型"
L["MDL_MENU_MODELINFO"] 		= "模组信息"


L["MISC_APPLYMDL"] 			= "应用模型"

L["PHXM_MODEL_DISABLED"] 	= "抱歉喽，本服务器已禁用自定义玩家模型"
L["PHXM_PLAYERMODEL_SETFOV"]	= "模型视距(FOV)"

--[[
	Server Settings
]]
L["PHXM_ADMIN_OPTIONS"]		= "服务端的游戏模式选项 (仅对管理员/所有人可见)"
L["PHXM_ADMIN_MUSTALIVE"]	= "你必须在活着的队伍中才能执行此操作"

--[[
	Language Override
]]
L["PHXM_ADMIN_LANGOVERRIDE"]	= "语言覆盖"

L["PHXM_ADMIN_FORCELANG"] 				= "使用强制语言? 这将会覆盖客户端语言，以使用服务器选择的语言."
L["PHXM_ADMIN_LANGTOUSE"]				= "强制语言使用"
L["PHXM_ADMIN_PLAYERDEFAULTLANG"] 		= "首次加入游玩时玩家的默认语言"

-- Gameplay settings
L["PHXM_ADMIN_CUSTOM_MODEL"]				= "开启自定义猎人模型"
L["PHXM_ADMIN_CUSTOM_MODEL_PROP"]		= "开启自定义物品模型 - 别忘了同时开启自定义猎人模型"
L["PHXM_ADMIN_TAUNT_DELAY_CUSTOM"]		= "自定义嘲讽"
L["PHXM_ADMIN_TAUNT_DELAY_RANDOM"]		= "一般嘲讽延迟(秒)"
L["PHXM_ADMIN_TAUNT_DELAY_AUTO"]			= "自动嘲讽延迟(秒)"
L["PHXM_ADMIN_AUTOTAUNT_ENABLE"]			= "开启自动嘲讽功能"

L["PHXM_ADMIN_NOTICE_ROTATION"]			= "在每个物品重生时显示'物品旋转'通知"
L["PHXM_ADMIN_CAMERA_COLLIDE"]			= "开启物品镜头的墙壁碰撞"
L["PHXM_ADMIN_FREEZECAM"]				= "开启物品队伍的死亡特写"
L["PHXM_ADMIN_PROP_COLLIDE"]				= "开启物品与其他物品玩家碰撞"
L["PHXM_ADMIN_SWAP_TEAM"] 				= "每轮交换队伍 - 禁用意味着队伍始终不交换"
L["PHXM_ADMIN_HUNTER_PENALTY"]			= "猎人生命惩罚"
L["PHXM_ADMIN_HUNTER_KILL_BONUS"]		= "猎人击杀红利"
L["PHXM_ADMIN_HUNTER_SMG_GRENADES"]		= "猎人冲锋枪榴弹"
L["PHXM_ADMIN_GAME_TIME"]				= "总游戏时间(分钟)"
L["PHXM_ADMIN_BLINDLOCK_TIME"]			= "猎人失明时间(秒)"
L["PHXM_ADMIN_ROUND_TIME"]				= "游戏回合时间(秒)"
L["PHXM_ADMIN_ROUNDS_PER_MAP"]			= "每张地图的总游戏回合数"
L["PHXM_ADMIN_ENABLE_LUCKYBALL"]			= "允许在易碎的物品上产生幸运球 (机率为8%)"
L["PHXM_ADMIN_ENABLE_CRYSTAL"]			= "允许猎人死亡时产生恶魔球 (机率为70%)"
L["PHXM_ADMIN_WAIT_PLAYERS"]				= "等待玩家开始游戏"
L["PHXM_ADMIN_WAIT_MIN_PLAYERS"]			= "游戏开始前等待的最少玩家数(默认:1)"
L["PHXM_ENABLE_PLAYER_JOIN_LEAVE"] 		= "要开启玩家加入或离开的聊天通知吗? 如果你希望使用自己的自订聊天插件，请设置为0."

L["PHXM_ADMIN_FORCEJOINBALANCE"]			= "强迫玩家加入后平衡队伍"
L["PHXM_ADMIN_ENABLETEAMBALANCE"]		= "在回合开始时自动平衡队伍(队伍平衡)"
L["PHXM_ADMIN_PICKUP_PROPS"] 			= "允许捡起小物品吗? 0:不允许; 1:仅猎人 2:仅物品 3:允许所有人"

L["PHXM_ADMIN_TAUNTMODES"]			= "嘲讽模式"
L["PHXM_ADMIN_TAUNTMODE_MODE"]		= "--[当前嘲讽模式为: %d ]--"
L["PHXM_ADMIN_TAUNTMODE0"]			= "模式 [0]: F3/随机嘲讽"
L["PHXM_ADMIN_TAUNTMODE1"]			= "模式 [1]: C/自订嘲讽"
L["PHXM_ADMIN_TAUNTMODE2"]			= "模式 [2]: 两者模式"
L["PHXM_ADMIN_TAUNTSOPEN"]			= "开启嘲讽视口"

L["PHXM_MODE_DEFAULT"] 				= "--[ 拾取模式设置为 %d ]--"
L["PHXM_MODE0"]						= "模式 [0]: 不允许"
L["PHXM_MODE1"]						= "模式 [1]: 仅猎人"
L["PHXM_MODE2"]						= "模式 [2]: 仅物品"
L["PHXM_MODE3"]						= "模式 [3]: 允许拾取"

--[[
	Admin Developer Sections
]]
L["PHXM_ADMIN_DEVSECTION"]		= "开发人员选项/实验功能"
L["PHXM_ADMIN_ROOMCHECK"]		= "开启边界检查? 能防止你卡在物体/墙上"
L["PHXM_ADMIN_USENEWMKBREN"]		= "布伦 MK II 奖励武器使用新模型(需要重启地图)"
L["PHXM_ADMIN_BEVERBOSE"]		= "开发人员: 详细 - 开启打印PH:X详细信息和事件吗?"
L["PHXM_ADMIN_SHOWPLNAMEHEAD"]	= "显示玩家队伍名称."
L["PHXM_ADMIN_USESINGLE_FZCAM"]	= "使用单个死亡特写的声音，而不是声音列表(使用'ph_fc_cue_path'来确认定格镜头的声音路径)"
L["PHXM_ADMIN_MODELLISTINGTYPE"] = "使用旧版模型清单: 0: 所有玩家模型, 1: 使用旧版: list.Get('PlayerOptionsModel')"
L["PHXM_ADMIN_JUMPPOWER"]		= "物品额外弹跳力倍数"
L["PHXM_ADMIN_ENABLE_OBB"]		= "开发人员: 从配置数据开启自订物品实体模型边界(OBB)编辑器"
L["PHXM_ADMIN_RELOAD_OBB"]		= "开发人员: 每次重新启动时刷新OBB编辑器数据"

--[[
	Experimental & PH:X Features
]]
L["PHXM_ADMIN_EXPERIMENTALPHX"]			= "新的 PHX 实验部分"

L["PHXM_ADMIN_HLA_COMBINE"]				= "新增支持半衰期: 爱莉克斯的联合军模型"
L["PHXM_ADMIN_TEAMBALANCE"]				= "开启队伍平衡功能"
L["PHXM_ADMIN_CHANGETEAM_LIMIT"]			= "使用队伍切换限制器. 设置-1为禁用"
L["PHXM_ADMIN_USENEWCHAT"]				= "使用新聊天框(eChat) - 这是临时替换. 如果你有新的聊天框,请取消选取."
L["PHXM_ADMIN_NEWCHATPOS"]				= "新聊天框位置: 将高度(Y)减去N个像素."
L["PHXM_ADMIN_RESPAWNONBLIND"]			= "允许失明时间重生"
L["PHXM_ADMIN_RESPAWNONBLIND_TEAM"]		= "允许特定队伍在失明时间内重生: 0:全部, 1:猎人, 2:物品"
L["PHXM_ADMIN_REWSPANTIMEPERCENT"]		= "允许你重生的失明时间百分比. 预设为0.75 (意味着75%最大失明时间)"
L["PHXM_ADMIN_ALLOWRESPAWN_SPECTATOR"]	= "分配旁观者时允许在失明时间重生"
L["PHXM_ADMIN_ALLOWRESPAWN_TEAMCHANGE"]	= "分配不同队伍时允许在失明时间重生(不建议开启此功能)"

--[[
	MapVote Settings
]]
L["PHXM_MV_SETTINGS"]			= "地图投票设置"

L["PHXM_MV_ALLOWCURMAP"]			= "允许投票目前地图"
L["PHXM_MV_COOLDOWN"]			= "开启地图投票冷却"
L["PHXM_MV_USE_ULX_VOTEMAPS"]	= "使用ULX地图投票的地图列表? 否则,使用默认 maps/*.bsp ."
L["PHXM_MV_MAPLIMIT"]			= "在地图投票中显示的地图数量"
L["PHXM_MV_TIMELIMIT"]			= "投票时作为默认的地图投票时间(秒)."
L["PHXM_MV_MAPBEFOREREVOTE"]		= "重新出现地图所需的地图更改数"
L["PHXM_MV_RTVCOUNT"]			= "需要多少人才能发起撼动投票(Rock the Vote)"

L["PHXM_MV_EXPLANATION1"]		= "要设置列出相对应的地图，请在控制台中使用(举例)[ mv_map_prefix 'phx_,ph_,cs_,de_' ]."
L["PHXM_MV_EXPLANATION2"]		= "如果你使用ULX，请使用map_vote. 若不是，请使用mv_start."
L["PHXM_MV_EXPLANATION3"]		= "地图投票操作(要取消，需在控制台中输入!unmap_vote(ULX)或mv_stop.)"

L["PHXM_MV_START"]		= "开始地图投票"
L["PHXM_MV_STOP"]		= "停止地图投票"
--                  			  ^YOU VIOLATED THE LAW!


--[[ 
	Versioning, Credits or About section
]]
L["PHXM_ABOUT_VERSIONING"]		= "版本: %s - 修订版: %s"
L["PHXM_ABOUT_AUTHOR"]			= "By: %s"
L["PHXM_ABOUT_ENJOYING"]			= "如果您喜欢此游戏，请考虑捐赠我们!"
L["PHXM_ABOUT_UPDATE"]			= "物品猎杀 X 更新"
-- [[ FIX ME ]] --
L["PHXM_VIEW_UPDATE_INFO"]		= "View update info"
L["PHXM_CHECK_FOR_UPDATES"]		= "Check for Updates"
L["PHXM_UPDATE_FOUND_TEXT"]		= "Update has been checked. Please check on the Console for more information.\n\nWould you like to view update what's new?"
L["PHXM_UPDATE_FOUND_TITLE"]   	= "Update Information"
L["PHXM_UPDATE_FOUND_BUTTON"]   	= "View Updates"
L["UPDATE_NOTIFY_MSG_NOTFOUND"]	= "No update was found. Please click on 'Check for Updates' button first!"
L["UPDATE_NOTIFY_MSG_TITLE"]		= "No updates found"
L["UPDATE_NOTIFY_WINDOW_TITLE"]	= "Update Notice"
L["UPDATE_RTBOX_APPEND"]			= "\n\nFor your information:\nCurrently you are using version: %s with Revision: %s"
L["UPDATE_BTN_SEEFULL"]			= "See Full Changes"
-- [[ FIX ME ]] --
L["PHXM_ABOUT_LINKS"]			= "链接和名单"
L["PHXM_ABOUT_THANKS"]			= "特别感谢支持、建议与贡献:\n %s"
L["PHXM_ABOUT_BTN_DONATE"]		= "捐款支持PH:X"
L["PHXM_ABOUT_BTN_HOME"]			= "PHX 主页"
L["PHXM_ABOUT_BTN_GITHUB"]		= "PHX GitHub 库"
L["PHXM_ABOUT_BTN_PLUGINS"]		= "PHX 扩展/插件"
L["PHXM_ABOUT_BTN_CHANGELOGS"]	= "PHX 更新日志"

--[[
	Late Additionals
]]
-- fretta
L["HUD_SPECTATING"]	= "正在旁观"
L["HUD_YOUDIED"]		= "你死了!"

L["CHAT_STARTING_MAPVOTE"] = "回合结束. 正在开始地图投票..."

-- This used for HUD Taunt Timer
L["HUD_PROP_TAUNT_TIME"]	= "随机嘲讽"
L["HUD_PROP_CTAUNT_TIME"] = "自定义嘲讽"

L["PHXM_TAB_PLUGINS"]				= "扩展/插件"

-- Plugins Section
L["PLUGINS_NO_PLUGINS"]				= "没有安装插件. 点击此处浏览更多插件!"
L["PLUGINS_BROWSE_MORE"]				= "浏览更多插件!"
L["PLUGINS_SERVER_HAS_NO_PLUGINS"]	= "抱歉,本服务器不支持自定义扩展/插件"
L["PLUGINS_SERVER_SETTINGS"]			= "-- 服务器设置 --"
L["PLUGINS_CLIENT_SETTINGS"]			= "-- 客户端设置 --"

-- Text Entries
L["TEXTENTRY_FZ_SINGLE"] = "死亡特写单个声音路径" -- this one is for ph_fc_cue_path command
L["TEXTENTRY_MV_PREFIX"] = "地图投票的地图前缀"			 -- the map previx for mv_map_prefix

--============= LATE ADDITION OF 29.10.21/X2Z. Please Improve your Language Here! =============--

L["MISC_GAME_ENDED"]		= "游戏已结束."

--============= LATE ADDITION OF 16.09.21/X2Z. =============--

--[[
	Credits: Late Addition: Revision: 16.09.21/X2Z
]]

L["PHXM_ABOUT_BTN_WIKI"]			= "PHX 维基 & 手册"

--[[
	Auto Taunt: Late Addition: Revision: 16.09.21/X2Z
]]

L["HUD_AUTOTAUNT_DISABLED"]		= 	"自动嘲讽已禁用."
L["HUD_AUTOTAUNT_WAITFORUPDATE"]	=	"正在同步自动嘲讽..."

--[[
	MapVote: Late Addition: Revision: 16.09.21/X2Z
]]
L["PHXM_MV_VOTEROCKED"]				= " 投票已撼动,本轮结束后将开始地图投票"
L["PHXM_MV_VOTEROCKED_IMMINENT"]		= "投票已撼动,即将开始地图投票"
L["PHXM_MV_VOTEROCKED_PLY_TOTAL"]	= "%s 支持撼动投票. ( %d / %d )"

L["PHXM_MV_MUST_WAIT"]				= "你必须在投票前等待一段时间!"
L["PHXM_MV_VOTEINPROG"]				= "目前正在进行一项投票!"
L["PHXM_MV_HAS_VOTED"]				= "你已支持撼动投票!"
L["PHXM_MV_ALR_IN_VOTE"]				= "已经通过一项投票,即将更换地图!"
L["PHXM_MV_NEED_MORE_PLY"]			= "你需要更多的玩家来发起撼动投票!"

--[[
	Late Addition: Revision: 16.09.21/X2Z
]]
L["PROP_PLAYERMDL_BANNED"]	= "你的自定义物品玩家模型被该服务器封禁."

--[[
	Prop Menu/Prop Chooser, Revision: 16.09.21/X2Z
]]

L["PCR_USAGE_UNLIMIT"]		= "[物品菜单] 你还有 **无限次** 使用权!"
L["PCR_USAGE_COUNT"]			= "[物品菜单] 你还有 %d 次使用权!"
L["PCR_PLS_WAIT"]			= "[物品菜单] 请等待 %d 秒."
L["PCR_NOROOM"]				= "[物品菜单] 没有足够的空间变形该物品!"
L["PCR_PROPBANNED"]			= "[物品菜单] 该物品已被服务器封禁."
L["PCR_PROPBANNED_BYPCR"]	= "[物品菜单] 你不能使用该物品因为其被物品菜单禁用."
L["PCR_REACHED_LIMIT"]		= "[物品菜单] 你已达到限制!"
L["PCR_STAY_ON_GROUND"]		= "[物品菜单] 你需要站在地上且不能蹲下!"
L["PCR_ONLY_GROUP"]			= "[物品菜单] 只有特定组别可以打开这个菜单!"
L["PCR_NOT_EXIST_COUNT"]		= "你选择的那个物品不存在于这张地图中! ( %s / 4 )"
L["PCR_NOT_EXIST"]			= "你选择的那个物品不存在于这张地图中!"

-- PCR Client section, reason why there is a space because of chat.AddText between args.
L["PCR_NOTIFY_1"]			= " 本服务器使用物品菜单版本 %s! 类型 "
L["PCR_NOTIFY_2"]			= " 在命令行或使用 F1 -> [物品选择帮助] 菜单."
L["PCR_CL_DISABLED"]			= " 该功能已禁用."
L["PCR_CL_GROUP"]			= " 只有特定组别可以打开这个菜单!"
L["PCR_CL_LIMIT"]			= " 你已达到限制!"
L["PCR_UNLIMIT_TEXT"]		= "无限"
L["PCR_WINDOW_TITLE"]		= "PHX 物品菜单"
L["PCR_HEADER_TOP"]			= "选择你想要的物品."
L["PCR_HEADER_MID"]			= "你还有 %s 次"
L["PCR_HEADER_BOTTOM"]		= "物品选择使用权!"
L["PCR_CL_TOOLTIP_BANNED"]	= "你不能使用这个模型."
L["PCR_CL_TOOLTIP_MODEL"]	= "模型: %s"
L["PCR_CL_MENU_NOTREADY"]	= " 该功能当前不可用."
L["PCR_WINDOW_GUIDE_TTL"]	= "快速指南: 物品菜单 101"
L["PCR_BTN_HELP_MENU"]		= "物品菜单帮助"

L["PCR_CL_CMDUSEULX"]		= " 该指令已禁用. 请使用 'ulx propmenu'!"
L["PCR_CMD_ULX_DISABLED"]	= "指令 ulx propmenu 已禁用. 按下 [物品菜单键] 来开启."	--input.GetKeyName is impossible to access.

L["PCR_EDT_IN_USE"]			= "一名管理员仍在编辑物品数据. 请稍候!"
L["PCR_EDT_ERROR_DISABLED"]	= "[物品菜单] 错误: 自定义物品添加已被禁用!"
L["PCR_EDT_NO_RIGHTS"]		= "你无权访问该功能."

-- I'm actually exhausted and feel so burned out, but I'll update this in future, or in PH:Zero I guess.
-- Section: Custom Prop Editor File Browser and stuff...
-- L["PCR_EDT_XXX"] 	= "todo"
-- L["PCR_FB_XXX"] 	= "todo"

--[[
	Admin Section, Revision: 16.09.21/X2Z
]]
L["PHXM_PLAYER_PROP_CHOOSER_KEY"]	= "打开物品菜单 (物品选择器) 的默认键."
L["PHXM_PROP_FREEZE_MIDAIR"]			= "作为物品在空中静止的默认键."
L["PHXM_ADMIN_PROP_RIGHT_CLICK"]		= "作为物品时是否能用右键嘲讽?"
L["PHXM_ADMIN_TAUNT_SCANNER"]		= "(需要重启地图) 启用嘲讽扫描器?"
L["PHXM_ADMLBL_USABLE_ENTS"]			= "可用的物品实体类型"
L["PHXM_ADMLBL_USABLE_ENTS_REF"]		= "类型可以为: 1: 仅物理, 2: 物理 & 动态, 3: 几乎所有包括布娃娃, 4: 自定义实体."
L["PHXM_ADMIN_USABLE_ENT_TYPE"]		= "用于复制的物品实体类型"
L["PHXM_ADMIN_NOTIFY_ENT_TYPE"]		= "按 E 时告知物品玩家无法复制的实体. 仅档'ph_usable_prop_type' 设置为 3 或 4 时有效."
L["NOTIFY_PROP_ENTTYPE"]				= "按 [E] 来互动, [左键] 来复制目标."
L["NOTIFY_CUST_ENT_TYPE_IS_ON"]		= "[PHX] 通知: 按 [E] 来互动目标, [左键] 来复制目标.."

--[[
	Custom Taunts, Revision: 16.09.21/X2Z
]]
L["TM_TAUNTS_SEARCH_NOTHING"]		= "未找到包含 '%s' 的嘲讽..."
L["TM_SEARCH_PLACEHOLDER"]			= "在该类别种查找: 输入名字, 小写且无通配符. 留空=展示所有."

--[[
	Freeze Cam, Revision: 23.09.21/X2Z
]]
L["PHXM_ADMIN_FREEZECAM_HUNTER"]			= "开启猎人队伍的死亡特写"


--============= LATE ADDITION OF 10.06.2022/X2Z. =============--

L["PHXM_MSG_INPUT_IS_EMPTY"]			= "文本为空或你没有按回车键."
L["MISC_SET"]						= "设置"
L["MISC_APPLY"]						= "应用"
L["MISC_NO"]							= "否"
L["MISC_YES"]						= "是"
L["MISC_WARN"]						= "警告"
L["MISC_ERROR"]						= "错误"
L["MISC_INFO"]						= "信息"
L["MISC_NOTICE"]						= "通知"
L["MISC_IDK"]						= "未知"
L["MISC_NA"]							= "N/A"

-- HUD
L["HUD_DECOY_ACTIVE"]                = "按 [%s]"
L["HUD_FAKETAUNT_COUNT"]             = "剩余 %ix"
L["HUD_FAKETAUNT_UNLI"]              = "无限"
L["NOTICE_GRENADE_SMG_GIVEN"]        = "你现在获得了一些 SMG 手雷."

--[[
	ADMIN PANEL, Revision 10.06/2022/X2Z
]]--
L["PHXM_TAUNT_SETTINGS"]				= "嘲讽设置"
L["PHXM_GENERAL_SETTINGS"]			= "常规设置"
L["PHXM_FAKE_TAUNT_SETTINGS"]		= "假嘲讽设置"
L["PHXM_FAKE_TAUNT_ENABLE"]			= "允许地图上的随机物品进行假嘲讽. 只能通过自定义嘲讽菜单使用."
L["PHXM_FAKE_TAUNT_MAXUSAGE"]		= "假嘲讽的最多使用次数; -1 为无限制."
L["PHXM_TAUNT_RIGHT_CLICK"]		    = "右键嘲讽. 这会禁用右键自定义菜单!"

L["PHXM_TAUNT_PITCH_SETTINGS"]		= "嘲讽音调设置"
L["PHXM_TAUNT_PITCH_ENABLE"]			= "启用嘲讽音调"
L["PHXM_TAUNT_PITCH_RANGE_MIN"]		= "嘲讽音调的最低阈值. 1 到 99."
L["PHXM_TAUNT_PITCH_RANGE_MAX"]		= "嘲讽音调的最高阈值. 100 到 255."

L["PHXM_DECOY_SETTINGS"]				= "诱饵设置"
L["PHXM_DECOY_ENABLE"]				= "启用诱饵奖励? 对活到回合结束的物品仅奖励一次. 一旦放置就不会增加只会减少."

L["PHXM_DISABLE_FOOTSTEP"]           = "切换静音物品组的脚步声"

L["PHXM_ADMIN_CHATSETTING"]			= "聊天窗口设置"
L["PHXM_ADMIN_HUNTERBLIND"]			= "猎人失明控制"

L["PHXM_ADMIN_GIVEGRENADE_NEAREND"]  = "是否在回合结束前提供手雷? 若是, 请查看 'ph_give_grenade_roundend_before_time'"
L["PHXM_ADMIN_GIVEGRENADE_TIME"]     = "回合结束前提供手雷的秒数. 通常设置为 10 到 30 秒"

--[[
	Plugins in sh_init.lua, Revision 10.06/2022/X2Z
]]--
L["PLUG_NAME_VER"]					= "插件: %s | v.%s"
L["PLUG_DESCRIPTION"]				= "描述: %s"

--[[
	Taunt Pitch, Revision 10.06/2022/X2Z
]]--
L["PHX_CTAUNT_USE_PITCH"]			= "对自定义嘲讽使用音调"
L["PHX_CTAUNT_RANDOM_PITCH"]			= "使用嘲讽时随机音调"
L["PHX_RTAUNT_USE_PITCH"]			= "对随机嘲讽使用音调 [%s]"
L["PHX_RTAUNT_RANDOMIZE"]			= "使用随机嘲讽时随机音调 [%s]"
L["PHX_CTAUNT_PITCH_FOR_FAKE"]		= "对假嘲讽使用音调"
L["PHX_CTAUNT_RANDPITCH_FOR_FAKE"]	= "使用假嘲讽时随机音调"
L["PHX_CTAUNT_SLIDER_PITCH"]			= "嘲讽音调滑块."
L["TM_TOOLTIP_FAKETAUNT"]			= "在随机物品上播放假嘲讽"
L["TM_PREFERRED_PITCH"]              = "偏好的嘲讽音调"

--[[
	Fake Taunt, Revision 10.06/2022/X2Z
	Description: Play fake taunts on random props in the map (Not Players)
]]--
L["PHX_CTAUNT_ON_RAND_PROPS"]		= "在随机物品上播放 (%ix)"
L["PHX_CTAUNT_ON_RAND_PROPS_UNLI"]	= "在随机物品上播放"
L["PHX_CTAUNT_PLAYED_ON_RANDPROP"]	= "你在随机物品上播放了一个嘲讽."
L["PHX_CTAUNT_RAND_PROPS_LIMIT"]		= "你已达到使用上限!"
L["PHX_CTAUNT_RAND_PROPS_NOT_PROP"]  = "当前不可用."
L["PHX_CTAUNT_RANDPROP_DISABLED"]	= "假嘲讽目前已被禁用."

--[[
	PH:Z Simple Decoy, Revision 10.06/2022/X2Z
]]--
L.DECOY_PROP	= {
	"击杀了假人!",
	"后悔击杀了假人.",
	"击杀了诱饵.",
	"击杀了一个无辜假人.",
	"尴尬于击杀了一个假人."
}

L["DECOY_PUT_SUCC"]					= "诱饵已放置."
L["DECOY_CANT_PUT_HERE"]				= "不能把诱饵放在这里."
L["DECOY_GET_REWARD"]				= "恭喜! 你获得了 ['物品诱饵'] 来活过本轮!"
L["DECOY_REMINDER_GET"]              = "你有一个诱饵/假人物品! 放在某处来迷惑猎人吧!"
L["DECOY_FRAGS_RECEIVED"]			= "上钩了: 你从 %s 窃取了一分!"
L["DECOY_DISABLED"]					= "诱饵当前不可用."
L["PHXM_CL_DECOY_KEYBIND"]			= "放置诱饵的默认键. 默认为 1 (不是小键盘 1)."

L["DECOY_INDICATOR_INVALID"]         = "坡度太陡!"
L["DECOY_INDICATOR_TOOFAR"]          = "距离太远!"
L["DECOY_INDICATOR_OK"]              = "放置诱饵 [按 %s]"

L["PHXM_DECOY_HEALTH"]				= "诱饵的血量. 默认为 10."
L["PHXM_PLAYER_SHOW_DECOY_HELPER"]   = "是否展示诱饵摆放助手? 这会在你的准星旁边展示一个带文字的白点."
L["PHXM_PLAYER_SHOW_DECOY_MARKER"]   = "是否展示诱饵标记?"

--[[
	Revision 10.06/2022/X2Z
    Prop Menu Update: Menu, Editor, Browser
]]--
L["PCR_MODEL_DONT_EXISTS"]   = "对不起, 该模型当前不可用!"

L["PCR_PLUG_WARN_MSG"]		= "警告: 自定义物品添加 (pcr_allow_custom) 设置为 0.\n必须启用此功能才能编辑你的自定义物品!\n更改此设置需要更改地图."
L["PCR_PLUG_LBL_BINDKEY"]	= "改变绑定的按键, 切换至 '[玩家] 标签页."
L["PCR_PLUG_LBL_EDITOR"]		= "自定义物品菜单编辑器"
L["PCR_PLUG_BTN_OPEN_EDT"]	= "打开编辑器"
L["PCR_PLUG_LBL_COMSET"]		= "常见设置"
L["PCR_PLUG_LBL_TECHSET"]	= "技术设置"
L["PCR_PLUG_LBL_EXPSET"]		= "实验性"
L["PCR_PLUG_LBL_PLAYERSET"]	= "玩家设置"

L["PCR_PLUG_ENABLE"]			= "启用 '物品菜单' 功能"
L["PCR_PLUG_ALLOW_CUSTOM"]	= "(需要重启地图) 允许在物品菜单列表中添加自定义物品?"
L["PCR_PLUG_PROP_BAN"]		= "(需要重启地图) 不将被封禁的物品纳入物品菜单列表中?"
L["PCR_PLUG_USAGE_LIMIT"]	= "玩家使用的最大使用限制. -1 代表无限制."
L["PCR_PLUG_PROP_LIMIT"]		= "(需要重启地图) 限制物品菜单列表中增加的物品数量"
L["PCR_PLUG_PROP_LIMITMAX"]	= "可添加到物品菜单列表中的最大数量. 注意: 该数值会随机增加!"
L["PCR_PLUG_USE_ULXMENU"]	= "物品菜单可否通过控制台 (0) 或 ULX (1) 打开? 绑定的按键将遵从此设置"
L["PCR_PLUG_USE_DELAY"]		= "玩家在物品菜单中使用另一个物品前的延迟秒数"
L["PCR_PLUG_KICK_INVALID"]	= "踢掉任何试图访问无效模型的用户 (4x 最大阈值)"
L["PCR_PLUG_SPACE_CHECK"]	= "在玩家使用另一个物品之前，检查房间的空间，以防卡住"
L["PCR_PLUG_X_BBOX"]			= "(需要重启地图) 在添加到物品菜单列表前检查实体的 BBox 限制"
L["PCR_PLUG_X_BBOX_MAX"]		= "BBox 碰撞的最大高度限制. 最小值将自动计算."
L["PCR_PLUG_X_BBOX_MIN"]		= "BBox 碰撞的最大宽度限制. 最小值将自动计算."
L["PCR_PLUG_ONLY_GROUPS"]	= "物品菜单是否只能由某些组别访问例如捐助者?"
L["PCR_PLUG_NOTIFYMSG"]		= "在每轮开始时通知玩家如何使用物品菜单"

L["PCR_EDITOR_MSG_ERROR"]	= "你的更改由于错误而未被保存.\n请检查你的服务器控制台!"
L["PCR_EDITOR_MSG_SUCC"]		= "您的更改和自定义物品数据已成功保存和更新."

L["PHZ_generic_title"]		= "自定义物品收录编辑"
L["PHZ_generic_helptext"]	= [[[使用方法:
[左侧面板]
← 选择一个游戏内容
← 点击图标，将模型添加到右侧
← 右击打开上下文菜单

[右侧面板]
→ 点击 '标记' 想要删除的物品
→ 点击 '移除选中' 来删除模型
→ 点击 '应用筛选' 来完成改动

[信息]
- 你至多能添加 2048 个模型.
- 所有的地图物品将被自动包括在内，所以你不必添加.
- 点击 [关闭] 按钮将取消操作.
- 并非所有模型都有有效的 VPhysics.
- 不是所有的玩家 (包括你的服务器) 都有自定义模型. 若不存在模型，则其将在应用筛选后被删除.
- 你的服务器内容可能与你不同. 如果你在下拉菜单中看到 "<game> [Not Mounted]", 这意味着你还没有安装/调试好游戏.
- Addon 文件夹浏览尚未实现，所以你必须使用 '所有内容' 来代替.
]]
L["PHZ_generic_mdlinfo"] = [[模型信息:
%s
是否有物理: %s]]
L["PHZ_generic_mdlinfoStart"] = "(先选择模型!)"

L["PHZ_generic_no_ragdoll"]	= "否: 布娃娃"
L["PHZ_generic_titlelabel"]	= "%s 预览 :"

L["PHZ_mount_game_sel"]		= "选择安装的游戏 (默认: Garry's Mod)"
L["PHZ_input_placeholder1"]	= "查找的文件夹: <文件夹名> or '*', 留空表示所有文件夹."
L["PHZ_input_placeholder2"]  = "搜索的扩展: <名字> or '*', 留空表示所有文件夹."
L["PHZ_msg_warn_close"]		= "你确定要关闭此窗口吗? 任何未保存的编辑都将丢失!"
L["PHZ_msg_commit"] 			= "你确定要提交修改吗?"
L["PHZ_msg_cant_empty"]		= "物品列表不能为空!"
L["PHZ_msg_removesel"] 		= [[移除列表中的选定物品. 图例:
红色 = 标记为选中
黄色: 不存在于服务器且应被删除的物品.]]
L["PHZ_msg_warn_mdlinlist"]  = "警告: 该模型已经在列表中!"
L["PHZ_msg_invalid_mdl"] 	= "原因: 这是个无效模型"
L["PHZ_apply_select"] 		= "应用 & 保存筛选"
L["PHZ_menu_copy"] 		= "复制模型"
L["PHZ_menu_refresh"] 	= "刷新模型"
L["PHZ_tooltip_removesel"]	= "删除选中"
L["PHZ_tooltip_wasmarked"] = [[该物品被标记是因为它不存在于服务器中.
如果你关闭编辑器，它将被自动删除.]]

L["PHZ_pcr_fb_allcontent"] = "所有内容 (不是所有的玩家/服务器都有与你相同的内容)"
L["PHZ_pcr_fb_notmounted"] = "%s [未安装]"

-- Revision 25-27/08/2022
L["PHX_ADMIN_ACCESS_ONLY"]		= "Access Denied: only Admins can do that, %s !"
L["PHX_PROP_TOO_THIN"]           = "Cannot Replicate: Prop is too thin!"
L["PHX_PROP_IS_BANNED"]			= "The prop you're trying to use is banned from server!"
L["PHX_SPECT_JOINGAME"]			= "To join the game, Press [F2] then select a team to join."
L["PHX_TEAM_IS_FULL"]			= "That team is full!"
L["FORCE_JOIN_TEAM_IS_DISABLED"]	= "Even-out Team Balance is disabled (Team Shuffle/Rotation is Enabled)"

L["PHX_TM_MNBAR_OPTIONS"]		= "Options"
L["PHX_TM_MNBAR_SAVEFAV"]		= "Save Favorites"
L["PHX_TM_MNBAR_LOADFAV"]		= "Reload Favorites"
L["PHX_TM_MNBAR_SETTINGS"]		= "Others"
L["PHX_TM_MNBAR_RESET"]			= "Reset Favorites"

L["PHX_TM_WARN_CLEARFAV"]		= "WARNING: This will CLEAR ALL your previously saved Favorite Taunts. Are you sure you want to continue?"

L["PHXM_BANNED_MODELS"]			= "Dis/Allow the use of Restricted Models (Banned Models). This does not include from Prohibitted Models (They're always deleted)."
L["PHXM_ADMIN_ALLOWARMOR"]       = "Allow Armor Addition for team Hunters and Props"
L["PHXM_ADMIN_ALLOW3P"]          = "Allow thirdperson mode for Hunters"
L["PHXM_ADMIN_ALLOW3P_SVDESIRED"]= "Allow thirdperson mode to use Server's Desired Camera position (Disallow player custom position)"
L["PHXM_ADMIN_ALLOW3P_DIST"]     = "Thirdperson: Desired Camera Distance"
L["PHXM_ADMIN_ALLOW3P_RIGHT"]    = "Thirdperson: Desired Camera Right Position"
L["PHXM_ADMIN_ALLOW3P_UP"]     	= "Thirdperson: Desired Camera Up Position"
L["PHXM_ADMIN_JUMPPOWER_H"]		= "Additional Jump Power multiplier for Hunters"
L["PHXM_ADMIN_MDLCOLOR_PROP"]	= "Enable Player Color for team Props (Require Hunter Custom Models to be enabled)"
L["PHXM_ADMIN_MDLCOLOR_HUNTER"]	= "Enable Player Color for team Hunters (Require Hunter Custom Models to be enabled)"
L["PHXM_ADMIN_PITCH_ROTATION"]	= "[Experimental] Allow to use pitch rotation for props. This may be buggy."
L["PHXM_ADMIN_FALLDMG"]			= "Enable Fall Damage (Applies on All Teams)"
L["PHXM_ADMIN_FALLDMG_REAL"]		= "Enable 'Realistic' Fall Damage"
L["PHXM_INFORM_TO_JOIN"]			= "Inform Unassigned/Spectators with static text advice to join the game."
L["PHXM_ADMIN_PROPOFFSET"]		= "Substract/Add Prop View Offset Height using multiplier. Min: 0.6, Max: 1.2. Default: 0.8."
L["PHXM_ADMIN_REPL_MUST_STAND"]	= "[Experimental] Restrict props replication only when they're standing. Disable this to allow replicating when ducking or jumping."

L["PHXM_DROP_VBS_DISABLE"]       = "Disable Verbose"
L["PHXM_DROP_VBS_ENABLE"]        = "Enable Verbose"
L["PHXM_DROP_MDL_INCLUDEALL"]    = "Include Everything ( %d )"
L["PHXM_DROP_MDL_CUSTOMLIST"]    = "Seperate/Custom List ( %d )"
L["PHXM_DROP_MDLTYPE_PROP"]      = "Physics Only ( %d )"
L["PHXM_DROP_MDLTYPE_PROPDYN"]   = "Physics & Dynamic Props ( %d )"
L["PHXM_DROP_MDLTYPE_ANYENTS"]   = "Any Compatible Entities ( %d )"
L["PHXM_DROP_MDLTYPE_CUSTOM"]    = "Custom Entities ( %d )"
L["PHXM_DROP_RESPAWNBLIND_BOTH"] = "Both Teams"

L["PHXM_TAB_ADMINGROUPS"]        = "Group & Access Option"
L["PHXM_TAB_PHEPLUS"]			= "Enhanced Plus Settings"

L["PHXM_ADMIN_ACCESS_GROUP"]     = "Select groups to allow access PH:X Admin Settings, Enhanced Plus & Plugin Settings page."
L["PHXM_ADMIN_ACCESS_GROUP_HINT"] = "Please note that \"superadmins\" cannot be revoked."
L["PHXM_ADMIN_ACCESS_GROUP_NOULX"] = "Error: ULib & ULX is not installed on your server."
L["PHXM_ADMIN_ACCESS_NOREVOKE"]  = " (Cannot be revoked)"
L["PHXM_ADMIN_GROUP_WHOCANACC"]	= "Select groups to allow access [Admin Settings]."
L["PHXM_ADMIN_GROUP_MUTEABLE"]	= "Select groups to disallow Voice Mute in [Player Muting]. (User is always mute-able)."

L["PHXM_ADMIN_ACCESS_CHATINFO"]  = "There was a configuration update for Prop Hunt Menu window. Reopening..."
L["PHXM_ADMIN_ACCMSG_BODY"]      = "Do you want to save selection and proceed the changes?\nPlease note that any previous groups you revoked will no longer have the access.\nThis will restart the Prop Hunt Menu if they're still opened."
L["PHXM_ADMIN_ACCMSG_TITLE"]     = "Apply Group Access"
L["PHXM_ADMIN_ACCCFG_SUCC"]      = "Group Access data successfully saved."
L["PHXM_ADMIN_ACCCFG_FAIL"]      = "There was an error saving Group Access data. Check your server console!"
L["PHXM_ADMIN_MUTCFG_SUCC"]      = "Mutedable Group Access data successfully saved."
L["PHXM_ADMIN_MUTCFG_FAIL"]      = "There was an error saving Muteable Group data. Check your server console!"

L["PHXM_ADMIN_ACCESS_APPLY"]     = "Apply Selected Groups"

-- PHE/Plus
L["PHXM_ADMIN_PLUSSETTING"]		= "Plus+ Settings"
L["PHXM_PLUSSETTING_HINT"]		= "Configure Team Balance or any other additional settings."
L["PHXM_HEADER_UNSTUCK"]			= "Unstuck Settings"
L["PHXM_HEADER_TEAMSETTING"]		= "More Team Options & Settings"

L["LIST_PLAYER"]					= "Players"
L["LIST_FORCEDASPROP"]			= "Forced As Prop?"
L["LIST_MARKEDASPROP"]			= "Marked to be forced as Prop"
L["LIST_NOHUNTERS"]				= "No Hunters are currently playing."

L["PHXM_PLUS_MSG_NO_HUNTERS"]	= "There are no hunters to reset."

L["PHXM_PLUS_BTNRESET"]			= "Clear Selections (and Reset All Forced)"
L["PHXM_PLUS_LISTTIPS"]			= "Tips: Double Click to toggle Force Player as Prop."

L["PHXM_ADMIN_ENABLEUNSTUCK"]		= "Toggle Enable/Disable Built-in unstuck feature. If you use an addon, disable this."
L["PHXM_ADMIN_NOTPUNSTUCKINROUND"]	= "Disable last-resort unstuck teleportations to spawnpoints outside of the hiding phase" --ph_disabletpunstuckinround
L["PHXM_ADMIN_UNSTUCK_WAITTIME"]		= "How much seconds must pass between each unstuck attempt" --ph_unstuck_waittime
L["PHXM_ADMIN_TEAMBAL_ORIG"] 		= "Use PH:X's original auto-balancing (disables all following team-related options below)" --ph_originalteambalance
L["PHXM_ADMIN_FORCESPECTOPLAY"]		= "Force spectators to play by including them when balancing teams" --ph_forcespectatorstoplay
L["PHXM_ADMIN_NO_H_CONSECUTIVE"]		= "Prevent players from being a Hunter twice in a row (only works in shuffle mode)" --ph_preventconsecutivehunting
L["PHXM_ADMIN_HUNTER_COUNT"] 		= "Hunter count (0 = automatic)" --ph_huntercount
L["PHXM_ADMIN_ROTATETEAM"] 			= "Disable shuffle mode and rotate players instead" --ph_rotateteams
L["PHXM_ADMIN_RESET_ROTTEAM"] 		= "Reset rotations" --ResetRotateTeams
L["PHXM_ADMIN_RESET_ROTTEAM_WARN"]	= "Restart rotations from the beginning (in case you've started them, stopped, then started again and the current rotation does not satisfy you):" --ResetRotateTeams_warning
L["PHXM_ADMIN_RESET_MSG"]			= "Rotation Team has been Reset!"
L["PHXM_ADMIN_FORCEH2P_WARN"]		= "Force a Hunter to be a Prop next time (only works in shuffle mode):" --ForceHunterAsProp_warning
L["PHXM_ADMIN_FORCEH2P_RANDONLY"]	= "This action is only available in shuffle mode." --ForceHunterAsProp_randomonly

L["FORCEH2P_WILL_BE"]				= "%s will be a Prop next round."
L["FORCEH2P_IS_CANCELED"]			= "%s won't be a Prop next round."
L["FORCEH2P_IS_RESET"]				= "All Hunters won't be Forced as a Prop next round."
L["FORCEH2P_PLAYER_NOT_FOUND"]		= "Selected player was not found, probably they were disconnected."
L["PHX_ROTATE_TEAM_RESET"]			= "Rotation Team Offset has been reset."

L["UNSTUCK_YOURE_UNSTUCK"]			= "You should be unstuck!"
L["UNSTUCK_BAD_SPAWNPOINT"]			= "Error: The closest spawnpoint might get you stuck again. If it does, try to unstuck again."
L["UNSTUCK_RESCUE_SPAWNPOINT"]		= "This spawnpoint is extremely close, so you might still be stuck. Try unstucking again if you are."
L["UNSTUCK_NO_SPAWNPOINTS"]			= "For unknown reasons, no spawnpoint could be found. As a backup strategy, you will be teleported to (0, 0, 0). There is a very high chance that you will be stuck, so if you are please try unstucking again."
L["UNSTUCK_PLEASE_WAIT"]				= "Please wait %d seconds between each unstuck attempt."
L["UNSTUCK_NOT_ON_GROUND"] 			= "Not on ground, checking..."
L["UNSTUCK_NOT_STUCK_JITTER"]		= "You're not stuck. If you really are, wait until your prop no longer moves/jitters (try pressing ALT) then try again."
L["UNSTUCK_NOT_STUCK_TOOBAD"]		= "You're not stuck. If you really are, sorry, you'll have to wait until the end of the round."
L["UNSTUCK_CANNOT_FIND_SPOT"]		= "Cannot find a place to move you to, teleporting to closest spawnpoint."
L["UNSTUCK_SPAWNPOINTS_DISABLED"]	= "You were going to be teleported to a close spawnpoint, but this server disallows it outside of the hiding/hunter blind period. Sorry!"
-- End of PHE/Plus

L["MISC_SEL_APPLY"]  = "Apply Selections"
L["MISC_RESET_SEL"]  = "Reset Selections"
L["MISC_RESET"]      = "Reset"
L["MISC_CANCEL"]     = "Cancel"
L["MISC_SEL_ALL"]    = "Select All"
L["MISC_SEL_NONE"]   = "Select None"

L["PHXM_CL_THIRDPERSON"]     = "Key for Toggling thirdperson mode"
L["PHXM_CL_UNSTUCK"]			= "Key for Unstuck"
L["CL_THIRDPERSON_ENABLED"]  = "Thirdperson Enabled"
L["CL_THIRDPERSON_DISABLED"] = "Thirdperson Disabled"

L["PHX_TP_ADJUSTVIEW_BTN"]	= "Adjust Thirdperson View" --Button, as well as window title.
L["PHX_TPS_ADJ_TITLE"]		= "Thirdperson Warning"
L["PHX_TPS_ADJ_SVDESIRED"]	= "Thirdperson Customization disabled: Using Server's desired position."
L["PHX_TPS_ADJ_3PDIS"]		= "Thirdperson mode is disabled."
L["PHX_TPS_ADJ_BLIND"]		= "You're blinded. Try again later."
L["PHX_TPS_ADJ_NEEDALIVE"]	= "You need to be on Alive Hunter Team to do this."

L["ANG_AXIS_DIST"]	= "Distance" -- or Forward
L["ANG_AXIS_RIGHT"]	= "Right"
L["ANG_AXIS_UP"]		= "Up"
L["VEC_POS_LEFT"]	= "Left" --X
L["VEC_POS_FRONT"]	= "Front" --Y?
L["VEC_POS_TOP"]		= "Top"  --Z

-- Key Hints
L["KEYHINT_HUNTER3P"] 	= "Hunter Thirdperson"
L["KEYHINT_SHOOT"]		= "Fire Weapon"
L["KEYHINT_SEC"]			= "Fire Secondary"
L["KEYHINT_PICKUP"]		= "Pickup Object/Interact"

L["KEYHINT_LMB"]			= "Replicate Prop"
L["KEYHINT_RMB"]			= "Prop Taunt/Special Ability"
L["KEYHINT_RANDTAUNT"] 	= "Random Taunt"
L["KEYHINT_TAUNTMENU"] 	= "Toggle Taunt Menu"
L["KEYHINT_ROTATION"] 	= "Toggle Rotation Lock"
L["KEYHINT_PROPMENU"] 	= "Toggle Prop Menu"
L["KEYHINT_FREEZEAIR"] 	= "Toggle Prop Freeze"
L["KEYHINT_SPAWNDECOY"] 	= "Spawn Decoy"
L["KEYHINT_UNSTUCK"]		= "Unstuck Key"

L["KEY_LMB"]				= "LMB" -- Left Mouse Button, Short version
L["KEY_RMB"]				= "RMB" -- Right Mouse Button, Short version

L["MISC_TEAM_NAME"]		= "TEAM: %s" -- TEAM PROPS, TEAM HUNTERS, but in 1 sentence.
L["NOTIFY_HEADER_TITLE"]	= "Game Controls"

-- Revision 14/09/2022
L["PHXM_MV_CHANGEMAP_NOPLAYER"]	= "Force change the map after there are no players in the server?"

L["KEY_MIDCLICK"]		= "MMB"

L["LD_MIDCLICK"]			= "MIDDLE CLICK"
L["LD_RIGHTCLICK"]		= "RIGHT CLICK"
L["LD_PRESS2SHOOT"]		= "Press [%s] to shoot %s!"

PHX.LANGUAGES[L.code] = L