-- phx's global cvar constants
CVAR_SERVER_ONLY			= FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY	-- Apprently, this two may looks better.
CVAR_SERVER_ONLY_NO_NOTIFY 	= FCVAR_REPLICATED + FCVAR_ARCHIVE
CVAR_SERVER_HIDDEN 			= { 0x10, FCVAR_DONTRECORD } --,FCVAR_UNREGISTERED ?

-- global constant type
CTYPE_STRING	= 1
CTYPE_NUMBER	= 2
CTYPE_BOOL		= 3
CTYPE_FLOAT		= 4

local ConVarTranslate = {
	[CTYPE_STRING] = {
		Set = function(name, value, fcvar, help, data)
			CreateConVar(name, tostring(value), fcvar, help) -- for string, they don't have min and max convar limit, so we'll use 'function' as our advantage.
			SetGlobalString(name, tostring(value))
			
			if (data and data ~= nil) then
				if type(data) == "function" then data( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalString(name, tostring(new)) end, "phx.cvstr_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalString(name, value) --default: 'error'.
		end
	},
	[CTYPE_BOOL] = {
		Set = function(name, value, fcvar, help, data)
			CreateConVar(name, value, fcvar, help, 0, 1) -- Forcing boolean's min max convar limit to "always 0 and 1".
			SetGlobalBool(name, tobool(value))
			
			if (data and data ~= nil) then
				if type(data) == "function" then data( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalBool(name, tobool(new)) end, "phx.cvbool_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalBool(name, tobool(value))
		end
	},
	[CTYPE_NUMBER] = {
		Set = function(name, value, fcvar, help, data, f)
			if (data and data ~= nil) then
				if type(data) == "table" then  CreateConVar(name, value, fcvar, help, data.min, data.max) end
			else
				CreateConVar(name, value, fcvar, help)
			end
			SetGlobalInt(name, tonumber(value))
			
			if (f and f ~= nil) then
				if type(f) == "function" then f( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalInt(name, tonumber(new)) end, "phx.cvnum_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalInt(name, tonumber(value))
		end
	},
	[CTYPE_FLOAT] = {
		Set = function(name, value, fcvar, help, data, f)
			if (data and data ~= nil) then
				if type(data) == "table" then  CreateConVar(name, value, fcvar, help, data.min, data.max) end
			else
				CreateConVar(name, value, fcvar, help)
			end
			SetGlobalFloat(name, value)
			
			if (f and f ~= nil) then
				if type(f) == "function" then f( name, value ) end
			else
				cvars.AddChangeCallback(name, function(_,_,new) SetGlobalFloat(name, tonumber(new)) end, "phx.cvflt_" .. name)
			end
		end,
		Get = function(name, value)
			return GetGlobalFloat(name, tonumber(value))
		end
	}
}

-- Server only purpose.
CreateConVar( "ph_kick_non_admin_access", "0", {FCVAR_SERVER_CAN_EXECUTE,FCVAR_ARCHIVE}, "Выгонять ли не-админов при попытке использовать админ-команды? Если нет — показывать сообщение.", 0, 1 )

local CVAR = {}
CVAR["ph_show_splash_screen"]           =   { CTYPE_BOOL,   "1", CVAR_SERVER_ONLY, "Показывать заставку при входе на сервер." }
CVAR["ph_tmp_accurate_hull"]            =   { CTYPE_BOOL,   "1", CVAR_SERVER_ONLY, "(Экспериментально) Включить точный размер хитбокса вместо округления.\nПримечание: вы можете застрять в стенах, но это может вызывать некоторые проблемы, используйте с осторожностью." }

CVAR["ph_include_default_taunt"]        =   { CTYPE_BOOL,   "1", CVAR_SERVER_ONLY, "Включать ли стандартные насмешки PH:X из игрового режима?" }
CVAR["ph_taunt_soundlevel"]        		=   { CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "Уровень громкости насмешек, значение от 1 до 6.\n1=75дБ\n2=80дБ\n3=85дБ\n4=90дБ\n5=95дБ\n6=100дБ — по умолчанию.", { min = 1, max = 6 } }
CVAR["ph_overlap_taunt"]				=	{ CTYPE_BOOL,   "0", CVAR_SERVER_ONLY, "Должны ли воспроизводимые насмешки перекрывать новую насмешку? Отключение означает остановить и проигрывать новую. Включите, чтобы сохранить классическое поведение." }

CVAR["ph_banned_models"]				=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Запретить/разрешить использование ограниченных моделей. Не включает запрещённые модели!"}

CVAR["ph_use_lang"]						=	{ CTYPE_BOOL, 	"0", 	 CVAR_SERVER_ONLY, "Включить принудительный язык отображения. ЭТО ОБОЙДЁТ ПРЕДПОЧИТАЕМЫЙ ПОЛЬЗОВАТЕЛЕМ ЯЗЫК!" }
CVAR["ph_force_lang"]					=	{ CTYPE_STRING, "en_us", CVAR_SERVER_ONLY, "Язык для принудительного отображения." }
CVAR["ph_default_lang"]					=	{ CTYPE_STRING, "en_us", CVAR_SERVER_ONLY, "Какой язык устанавливать игроку при первом входе на ваш сервер. Рекомендуется всегда оставлять 'en_us'." }

CVAR["ph_use_custom_plmodel_for_prop"]	=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Использовать ли кастомную модель игрока для объектов (Props) при начале раунда?" }
CVAR["ph_use_custom_plmodel"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Использовать ли кастомную модель игрока для Охотников?\nОбратите внимание: также нужно активировать \'ph_use_custom_plmodel_for_prop\'!" }
CVAR["ph_use_playermodeltype"]			=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "Из какого списка моделей брать? 0 = все доступные модели игроков, 1 = устаревший метод: list.Get('PlayerOptionsModel') (рекомендуется, если хотите настроить список моделей)", { min = 0, max = 1 } }

CVAR["ph_enable_hunter_player_color"]   =   { CTYPE_BOOL,   "0", CVAR_SERVER_ONLY, "Включить цвет игрока для команды Охотников" }
CVAR["ph_enable_prop_player_color"]     =   { CTYPE_BOOL,   "0", CVAR_SERVER_ONLY, "Включить цвет игрока для команды Объектов" }

CVAR["ph_autotaunt_enabled"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "(Применяется только в новом раунде) Включить автоматические насмешки" }
CVAR["ph_autotaunt_delay"]				=	{ CTYPE_NUMBER, "45", CVAR_SERVER_ONLY_NO_NOTIFY, "Задержка в секундах для функции автоматических насмешек" }
CVAR["ph_custom_taunt_mode"]			=	{ CTYPE_NUMBER, "2", CVAR_SERVER_ONLY, "Включить кастомные насмешки для объектов по нажатию C? (по умолчанию 2)\n  Для этого нужен список кастомных насмешек.", { min = 0, max = 2 } }
CVAR["ph_customtaunts_delay"]			=	{ CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "Сколько секунд задержки у объектов между кастомными насмешками? (по умолчанию 6)" }
CVAR["ph_normal_taunt_delay"]			=	{ CTYPE_NUMBER, "2", CVAR_SERVER_ONLY, "Сколько секунд задержки у объектов между обычными насмешками [F3]? (по умолчанию 2)" }
-- fake taunt & pitch
CVAR["ph_randtaunt_map_prop_enable"]	=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Разрешить фейковые насмешки на случайных объектах карты. Доступно только через меню кастомных насмешек." }
CVAR["ph_randtaunt_map_prop_max"]		=	{ CTYPE_NUMBER, "6", CVAR_SERVER_ONLY, "Максимальное использование фейковых насмешек. -1 — без ограничений (но не рекомендую устанавливать безлимит!)" }
CVAR["ph_taunt_pitch_enable"]			=	{ CTYPE_BOOL,   "1", CVAR_SERVER_ONLY, "Включить или отключить изменение высоты тона насмешек" }
CVAR["ph_taunt_pitch_range_min"]		=	{ CTYPE_FLOAT, "50.0", CVAR_SERVER_ONLY_NO_NOTIFY, "Минимальный порог/допустимый диапазон высоты тона для насмешек", {min = 1, max = 99} }
CVAR["ph_taunt_pitch_range_max"]		=	{ CTYPE_FLOAT, "200.0", CVAR_SERVER_ONLY_NO_NOTIFY, "Максимальный порог/допустимый диапазон высоты тона для насмешек", {min = 100, max = 255} }

CVAR["ph_enable_taunt_scanner"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "(Требуется перезапуск карты) Включить сканер насмешек?" }

-- Convars for Armor
CVAR["ph_allow_armor"]			        =	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Разрешить броню? Может потребовать перезапуск раунда." }

CVAR["ph_prop_jumppower"]				=	{ CTYPE_FLOAT, 	"1.5", CVAR_SERVER_ONLY_NO_NOTIFY, "Множитель силы прыжка объектов (не путать с гравитацией!). По умолчанию 1.4. Мин. 1.", {min=1, max=50}, -- in menu, it only limits to 5.
function(cvarname, val)
    cvars.AddChangeCallback( cvarname, function(_,_,new )    
        for _,v in pairs(team.GetPlayers(TEAM_PROPS)) do
            if v:Alive() then v:SetJumpPower(160 * tonumber(new)) end
        end
        SetGlobalFloat( cvarname, tonumber(new) )
    end, "phx.cvflt_" .. cvarname)
    
end }
CVAR["ph_hunter_jumppower"]		=	{ CTYPE_FLOAT, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Множитель силы прыжка охотников (не путать с гравитацией!). По умолчанию 1. Мин. 1.", {min=1, max=25}, -- in menu, it only limits to 2.5.
function(cvarname, val)
    cvars.AddChangeCallback( cvarname, function(_,_,new )    
        for _,v in pairs(team.GetPlayers(TEAM_HUNTERS)) do
            if v:Alive() then v:SetJumpPower(160 * tonumber(new)) end
        end
        SetGlobalFloat( cvarname, tonumber(new) )
    end, "phx.cvflt_" .. cvarname)
    
end }
CVAR["ph_notice_prop_rotation"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Включать уведомление о повороте объекта при каждом появлении объекта." }

CVAR["ph_freezecam"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Включить функцию замороженной камеры для объектов." }
CVAR["ph_freezecam_hunter"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Включить функцию замороженной камеры для охотников." }
CVAR["ph_fc_use_single_sound"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Использовать один звук замороженной камеры вместо списка?" }
CVAR["ph_fc_cue_path"]					=	{ CTYPE_STRING, "misc/freeze_cam.wav", CVAR_SERVER_ONLY, "Путь к единственному звуку замороженной камеры.", 
	function(cvarname, val)
		-- override default callback because this is important part.
		cvars.AddChangeCallback( cvarname, function(_,_,new)
			if string.find(new, "\\") then
				print("[ConVar:FreezeCam] Warning: Detected Backslash (\\) character! Please use \"/\" instead!")
			end
			-- replace escaped backslash char, if any.
			local ReplaceIllegalPath = string.Replace(new, "\\", "/")
			
			RunConsoleCommand( cvarname, ReplaceIllegalPath )
			SetGlobalString( cvarname, ReplaceIllegalPath )
			PHX.LegalSoundPath = ReplaceIllegalPath
		end, "phx.cvstr_" .. cvarname)
	end
}
PHX.LegalSoundPath							= 	GetGlobalString("ph_fc_cue_path", "misc/freeze_cam.wav")

CVAR["ph_notify_player_join_leave"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Уведомлять о входе и выходе игроков в чате?" }

CVAR["ph_usable_prop_type"]					=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, "Типы используемых объектов. 1 = Только физика, 2 = Динамические, Рагдоллы и Физика, 3 = Почти всё, 4 = Пользовательский", { min = 1, max = 4 },
	function(cvarname, value)
		cvars.AddChangeCallback( cvarname, function(_,_,new)
			PHX:SetUsableEntity( tonumber(new) )
			SetGlobalInt( cvarname, tonumber(new) )
		end, "phx.cvnum_" .. cvarname )
	end }
CVAR["ph_usable_prop_type_notice"]			= 	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "Уведомлять о том, что некоторые объекты нельзя скопировать клавишей 'E'. Работает только если 'ph_usable_prop_type' установлен в '3' или '4'." }

CVAR["ph_enable_lucky_balls"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Спавнить Удачные шары на разрушаемых объектах?" }
CVAR["ph_enable_devil_balls"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Спавнить Шары дьявола при смерти охотника?" }

CVAR["ph_prop_must_standing"]				=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY, "[Экспериментально] Ограничить копирование объектов только когда они стоят. Отключите, чтобы разрешить копирование при приседе или прыжке."}
CVAR["ph_hunter_fire_penalty"]				=	{ CTYPE_NUMBER, "5", CVAR_SERVER_ONLY, "Очки здоровья, снимаемые с охотников при выстреле.", { min = 1, max = 500 } }
CVAR["ph_hunter_kill_bonus"]				=	{ CTYPE_NUMBER, "100", CVAR_SERVER_ONLY, "Сколько здоровья вернуть охотнику после убийства объекта.", { min = 0, max = 500 } }
CVAR["ph_game_time"]						=	{ CTYPE_NUMBER, "30", CVAR_SERVER_ONLY, "(Требуется перезапуск карты) Максимальное время (в минутах) — по умолчанию 30 минут." }
CVAR["ph_hunter_blindlock_time"]			=	{ CTYPE_NUMBER, "30", CVAR_SERVER_ONLY, "Как долго охотники ослеплены (в секундах)" }
CVAR["ph_round_time"]						=	{ CTYPE_NUMBER, "300", CVAR_SERVER_ONLY, "(Требуется перезапуск карты) Время (в секундах) для каждого раунда." }
CVAR["ph_rounds_per_map"]					=	{ CTYPE_NUMBER, "10", CVAR_SERVER_ONLY, "(Требуется перезапуск карты) Количество раундов на одной карте (по умолчанию: 10)" }
CVAR["ph_waitforplayers"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, 	"Ждать ли игроков для нормального раунда?" }
CVAR["ph_min_waitforplayers"]				=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, 	"Минимальное количество игроков, которых нужно ждать для начала раунда. Значение не должно быть меньше 1.", { min = 1, max = game.MaxPlayers() }, 
function(cvarname, value)
    cvars.AddChangeCallback(cvarname, function(_, _, new)
        if tonumber(new) < 1 then
            RunConsoleCommand("ph_min_waitforplayers", "1")
            SetGlobalInt( cvarname, tonumber(new) )
            print("[ConVar:WaitForPlayers] Warning: "..cvarname.." value cannot contain less than 0. Use 'ph_waitforplayers' 0 to disable!")
        end
    end, "phx.cvnum_" .. cvarname)
end }

CVAR["ph_sv_enable_obb_modifier"]			=	{ CTYPE_BOOL, 	"1",CVAR_SERVER_ONLY_NO_NOTIFY, "Разработчик: Включить переопределение/модификатор данных OBB модели" }
CVAR["ph_reload_obb_setting_everyround"]	=	{ CTYPE_BOOL, 	"1",CVAR_SERVER_ONLY_NO_NOTIFY, "Разработчик: Перезагружать переопределение/модификатор данных OBB при каждом перезапуске раунда" }
CVAR["ph_prop_viewoffset_mult"]				=	{ CTYPE_FLOAT,	"0.8", CVAR_SERVER_ONLY_NO_NOTIFY, "Вычитание/добавление высоты смещения вида объекта с помощью множителя. Мин: 0.6, Макс: 1.2. По умолчанию: 0.8.", { min=0.6,max=1.2 } }
CVAR["ph_mkbren_use_new_mdl"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Использовать новую модель для бонусного оружия Bren MK II (требуется перезапуск карты!!)" }
CVAR["ph_check_for_rooms"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Проверять комнаты перед копированием? Это предотвратит застревание в других объектах (таких как объект, стена и т.д.)" }
CVAR["ph_enable_plnames"]					=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Серверный контроль того, видят ли клиенты имена игроков своей команды сквозь стены." }
CVAR["ph_prop_camera_collisions"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Предотвращать просмотр объектами сквозь стены. (Коллизии камеры)" }
CVAR["ph_prop_collision"]					=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Должны ли объекты команды сталкиваться друг с другом?" }
CVAR["ph_add_hla_combine"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Добавить HLA Комбайнов к стандартным моделям комбайнов? [ТРЕБУЕТСЯ ПЕРЕЗАПУСК КАРТЫ!]" }
CVAR["ph_swap_teams_every_round"]			=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Менять ли команды каждый раунд?" }
CVAR["ph_max_teamchange_limit"]				=	{ CTYPE_NUMBER, "8", CVAR_SERVER_ONLY_NO_NOTIFY, "Сколько раз игрок может сменить команду. По умолчанию 5. -1 — отключено." }
CVAR["ph_enable_teambalance"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Включить баланс команд при перезапуске раунда?" }
-- Taken from PH:E v16. This addition was made by Fafy
CVAR["ph_force_join_balanced_teams"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Заставлять игроков уравнивать команды при входе? Значение 0 — не заставлять вступать в сбалансированные команды." }

CVAR["ph_enable_decoy_reward"]				=	{ CTYPE_BOOL,	"1", CVAR_SERVER_ONLY_NO_NOTIFY, "Включить награду за приманку? Награда выдаётся, если в конце каждого раунда жив хотя бы один объект." }
CVAR["ph_decoy_health"]						=	{ CTYPE_NUMBER,	"10", CVAR_SERVER_ONLY_NO_NOTIFY, "Сколько очков здоровья у приманки. По умолчанию 10.", { min = 1, max = 200 } }
CVAR["ph_props_disable_footstep"]           =   { CTYPE_BOOL,  "1", CVAR_SERVER_ONLY, "Отключить звук шагов игрока для команды объектов." }

CVAR["ph_smggrenadecounts"]					=	{ CTYPE_NUMBER, "1", CVAR_SERVER_ONLY, "Сколько гранат для SMG1 выдавать при спавне?", { min = 1, max = 10 } }
CVAR["ph_give_grenade_near_roundend"]       =   { CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Выдавать ли гранаты перед концом раунда? Если да, также смотрите 'ph_give_grenade_roundend_before_time'."}
CVAR["ph_give_grenade_roundend_before_time"] =   { CTYPE_FLOAT, "15", CVAR_SERVER_ONLY_NO_NOTIFY, "Время в секундах для выдачи гранат перед концом раунда. Обычно от 10 до 30 секунд." }

CVAR["ph_use_new_chat"]						=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "!!ТРЕБУЕТСЯ ПЕРЕЗАПУСК КАРТЫ!\nИспользовать новый (временный) чат? Это заменит стандартный чат и предотвратит перекрытие нового HUD.", 
function(cvarname, value)	
	cvars.AddChangeCallback( cvarname, function(cv, _, new)
		print(cv .. " -> was changed. Please be sure to change/restart map to take effect!")
		for _,v in pairs(player.GetHumans()) do
			if v:CheckUserGroup() then
				v:ChatPrint("УВЕДОМЛЕНИЕ: Требуется перезапуск карты — ConVar '"..cv.."' была изменена, поэтому нужна смена карты.")
				v:ChatPrint("ПРЕДУПРЕЖДЕНИЕ: Устарело: eChat будет заменена/удалена в будущих обновлениях!")
			end
		end
		SetGlobalBool(cvarname, tobool(new))
	end, "phx.cvbool_" .. cvarname)
end }
CVAR["ph_new_chat_pos_sub"]					=	{ CTYPE_NUMBER, "50", CVAR_SERVER_ONLY_NO_NOTIFY, "Перемещение (в пикселях) чата путём вычитания Y-пикселей вверх. Отрицательное (-) значение — переместить ниже." }

CVAR["ph_allow_respawnonblind"]				=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Разрешить быстрое возрождение во время слепоты?" }
CVAR["ph_allow_respawnonblind_team_only"]	=	{ CTYPE_NUMBER, "0", CVAR_SERVER_ONLY, "Если указано, какой команде разрешено возрождаться? 0 = ВСЕ КОМАНДЫ, 1 = ОХОТНИКИ, 2 = ОБЪЕКТЫ", { min = 0, max = 2 } }
CVAR["ph_allow_respawn_from_spectator"]		=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Разрешить наблюдателям вступать в любую команду и возрождаться во время слепоты?" }
CVAR["ph_blindtime_respawn_percent"]		=	{ CTYPE_FLOAT, 	"0.75", CVAR_SERVER_ONLY_NO_NOTIFY, "Какой процент времени слепоты позволяет игроку возродиться? По умолчанию 0.75 (75%)", { min = 0.30, max = 1.00 } }
CVAR["ph_allow_respawnonblind_teamchange"]	=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY, "Не рекомендуется, если разрешено: разрешить возрождение во время слепоты ПОСЛЕ смены команды (из объектов в охотники и наоборот).\nНе рекомендую включать, так как игроки могут этим злоупотреблять, постоянно сидя в команде объектов.\nВключайте ТОЛЬКО если знаете, что делаете!" }
CVAR["ph_allow_pickup_object"]				=	{ CTYPE_NUMBER, "3", CVAR_SERVER_ONLY, "Разрешить подбирать объекты? 0=Нет, 1=Только охотники, 2=Только объекты, 3=Все", { min = 0, max = 3 } }

-- MapVotes, these aren't listed on F1 Prop Hunt Menu, this needs to be set manually through your server.cfg!!
CVAR["ph_enable_mapvote"]					=	{ CTYPE_BOOL, 	"1", CVAR_SERVER_ONLY, "Включить/отключить встроенную систему голосования за карты PH:X? Установите 0, чтобы отключить и использовать аддон голосования, будет вызван хук 'PH_OverrideMapVote'.\nЕсли 'ph_use_custom_mapvote' и 'ph_use_custom_mapvote_cmd' установлены в 1, они всё равно вызываются." }
CVAR["ph_use_custom_mapvote"]				=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY_NO_NOTIFY, "Использовать внешнюю систему голосования за карты? Это переопределит встроенное голосование. См. помощь 'ph_custom_mv_func'." }
CVAR["ph_use_custom_mapvote_cmd"]			=	{ CTYPE_BOOL, 	"0", CVAR_SERVER_ONLY_NO_NOTIFY, "Использовать внешнее голосование за карты через консольную команду? Это переопределит встроенное голосование И 'ph_use_custom_mapvote'. См. помощь 'ph_custom_mv_concmd'." }
CVAR["ph_custom_mv_func"]					=	{ CTYPE_STRING, "PHX.StartMapVote()", CVAR_SERVER_ONLY_NO_NOTIFY, "Если установлен 'ph_use_custom_mapvote', используйте функцию для вызова не встроенной системы голосования (например, из аддонов).\nПРИМЕЧАНИЕ: 'Регистр важен' и локальные переменные не будут переданы в указанный код!" }
CVAR["ph_custom_mv_concmd"]					=	{ CTYPE_STRING, "mv_start", CVAR_SERVER_ONLY_NO_NOTIFY, "Если установлен 'ph_use_custom_mapvote_cmd', используйте это для вызова голосования через их консольную команду. Переопределяет 'ph_use_custom_mapvote'. Если есть аргументы, укажите их тоже. (например: start_mapvote 15 (15 означает секунды))" }
-- End of MapVotes

CVAR["ph_exp_rot_pitch"]					=	{ CTYPE_BOOL, 	"0", 	CVAR_SERVER_ONLY_NO_NOTIFY, "[Экспериментально!] Разрешить поворот по тангажу (pitch) для объектов." }
CVAR["ph_enable_thirdperson"]               =   { CTYPE_BOOL,   "1", 	CVAR_SERVER_ONLY, "Включить режим от третьего лица для охотников." }
CVAR["ph_sv_thirdperson_desired"]           =   { CTYPE_BOOL,   "0", 	CVAR_SERVER_ONLY, "Разрешить режиму от третьего лица использовать желаемую позицию камеры сервера (запретить кастомную позицию игрока)" }
CVAR["ph_sv_thirdperson_ddist"]             =   { CTYPE_NUMBER, "64", 	CVAR_SERVER_ONLY_NO_NOTIFY, "Третье лицо: желаемое расстояние камеры.", { min=32, max = 128 } }
CVAR["ph_sv_thirdperson_dright"]            =   { CTYPE_NUMBER, "16", 	CVAR_SERVER_ONLY_NO_NOTIFY, "Третье лицо: желаемая позиция камеры по правой оси.", { min=-128, max = 128 } }
CVAR["ph_sv_thirdperson_dup"]               =   { CTYPE_NUMBER, "4", 	CVAR_SERVER_ONLY_NO_NOTIFY, "Третье лицо: желаемая позиция камеры по вертикали.", { min=-32, max = 32 } }

CVAR["ph_falldamage"]						=	{ CTYPE_BOOL,	"1",	CVAR_SERVER_ONLY, "Включить урон от падения. Применяется ко всем командам." }
CVAR["ph_falldamage_real"]					=	{ CTYPE_BOOL,	"0",	CVAR_SERVER_ONLY_NO_NOTIFY, "Наносить ли урон от падения путём вычитания 10 или реалистично." }
CVAR["ph_spect_inform_join_team"]			=	{ CTYPE_BOOL,	"1",	CVAR_SERVER_ONLY, "Информировать нераспределённых/наблюдателей статичным текстом с советом присоединиться к игре."}

-- Prop Chooser / Prop Menu
CVAR["pcr_enable"]							=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY, "Включить функцию меню объектов?"}
CVAR["pcr_allow_custom"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Разрешить добавление кастомных объектов в списки?"}
CVAR["pcr_enable_prop_ban"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Разрешить запрет объектов перед добавлением в списки меню объектов?"}
CVAR["pcr_max_use"]							=	{ CTYPE_NUMBER, "3", CVAR_SERVER_ONLY, "Максимальный лимит использования. -1 — без ограничений."}
CVAR["pcr_delay_use"]						=	{ CTYPE_FLOAT, "2.00", CVAR_SERVER_ONLY_NO_NOTIFY, "Задержка в секундах, прежде чем игрок сможет использовать меню объектов в следующие N секунд. (по умолчанию 2) — предотвращает спам."}

CVAR["pcr_only_allow_certain_groups"]		=	{ CTYPE_BOOL,   "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Доступ к меню объектов только для определённых групп? (например, Донор и т.д.)"}
CVAR["pcr_use_ulx_menu"]					=	{ CTYPE_BOOL,   "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Открывать ли меню объектов консольной командой (0) или командой ULX (1)?"}

CVAR["pcr_notify_messages"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY, "Уведомлять клиента о том, как пользоваться меню объектов?"}
CVAR["pcr_limit_enable"]					=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY,"Включить лимит максимального количества добавляемых объектов (см. 'pcr_max_prop_list' для количества моделей)."}
CVAR["pcr_max_prop_list"]					=	{ CTYPE_NUMBER, "100", CVAR_SERVER_ONLY, "Максимальный список добавленных в меню объектов. (по умолчанию 100)"}
CVAR["pcr_kick_invalid"]					=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY_NO_NOTIFY, "Выгонять любого пользователя, пытающегося получить доступ к несуществующей модели, с порогом 4x максимальных попыток."}
CVAR["pcr_use_room_check"]					=	{ CTYPE_BOOL, "1", CVAR_SERVER_ONLY, "Использовать проверку комнаты перед использованием другого (более крупного) объекта?"}
CVAR["pcr_enable_bbox_limit"]				=	{ CTYPE_BOOL, "0", CVAR_SERVER_ONLY_NO_NOTIFY, "Добавить лимит BBox (размер хитбокса) перед добавлением в списки меню объектов (если настроено)?"}
CVAR["pcr_bbox_max_height"]					=	{ CTYPE_NUMBER, "96", CVAR_SERVER_ONLY_NO_NOTIFY, "Максимальный лимит высоты коллизии BBOX. По умолчанию 96 (обычно 72 — стандартный размер хитбокса моделей Кляйнера."}
CVAR["pcr_bbox_max_width"]					=	{ CTYPE_NUMBER, "72", CVAR_SERVER_ONLY_NO_NOTIFY, "Максимальный лимит ширины коллизии BBOX. Либо: 72, 56, 48, 36, 32, ..."}

-- Load & init
for name, data in pairs(CVAR) do
	local isType = data[1]	   --cvar, value,   flag,    help,   data/f,   f callback
	ConVarTranslate[isType].Set( name, data[2], data[3], data[4], data[5], data[6] )
end

local function InitCVar()	
	if SERVER then PHX.cvarsynced = false end
end
hook.Add("Initialize", "PHX.InitCVARs", InitCVar)

-- here you can make a proper replicated convar.
-- however, they will be updated after new round (PostCleanupMap) event occured.
function PHX:AddCVar( cType, cName, cValue, cFlag, cHelp, cData, cFunc )
	if (!cType or cType == nil or !cName or cName == nil or cValue == nil) then
		ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
		return
	end
	
	if (cFlag and cFlag ~= nil) and istable(cFlag) and table.HasValue(cFlag, FCVAR_USERINFO) then
		ErrorNoHalt("[PHX CVAR] Error: Cannot add '".. cName .."' to Shared ConVar because it contains FCVAR_USERINFO flag set! Please use PHX:AddCLCVar() instead!")
		return
	end

	CVAR[cName]	= { cType, cValue, cFlag, cHelp, cData, cFunc }
	ConVarTranslate[cType].Set( cName, cValue, cFlag, cHelp, cData, cFunc )
end

-- Use this on Clients. Do Not use on Server Side unless you know what you're doing.
-- Either use GetConVar for global/engine convar, or use PHX:QCVar to retreive PHX convars only (Does not work for global / engines convars).
function PHX:GetCVar( cvar )

	if CVAR[cvar] and CVAR[cvar] ~= nil then
		local isType = CVAR[cvar][1]
		local value	 = CVAR[cvar][2]
		return ConVarTranslate[isType].Get( cvar, value ) -- value = default value for GetGlobal*'s failed value.
	end
	
	return nil -- should return nil instead of false.
end

-- /!\ DO NOT USE THIS IF YOUR REPLICATION IS WORKED.
-- /!\ THIS SHOULD **ONLY** BE USED IN FOLLOWING CONDITIONS OR HOOKS:
	-- > GM:Initialize
	-- > GM:Pre/On/PostGamemodeLoaded
	-- > Any Early Hooks before Config (*.cfg) Files are Loaded
	-- > PlayerInitSpawn or InitPostEntity ARE NOT NEEDED. Use PHX:GetCVar() instead!
-- See Example of how PHX:GetCVar() can get bugged on PHX:VerboseMsg()
function PHX:QCVar( cvar )
	if CVAR[cvar] and CVAR[cvar] ~= nil then
		local isType = CVAR[cvar][1]
		local value
		
		if isType == CTYPE_BOOL then
			value = GetConVar( cvar ):GetBool()
		elseif isType == CTYPE_FLOAT then
			value = GetConVar( cvar ):GetFloat()
		elseif isType == CTYPE_NUMBER then
			value = GetConVar( cvar ):GetInt()
		elseif isType == CTYPE_STRING then
			value = GetConVar( cvar ):GetString()
		end
		
		return value
	end
	
	return nil
end

function PHX:DebugCVar()
	for c,_ in pairs(CVAR) do
		print("['".. c .."'] | GetConVar/QCVar: " .. tostring(self:QCVar(c)) .. " -> GetGlobal*: " .. tostring(self:GetCVar(c)) )
	end
end

-- /!\  DO NOT USE /!\ -- Refresh the convar after config files are loaded.
if SERVER then
	local TranslateInit = {
		[CTYPE_BOOL] 	= function(name) SetGlobalBool(  name, GetConVar(name):GetBool()) 	end,
		[CTYPE_NUMBER]	= function(name) SetGlobalInt(   name, GetConVar(name):GetInt()) 	end,
		[CTYPE_STRING]	= function(name) SetGlobalString(name, GetConVar(name):GetString()) end,
		[CTYPE_FLOAT]	= function(name) SetGlobalFloat( name, GetConVar(name):GetFloat()) 	end,
	}
	
	function PHX:SyncCVar()
		for c,v in pairs(CVAR) do
			local isType = v[1]
			local trans = TranslateInit[isType]
			trans(c)
		end
	end
	
	function PHX:InitCVar()	-- called from: init.lua@631
		self:SyncCVar()
		self.cvarsynced = true
	end
	
	hook.Add("PostCleanupMap", "sync_CvarEveryRoundRestart", function()
		PHX:SyncCVar()
	end)
end

-- START OF CLIENT CONVAR

if CLIENT then

	local CLCVAR = {} -- Move outside "Client" Realm for convar dump. Once you're done, get back in.

	CLCVAR["ph_cl_language"]				=	{ CTYPE_STRING, GetGlobalString("ph_default_lang", "en_us"), true, true, "Предпочитаемый язык" }
	
	-- Old convars that previously placed in cl_init.lua is moved HERE.
	CLCVAR["ph_cl_halos"]					=	{ CTYPE_BOOL, 	"1",	 true, true,  "Включить/отключить эффект свечения (halo) при выборе объекта.", {min=0,max=1} }
	CLCVAR["ph_cl_pltext"] 					=	{ CTYPE_BOOL, 	"1",	 true, false, "Текст над игроками. 0 = Отключить. 1 = Включить.", {min=0,max=1} }
	CLCVAR["ph_cl_endround_sound"] 			=	{ CTYPE_BOOL, 	"1",	 true, false, "Играть звук при окончании раунда? 0 — отключить.", {min=0,max=1} }
	CLCVAR["ph_cl_autoclose_taunt"] 		=	{ CTYPE_BOOL, 	"1",	 true, false, "Автоматически закрывать окно насмешек (при двойном клике по ним)?", {min=0,max=1} }
	CLCVAR["ph_cl_spec_hunter_line"] 		=	{ CTYPE_BOOL, 	"1",	 true, false, "Рисовать линию на охотниках, чтобы видеть их прицел в режиме наблюдателя.", {min=0,max=1} }
	CLCVAR["cl_enable_luckyballs_icon"] 	=	{ CTYPE_BOOL, 	"1",	 true, false, "Показывать иконку 'Удачного шара' после их появления", {min=0,max=1} }
	CLCVAR["cl_enable_devilballs_icon"] 	=	{ CTYPE_BOOL, 	"1",	 true, false, "Показывать иконку 'Шара дьявола' после их появления", {min=0,max=1} }
	CLCVAR["ph_hud_use_new"]				=	{ CTYPE_BOOL, 	"1",	 true, false, "Использовать новый HUD PHX", {min=0,max=1} }
	CLCVAR["ph_show_team_topbar"] 			=	{ CTYPE_BOOL, 	"1",	 true, false, "Показывать полосу с количеством живых игроков команды вверху слева", {min=0,max=1} }
	CLCVAR["ph_show_custom_crosshair"]		=	{ CTYPE_BOOL, 	"1",	 true, false, "Показывать кастомный прицел для объектов", {min=0,max=1} }
	CLCVAR["ph_show_tutor_control"]			=	{ CTYPE_BOOL, 	"1",	 true, false, "Показывать подсказку 'Управление в игре' при каждом появлении объекта. Показывается только дважды и сбрасывается при смене карты/выходе.", {min=0,max=1} }
    -- Mouse right clicking is now client-sided.
    CLCVAR["ph_prop_right_mouse_taunt"]		=	{ CTYPE_BOOL,	"0",     true, true,  "Могут ли объекты воспроизводить насмешку по правой кнопке мыши?" }

	CLCVAR["ph_default_taunt_key"]			=	{ CTYPE_NUMBER,  KEY_F3, true, true,  "Клавиша случайной насмешки. По умолчанию F3 ("..tostring(KEY_F3)..")" }
	CLCVAR["ph_default_customtaunt_key"]	=	{ CTYPE_NUMBER,  KEY_C,  true, true,  "Клавиша кастомной насмешки. По умолчанию C ("..tostring(KEY_C)..")" }
	CLCVAR["ph_default_rotation_lock_key"]	=	{ CTYPE_NUMBER,  KEY_R,  true, true,  "Клавиша блокировки поворота. По умолчанию R ("..tostring(KEY_R)..")" }

	CLCVAR["ph_prop_menu_key"]				=	{ CTYPE_NUMBER,  KEY_F8, true, true,  "Клавиша открытия меню объектов. По умолчанию F8 ("..tostring(KEY_F8)..")" }
	CLCVAR["ph_prop_midair_freeze_key"]		=	{ CTYPE_NUMBER,  KEY_M,  true, true,  "Клавиша заморозки объекта в воздухе. По умолчанию M ("..tostring(KEY_M)..")" }
	
	-- New ClientConvar
	CLCVAR["ph_cl_pitch_taunt_enable"]		=	{ CTYPE_BOOL,	"1",	 true, true,  "Включить уровень высоты тона для кастомных насмешек?"}
	CLCVAR["ph_cl_pitch_level"]				=	{ CTYPE_FLOAT,	"100.0", true, true,  "Текущий используемый уровень высоты тона.", { min = 1, max = 255 } }
	CLCVAR["ph_cl_pitch_apply_random"]		=	{ CTYPE_BOOL,	"0",	 true, true,  "Применять также к случайным насмешкам."}
	CLCVAR["ph_cl_pitch_randomized"]		=	{ CTYPE_BOOL,	"0",	 true, true,  "Случайный тон насмешек для КАСТОМНЫХ насмешек независимо от предпочтительного уровня."}
	CLCVAR["ph_cl_pitch_randomized_random"]	=	{ CTYPE_BOOL,	"0", 	 true, true,  "Случайный тон насмешек для СЛУЧАЙНЫХ насмешек независимо от предпочтительного уровня." }
	
	CLCVAR["ph_cl_pitch_apply_fake_prop"]	=	{ CTYPE_BOOL,	"0", 	 true, true,  "Применять высоту тона к фейковым насмешкам." }
    CLCVAR["ph_cl_pitch_fake_prop_random"]  =   { CTYPE_BOOL,   "0",     true, true,  "Случайный тон для ФЕЙКОВЫХ насмешек независимо от предпочтительного уровня."}
	
	CLCVAR["ph_cl_decoy_spawn_key"]			=	{ CTYPE_NUMBER, KEY_1,	 true, true,  "Какую клавишу использовать для создания объекта 'Приманка'? По умолчанию клавиша 1 ("..tostring(KEY_1)..")" }
    CLCVAR["ph_cl_decoy_spawn_helper"]      =   { CTYPE_BOOL,   "1",     true, false, "Показывать/скрывать помощника размещения Приманки? Показывает белую точку с текстом возле прицела." }
    CLCVAR["ph_cl_decoy_spawn_marker"]      =   { CTYPE_BOOL,   "1",     true, false, "Показывать/скрывать маркер Приманки?" }
    
    CLCVAR["ph_thirdperson_key"]            =   { CTYPE_NUMBER, KEY_N,   true, true, "Клавиша режима от третьего лица. Работает только для охотников." }
    CLCVAR["ph_tpcam_dist"]                 =   { CTYPE_NUMBER, "64",      true, true, "Дистанция вперёд для камеры от третьего лица.", { min=32, max = 128 } }
    CLCVAR["ph_tpcam_right"]                =   { CTYPE_NUMBER, "16",      true, true, "Позиция вправо/влево для камеры от третьего лица.", { min=-128, max = 128 } }
    CLCVAR["ph_tpcam_up"]                   =   { CTYPE_NUMBER, "5",       true, true, "Позиция вверх для камеры от третьего лица.", { min=-32, max = 32 } }
	
	CLCVAR["ph_cl_unstuck_key"]             =   { CTYPE_NUMBER, KEY_F6,    true, true, "Клавиша попытки вылезти из текстуры." }

	local cTranslate = {}

	cTranslate[CTYPE_STRING] 	= function(name) return GetConVar(name):GetString()	end
	cTranslate[CTYPE_BOOL] 		= function(name) return GetConVar(name):GetBool() 	end
	cTranslate[CTYPE_NUMBER] 	= function(name) return GetConVar(name):GetInt() 	end
	cTranslate[CTYPE_FLOAT] 	= function(name) return GetConVar(name):GetFloat() 	end
	
	local function SetClientConVar (name, value, shouldSave, isUserInfo, help, data, func)
		if (data and data ~= nil) then
			-- Note: if value contains String, it wouldn't work if data.min and data.max is present. You've been warned!
			if type(data) == "table" and (not table.IsEmpty(data)) then
				CreateClientConVar(name, value, shouldSave, isUserInfo, help, data.min, data.max)
			end
		else
			CreateClientConVar(name, value, shouldSave, isUserInfo, help)
		end
		
		-- do something within the function with associated cvar, if any.
		if (func and func ~= nil) then
			if type(func) == "function" then func(name, value) end
		end
	end
	
	-- immediately create convars
	for cvar,data in pairs(CLCVAR) do
		SetClientConVar(cvar, data[2], data[3], data[4], data[5], data[6], data[7])
	end
	
	function PHX:AddCLCVar(cType, cName, cValue, cSave, cUserInfo, cHelp, cData, cFunc)
		if (!cType or cType == nil or !cName or cName == nil or cValue == nil) then
			ErrorNoHalt("[PHX CVAR] ConVar Type, ConVar Name and ConVar Value cannot be Empty!")
			return
		end
		
		CLCVAR[cName]	= { cType, cValue, cSave, cUserInfo, cHelp, cData, cFunc }
		SetClientConVar( cName, cValue, cSave, cUserInfo, cHelp, cData, cFunc )
	end
	
	function PHX:GetCLCVar( name )
		if CLCVAR[name] and CLCVAR[name] ~= nil then
			local id = CLCVAR[name][1]
			local trans = cTranslate[id]( name )
			
			return trans
		end
		
		return nil
	end
end

-- END OF CLIENT


-- ConVar Dump for Config File Generator.
-- Do not use this or uncomment, unless if you're know what you're doing.
--[[ function convardumpforcfg()
	local f = PHX.ConfigPath .. "/convardump.txt"
	if CLIENT then
		f = PHX.ConfigPath .. "/convardump_cl.txt"
	end
	
	local t = {}
	local CVX = {}
	if SERVER then
		CVX = CVAR
	else
		CVX = CLCVAR
	end
	
	for cvar,data in SortedPairs(CVX) do
		local value = tostring(data[2])
		local c = data[4] 
		if CLIENT then c = data[5] end
		local strhelp = string.Replace( c, "\n", " " )
		local help  = "// " .. strhelp
		
		table.insert(t, help.."\n"..cvar.."\t"..value)
	end
	
	local concat = table.concat(t,"\n\n")
	
	file.Write(f, concat)
end ]]