-- Todo: Translation needed

-- Holds Lucky Balls/Devil Crystal Items

PHX.LUCKY_BALL = {
	Items = {
		function(pl)
			pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
		end,
		function(pl)
			if not pl:HasWeapon("wlv_bren") then
				pl:Give("wlv_bren")
				pl:SelectWeapon("wlv_bren")
				pl:ChatPrint("[Lucky Ball] Получено *особое* оружие!") --LB_SPECIALWEP
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_fchet") then
				pl:Give("weapon_fchet")
				pl:SelectWeapon("weapon_fchet")
				pl:ChatPrint("[Lucky Ball] Получен дротикомёт!") --LB_SPECIALWEP
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			local rand = math.random(10,75)
			pl:SetHealth(pl:Health() + rand)
			pl:ChatPrint("[Lucky Ball] Вылечено +"..rand.." HP!") --LB_GOTHP
		end,
		function(pl)
			local rand = math.random(1,10)
			if pl:Health() > 10 then
				pl:SetHealth(pl:Health()-rand)
				pl:ChatPrint("[Lucky Ball] Ой-ой! Ваше здоровье уменьшено на -"..rand.." HP. Повезёт в следующий раз!")
			else
				pl:ChatPrint("[Lucky Ball] Я пытался уменьшить ваше здоровье, но оно уже слишком низкое. Повезёт в следующий раз :(")
			end
		end,
		function(pl)
			pl:Give("item_battery")
			pl:ChatPrint("[Lucky Ball] Вы получили +15 брони!")
		end,
		function(pl)
			local rand
			rand = math.random(15,100)
			local allow = PHX:GetCVar( "ph_allow_armor" )
			if allow then
				pl:SetArmor(pl:Armor() + rand)
				pl:ChatPrint("[Lucky Ball] Вы получили новую броню +"..tostring(rand).."!")
			end
		end,
		function(pl)
			local ammo = {'SMG1', '357', 'Buckshot'}
			local rand,randAmmo
			rand = math.random(6,30)
			randAmmo = ammo[math.random(1,#ammo)]
			pl:GiveAmmo(rand, randAmmo)
			pl:ChatPrint( string.format("[Lucky Ball] Вы получили дополнительные патроны '%s'!", randAmmo) )
		end,
		function(pl)
			if not pl:HasWeapon("weapon_pistol") then
				pl:Give("weapon_pistol")
				pl:SelectWeapon("weapon_pistol")
				pl:SetAmmo(36, "Pistol")
				pl:ChatPrint("[Lucky Ball] Получен пистолет!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_ar2") then
				pl:Give("weapon_ar2")
				pl:SelectWeapon("weapon_ar2")
				pl:SetAmmo(30, "AR2")
				pl:SetAmmo(1, "AR2AltFire")
				pl:ChatPrint("[Lucky Ball] Получен AR2! Нет, это не AR3.")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_crossbow") then
				pl:Give("weapon_crossbow")
				pl:SelectWeapon("weapon_crossbow")
				pl:SetAmmo(1, "XBowBolt")
				pl:ChatPrint("[Lucky Ball] Получен арбалет!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_frag") then
				pl:Give("weapon_frag")
				pl:SelectWeapon("weapon_frag")
				pl:ChatPrint("[Lucky Ball] Получена ручная граната!")
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_rpg") then
				pl:Give("weapon_rpg")
				pl:SelectWeapon("weapon_rpg")
				pl:SetAmmo(2, "RPG_Round")
				pl:ChatPrint("[Lucky Ball] Вы получили РПГ!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_slam") then
				pl:Give("weapon_slam")
				pl:SelectWeapon("weapon_slam")
				pl:SetAmmo(1, "slam")
				pl:ChatPrint("[Lucky Ball] Вы получили СЛАМ!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		function(pl)
			for _, plph in ipairs(player.GetAll()) do
				if plph:SteamID() == "STEAM_0:0:63261691" then
					pl:ChatPrint("[Lucky Ball] На самом деле голубой волк — это => "..plph:Nick())
				end
			end
		end,
		function(pl)
			if not pl:HasWeapon("weapon_bugbait") then
				pl:Give("weapon_bugbait")
				pl:ChatPrint("[Lucky Ball] Вы получили Bugbait бесплатно... если только у вас нет домашнего муравьиного льва!")
			else
				pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			end
		end,
		 function(pl)  -- Change hunter model to player mdl as a joke
			 if not (pl:GetModel() == "models/player.mdl") then
				 pl:ChatPrint("[Lucky Ball] Я видел это однажды. player.mdl однажды отомстит. -D4")
				 pl:SetModel("models/player.mdl")
				 pl:SendLua("PHX:SetGlimpCam(CurTime()+3)")
			 else
				 pl:ChatPrint(PHX.LUCKY_BALL:RandomiseText())
			 end
		 end,
		 function(pl)  -- This is a fun little reference to staging
			for _, plph in ipairs(player.GetAll()) do
				if plph:SteamID() == "STEAM_0:0:49332102" && plph:Alive() && plph:Team() == TEAM_HUNTERS then
					pl:ChatPrint("[Lucky Ball] Вы поставили "..plph:Name().." на сцену.")
					plph:SendLua("PHX:SetGlimpCam(CurTime()+10)")
					plph:SendLua("RunConsoleCommand(\"act\",\"dance\")")
					plph:EmitSound("taunts/props/hardbass.wav", 90)
				end
			end
		 end,
		function(pl)
			local thebomb = { "taunts_phx/2/prop_hunt_x_originals/deus_ex_the_bomb.wav", "taunts_phx/2/prop_hunt_x_originals/deus_ex_the_bomb_jock.wav" }
			local suicidebomb = ents.Create("combine_mine")
			suicidebomb:SetPos(Vector(pl:GetPos()))
			suicidebomb:SetAngles(Angle(0,0,0))
			suicidebomb:Spawn()
			suicidebomb:Activate()
			suicidebomb:SetOwner(pl)
			pl:ChatPrint("[Lucky Ball] О Боже мой, ДжейСи, БОМБА!")
			suicidebomb:EmitSound( thebomb[math.random(1, #thebomb)] )
		end
	},
	
	ItemMessages = {
		"Троллинг — это искусство",
		"0 8 1 3 - 6 9 2 8",
		"ЗАТКНИСЬ, МЕДСЕСТРА!!",
		"Рыба в колпачке.",
		"Рядом крутится голубой волчок (если бы он был здесь)",
		"Он смеётся всякий раз, когда видит движущийся объект/охотника или находит отличное укрытие.",
		"\'Он однажды играл в этот режим и больше никогда. Или, возможно, кто-то его сломал, лол.\'",
		"Голубой волчок пытался плавать в лаве, добывая алмаз.",
		"Uncharted: игра внутри игры.",
		"Смотри, мам! Я же сказал, смотри! Я на вершине мира... снова!",
		"Он терпеливо ждёт более 400 лет, чтобы внести изменения.",
		"Джон Фримен — брат Гордона Фримена!",
		"Джон Фримен заглянул под землю и нашёл ОРУЖИЕ!",
		"Когда вы отправитесь в космос, внутри \'ящика\' спрятан кристалл.",
		"Так причудливо! Даже люди в \'том\' доме не заметили, что там 5 кнопок и немного дорито!",
		"ГДЕ КУЗНЕЦ?!",
		"Какой позор.",
		"Я об этом не просил.",
		"Осознание того, что эти удачные шары дадут вам что-то хорошее, наполняет вас решимостью.",
		"ТАБЛЕТКИ ЗДЕСЬ!",
		"Сила Пушистого Мальчика сияет внутри вас!",
		"На самом деле этот парень \'чокнутый\'. Он живёт в замке и... у него голова в форме \'лопаты\'.",
		"Вы идёте на Поле, где можно найти свои Мечты и Надежды~",
		"Есть две игры с похожими персонажами, которые могут устроить ХАОС.",
		"Ей очень-очень нравится есть мел.",
		":3",
		"Помните то время, когда GMod использовался для хороших анимационных видео, YTP, флэшмобов и т.д....",
		"Вот немного текста, чтобы вы чем-то занялись.",
		"Вы видели Бананочеловека?",
		"Несмотря на множество отсутствующих текстур, просто помните: \'Митчелл\' — бесполезный парень, и игра тоже.", -- Pfftt, ok I'm done with HDTF.
		"Однажды я видел человека с зелёными гнойными глазами.",
		"Однажды я видел человека с розовыми усами.",
		"Был Обсидиан, и у него был Конфликт.",
		"Нам всем в жизни немного не хватает Синергии.",
		"Присутствие наблюдает за вами",
		"sudo apt-get moo",
		"\"Вы сегодня мычали?\"",
		"Кто-то мог бы хорошо выступить на сцене, нам просто нужно его найти.",
		"Вы можете \"Объединить\" \"Башню\" людей, если сделаете это правильно.",
		"Самая короткая однопользовательская кампания из когда-либо созданных!",
		"Мы живём в 2077 году, где все глючат",
		"Трилогия Окончательное издание? Вы имеете в виду Трилогия **Бракованное** издание?",
		"Клянусь, я делал это не с помощью ИИ, или я? *Легендарная тема VSauce*",
		"Клэйс — розовый хаски. Такой розовый~",
		"Большая отсылка. Мелкие детали.", -- This is 100% a reference! Think!
		"*Замечает* Что это? OwO",
		"Lucky Ball: Я люблю тебя~! <3", -- LOL
		"Так много нужно сделать, так мало времени.", -- That was the rest of those fallen text additions - Nice!
		"Вы не осознаёте, что (почти) всё это были пасхалки? :P"
	},
}

function PHX.LUCKY_BALL:RandomiseText()
	return self.ItemMessages[math.random(1, #self.ItemMessages)]
end

--[[
Base Lucky Balls Functions. 
Please note that you might have to create a custom serverside lua with full of function list with list.Set into "LuckyBallsAddition".
	Example:
	
	list.Set("LuckyBallsAddition", "UniqueName", function(pl,ball)
		-- code...
	end)
	
Keep in note that UniqueName should be unique and different. Otherwise will cause some confusion with PHX.VerboseMsg!
]]
function PHX.LUCKY_BALL:AddMoreLuckyEvents()
	local t = list.Get("LuckyBallsAddition")
	if !table.IsEmpty(t) then
		for name,tab in pairs(t) do
			PHX.VerboseMsg("[PHX: Lucky Ball] Adding new events : "..name)
			table.insert(self.Items, tab)
		end
	else
		PHX.VerboseMsg("[PHX: Lucky Ball] There is no additional events detected, skipping...")
	end
end

PHX.LUCKY_BALL:AddMoreLuckyEvents()

hook.Add("PH_RoundEnd", "PHX.DestroyLuckys", function()
	timer.Simple(0.1, function()
		for _,lb in ipairs(ents.FindByClass("ph_luckyball")) do
			lb:ShowEffects(lb, "cball_explode", lb:GetPos(), lb:GetPos())
			lb:Remove()
		end
	end)
end)


--------------[[ DEVIL BALL ]]--------------

PHX.DEVIL_BALL = {
	Items = {
		function(pl)
			if !pl.ph_fastspeed then
				if !pl._OriginalWSpeed then pl._OriginalWSpeed = pl:GetWalkSpeed() end
				
				pl:ChatPrint("[Кристалл дьявола] Вы получили ускорение!")
				pl:SendLua("surface.PlaySound('prop_idbs/speedup.wav')")
				pl:SetWalkSpeed( pl:GetWalkSpeed() + 100 )
				pl.ph_fastspeed = true
				pl.RevertWalk = timer.Simple(math.random(4,12), 
				function()
					pl:ChatPrint("[Кристалл дьявола] ускорение закончилось...")
					pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
					pl:SetWalkSpeed( pl._OriginalWSpeed )
					pl.ph_fastspeed = false
				end)
			end
		end,
		function(pl)
			local rand = math.random(10,50)
			pl:AddHealthProp( rand )
			pl:ChatPrint("[Кристалл дьявола] Вылечено +"..tostring(rand).." HP (вместе с вашими объектами)!")
		end,
		function(pl)
			local rand
			rand = math.random(20,60)
			local allow = PHX:GetCVar( "ph_allow_armor" )
			if allow then
				pl:SetArmor(pl:Armor() + rand)
				pl:ChatPrint("[Кристалл дьявола] Вы получили новые очки брони +"..tostring(rand).."!")
			end
		end,
		function(pl)
			if !pl.ph_slowspeed then
				if !pl._OriginalWSpeed then pl._OriginalWSpeed = pl:GetWalkSpeed() end
				
				pl:ChatPrint("[Кристалл дьявола] О нет, вы замедляетесь!")
				pl:SendLua("surface.PlaySound('prop_idbs/slowdown.wav')")
				pl:SetWalkSpeed( pl:GetWalkSpeed() - 100 )
				pl.ph_slowspeed = true
				pl.RevertWalk = timer.Simple(math.random(4,12), 
				function()
					pl:ChatPrint("[Кристалл дьявола] замедление закончилось...")
					pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
					pl:SetWalkSpeed( pl._OriginalWSpeed )
					pl.ph_slowspeed = false
				end)
			end
		end,
		function(pl)
			local HunterPlayers = team.GetPlayers(TEAM_HUNTERS)
		
			--if table.Count(HunterPlayers) >= 2 then
				pl:ChatPrint("[Кристалл дьявола] Охотники заморожены!")
				pl:PrintCenter( "Охотники заморожены!", Color(153,217,234) )
				pl:SendLua("surface.PlaySound('prop_idbs/surface_prop_froze_hunter.wav')")
				for _,v in ipairs( HunterPlayers ) do
					if v:Alive() then
						v:Freeze(true)
						v:EmitSound(Sound("prop_idbs/govarchz_pickup.wav"))
						v:ChatPrint("[Кристалл дьявола] О нет! Вы временно заморожены!")
						timer.Simple(math.random(2,3), function()
							if IsValid(v) then
								v:ChatPrint("[Кристалл дьявола] Теперь вы разморожены!")
								v:EmitSound(Sound("prop_idbs/froze_done.wav"))
								v:Freeze(false)
							end
						end)
					end
				end
			--end
		end,
		function(pl)
			local nade = ents.Create("npc_grenade_frag")
			local pos = pl:GetPos()
			nade:SetPos(Vector( pos.x, pos.y, pos.z+8 ))
			nade:SetAngles(Angle(0,0,0))
			nade:Spawn()
			nade:Activate()
			
			nade:Fire("SetTimer","3",0)
			timer.Simple(0.1, function()
				nade:SetOwner(pl)
				nade:SetSaveValue( "m_hThrower", pl )
				nade:SetSaveValue( "m_flDamage", 90 )
			end)
			
			pl:ChatPrint("[Шар дьявола] Под вами появилась граната — бросьте её в охотников!")
		end,
		function(pl, ent)
			  if !pl.has_uniqueitem then		  
				local item = math.random(1,#PHX.DEVIL_BALL.PropRevenge)
				local name = PHX.DEVIL_BALL.PropRevenge[item].name
				
				pl.has_uniqueitem 	 = true
				pl.prop_revenge_item = item
				
				pl.itemshootcount 	= 0
				pl.tmr_item 		= "shootF"..pl:EntIndex()
				pl.tmr_itemnotice 	= "ld.Fnotice"..pl:EntIndex()
				
				local failsafe = pl.tmr_itemnotice
				
				-- NEED OPTIMIZATION --
				local msg = "LD_PRESS2SHOOT" --"Press [%s] to shoot %s !"
				local btn = PHX:SVTranslate(pl, "LD_RIGHTCLICK") --"RIGHT CLICK"
				if pl:IsLastStanding() then btn = PHX:SVTranslate(pl, "LD_MIDCLICK") end --"MIDDLE CLICK"
				-- NEED OPTIMIZATION --
				
				pl:PrintMessage(HUD_PRINTCENTER, PHX:SVTranslate( pl, msg, btn, name ))
				timer.Create(pl.tmr_itemnotice, 3, 0, function()
					if IsValid(pl) and pl:Alive() then
						-- NEED OPTIMIZATION --
						btn = PHX:SVTranslate(pl, "LD_RIGHTCLICK")
						if pl:IsLastStanding() then btn = PHX:SVTranslate(pl, "LD_MIDCLICK") end
						-- NEED OPTIMIZATION --
						pl:PrintMessage(HUD_PRINTCENTER, PHX:SVTranslate( pl, msg, btn, name ))
					else
						print("[PHX Devil Crystal] Removing Timer '" .. failsafe .. "' because player was dead or disconnected!")
						timer.Remove(failsafe)
					end
				end)
				
				pl:ChatPrint("[Шар дьявола] У вас в руках ".. name .."! Направьте на охотников, чтобы нанести урон!")
			  end
		end,
		function(pl)
			if !pl.ph_cloacking then
				pl:ChatPrint("[Кристалл дьявола] Невидимость...")
				pl:SendLua("surface.PlaySound('prop_idbs/cloak.wav')")
				pl.ph_prop:DrawShadow(false)
				pl.ph_prop:SetMaterial("models/effects/vol_light001")
				pl.ph_cloacking = true
				pl.RevertMaterial = timer.Simple(math.random(5,15),
				function()
					pl:ChatPrint("[Кристалл дьявола] невидимость закончилась...")
					pl:SendLua("surface.PlaySound('prop_idbs/generic_exhaust.wav')")
					if pl.ph_prop and IsValid(pl.ph_prop) then
						pl.ph_prop:DrawShadow(true)
						pl.ph_prop:SetMaterial("")
						pl.ph_cloacking = false
					end
				end)
			end
		end
	}
}

PHX.DEVIL_BALL.PropRevenge = {
	{
		name	= "Дротикомёт",
		func	= function(pl, max)
			local safefail = pl.tmr_item
			timer.Create(pl.tmr_item, 0.1, max, function()
				
				if IsValid(pl) and pl:Alive() then
					local Forward = pl:EyeAngles():Forward()
					pl:EmitSound( Sound( "NPC_Hunter.FlechetteShoot" ) )
					
					local f = ents.Create("hunter_flechette")
					if (IsValid(f)) then
						f:SetPos( pl:GetShootPos() + Forward * 32 )
						f:SetAngles( pl:EyeAngles() )
						f:Spawn()
						f:SetVelocity( Forward * 2000 )
						f:SetOwner(pl)
					end
					
					pl.itemshootcount = pl.itemshootcount + 1
					if pl.itemshootcount >= max then
						timer.Remove(pl.tmr_item)	-- immediately clear timer.
						PHX.DEVIL_BALL:ResetPlayerStuff(pl)
					end
				elseif !pl:Alive() then
					print("[PHX Devil Crystal] Removing Timer '" .. pl.tmr_item .. "' because player was dead!")
					timer.Remove(pl.tmr_item)
					print("[PHX Devil Crystal] Unsetting parameters on dead player.")
					PHX.DEVIL_BALL:ResetPlayerStuff(pl)
				else
					print("[PHX Devil Crystal] Removing Timer '" .. safefail .. "' because player was disconnected!")
					timer.Remove(safefail)
					-- ResetPlayerStuff will be invalid here.
				end
			
			end)
		end
	},
	{
		name	= "Гранатомёт",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "NPC_Combine.GrenadeLaunch" ) )
				
				local g = ents.Create("grenade_ar2")
				if (IsValid(g)) then
					g:SetPos( pl:GetShootPos() + Forward * 32 )
					g:SetAngles( pl:EyeAngles() )
					g:SetMoveType( MOVETYPE_FLYGRAVITY )
					g:SetMoveCollide( MOVECOLLIDE_FLY_BOUNCE )
					g:Spawn()
					g:SetVelocity( Forward * 1000 )
					g:SetLocalAngularVelocity(Angle(math.random(-400,400),math.random(-400,400),math.random(-400,400)))
					g:SetSaveValue("m_flDamage", 75)	-- Original: sk_plr_dmg_smg1_grenade = 100. 100 is already OP!
					g:SetOwner(pl)
				end
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
	{
		name	= "РПГ",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "Weapon_RPG.Single" ) )
				
				local r = ents.Create("rpg_missile")
				if (IsValid(r)) then
					r:SetPos( pl:GetShootPos() + Forward * 32 )
					r:SetAngles( pl:EyeAngles() )
					r:Spawn()
					r:SetVelocity( Forward * 300 + Vector(0, 0, 128) )
					r:SetSaveValue("m_flDamage", 75)	-- Original: sk_plr_dmg_rpg = 100. 100 is already OP!
					r:SetOwner(pl)
				end
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
	{
		name	= "Пускатель объектов",
		func	= function(pl, _)
			if pl:Alive() then
				local Forward = pl:EyeAngles():Forward()
				pl:EmitSound( Sound( "prop_idbs/yeet_"..math.random(1,3)..".mp3" ), 80 )
				
				local ph = pl:GetPlayerPropEntity()
				if ph and IsValid(ph) then
				
					local r = ents.Create("prop_physics")
					if (IsValid(r)) then
						r:SetModel( ph:GetModel() )
						r:SetPos( pl:GetShootPos() + Forward * 32 )
						r:SetAngles( pl:EyeAngles() )
						r:SetKeyValue( "physdamagescale", "200" )
						r:SetKeyValue( "nodamageforces", "1" )
						
						r:Spawn()
						r:Activate()
						
						r:SetOwner(pl)
						r:SetPhysicsAttacker(pl, 5)
						
						r._PropTrash = true
						
						local phy = r:GetPhysicsObject()
						if IsValid(phy) then 
							phy:SetMass(200)
							phy:SetVelocity( Forward * 640 + Vector(0, 0, 128) )
						end
						
						SafeRemoveEntityDelayed( r, math.random(6,10) )
						
					end

				end
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
				
			else
				PHX.DEVIL_BALL:ResetPlayerStuff(pl)	-- keep this always called!
			end
		end
	},
}

function PHX.DEVIL_BALL:ResetPlayerStuff(pl)
	pl.tmr_item			 	= nil
	pl.tmr_itemnotice 	 	= nil
	pl.prop_revenge_item	= nil
	pl.itemshootcount 		= 0
	pl.has_uniqueitem 		= false
	pl.has_uniqueitem_shoot = false
end

--[[
Base Devil Balls Functions. 
Please note that you might have to create a custom serverside lua with full of function list with list.Set into "DevilBallsAddition".
	Example:
	
	list.Set("DevilBallsAddition", "UniqueName", function(pl,ball)
		-- code...
	end)
	
Keep in note that UniqueName should be unique and different. Otherwise will cause some confusion with PHX.VerboseMsg!
]]
function PHX.DEVIL_BALL:AddMoreLuckyEvents()
	local t = list.Get("DevilBallsAddition")
	if !table.IsEmpty(t) then
		for name,tab in pairs(t) do
			PHX.VerboseMsg("[PHX: Devil Crystal] Adding new events: "..name)
			table.insert(self.Items, tab)
		end
	else
		PHX.VerboseMsg("[PHX: Devil Crystal] There is no additional events detected, skipping...")
	end
end

PHX.DEVIL_BALL:AddMoreLuckyEvents()

-- Hooks
local function ResetEverything()
	for _,v in ipairs(player.GetAll()) do
		if IsValid(v) then
			v.ph_cloacking		= false
			v.ph_slowspeed		= false
			v.ph_fastspeed		= false
			
			-- force remove timer
			if v.tmr_item and v.tmr_item ~= nil then timer.Remove(v.tmr_item); v.tmr_item = nil; end
			if v.tmr_itemnotice and v.tmr_itemnotice ~= nil then timer.Remove(v.tmr_itemnotice); v.tmr_itemnotice = nil; end
			v.tmr_item				= nil
			v.tmr_itemnotice		= nil
			
			v.prop_revenge_item		= nil
			v.itemshootcount		= 0
			v.has_uniqueitem		= false
			v.has_uniqueitem_shoot	= false
			
			if v:Alive() then
				if v:Team() == TEAM_PROPS && v._OriginalWSpeed then v:SetWalkSpeed(v._OriginalWSpeed) end
				if v:Team() == TEAM_PROPS && v.ph_prop:GetMaterial() then v.ph_prop:DrawShadow(true); v.ph_prop:SetMaterial(""); end
				if v:IsFrozen() then v:Freeze(false) end
			end
		end
	end
	
	-- Remove Prop Trash
	for _,p in ipairs(ents.FindByClass('prop_physics')) do
		if IsValid(p) and (p._PropTrash) then p:Remove() end
	end
end

hook.Add("PH_RoundEnd", "PHX.DestroyDevils", function()
	ResetEverything()
	
	timer.Simple(0.1, function()
		for _,cr in ipairs(ents.FindByClass("ph_devilball")) do
			cr:ShowEffects(cr, "GlassImpact", cr:GetPos(), cr:GetPos())
			cr:Remove()
		end
	end)
end)

local function DoPropRevenge( pl, amount )
	if !pl.has_uniqueitem then return end
	if pl.has_uniqueitem_shoot then return end
	if !pl.prop_revenge_item or pl.prop_revenge_item == nil or pl.prop_revenge_item == 0 then return end
	
	local max = 1
	if !amount or amount == nil or amount < 1 then max = 1 end
	max = amount
	
	if IsValid(pl) then
		if pl.has_uniqueitem and !pl.has_uniqueitem_shoot then
			pl.has_uniqueitem_shoot = true
			timer.Remove(pl.tmr_itemnotice)
			PHX.DEVIL_BALL.PropRevenge[pl.prop_revenge_item].func(pl, max)
		end
	end
end

hook.Add("PlayerButtonDown", "PHX.PlayerPropDoRevenge", function(pl, key)
	if GAMEMODE:InRound() and pl:Alive() and pl:Team() == TEAM_PROPS then
		
		if ((pl:IsLastStanding() and key == MOUSE_MIDDLE) or (!pl:IsLastStanding() and key == MOUSE_RIGHT)) and
			(pl.prop_revenge_item) and pl.prop_revenge_item > 0 and 
			(pl.has_uniqueitem) and !pl.has_uniqueitem_shoot then
			
			DoPropRevenge(pl, math.random(6,10))	-- 2nd argument is only for flechette.
			
		end
		
	end
end)