--[[--------------------------------------------------
	Copyright (c) 2019 by Cpt. Hazama, All rights reserved.
	Nothing in these files or/and code may be reproduced, adapted, merged or
	modified without prior written consent of the original author, Cpt. Hazama
--------------------------------------------------]]--
include('server/cpt_utilities.lua')
include('client/cpt_scp_vision.lua')
include('cpt_scp_map.lua')

-- if !CPTBase.IsAddonUpdated("cptbase","54") then return end

CPTBase.RegisterMod("SCP:CB SNPCs","0.2.1")
-- CPTBase.AddAddon("scp","10")

CPTBase.DefineDecal("SCP_PDCorrosion",{"decals/decalpd3"})
-- CPTBase.DefineDecal("SCP_457Scorch",{"decals/decal_footprint_scorch"})
CPTBase.AddParticleSystem("particles/cpt_scp_pocketdimension.pcf",{})
CPTBase.AddParticleSystem("particles/DOOR_EXPLOSION.pcf",{})

local category = "SCP:CB"
-- CPTBase.AddNPC("SCP-106 (Isolation)","npc_cpt_scpiso_106",category)
CPTBase.AddNPC("SCP-173 (Isolation)","npc_cpt_scpiso_173",category)
CPTBase.AddAdminNPC("SCP-303 (Isolation)","npc_cpt_scpiso_303",category)
CPTBase.AddNPC("SCP-650 (Isolation)","npc_cpt_scpiso_650",category)

CPTBase.AddNPC("(Classic) SCP-008-1","npc_cpt_scp_008_1_old",category)
CPTBase.AddNPC("(Classic) SCP-096","npc_cpt_scp_096_old",category)
CPTBase.AddNPC("(Classic) SCP-106","npc_cpt_scp_106_old",category)
CPTBase.AddNPC("(Classic) SCP-173","npc_cpt_scp_173_old",category)
CPTBase.AddNPC("(Classic) MTF Guard","npc_cpt_scp_guard_old",category)

CPTBase.AddAdminNPC("SCP-005","npc_cpt_scp_005",category)
CPTBase.AddAdminNPC("SCP-008","npc_cpt_scp_008",category)
CPTBase.AddNPC("SCP-008-1","npc_cpt_scp_008_1",category)
CPTBase.AddAdminNPC("SCP-012","npc_cpt_scp_012",category)
CPTBase.AddNPC("SCP-035","npc_cpt_scp_035",category)
CPTBase.AddNPC("SCP-049","npc_cpt_scp_049",category)
CPTBase.AddNPC("SCP-049-2","npc_cpt_scp_049_2",category)
CPTBase.AddNPC("SCP-049-2 Soldier","npc_cpt_scp_049_2_ntf",category)
CPTBase.AddNPC("SCP-066","npc_cpt_scp_066",category)
CPTBase.AddAdminNPC("SCP-079","npc_cpt_scp_079",category)
CPTBase.AddAdminNPC("SCP-079 Camera","ent_cpt_scp_camera",category)
CPTBase.AddNPC("SCP-087-1","npc_cpt_scp_087_1",category)
CPTBase.AddNPC("SCP-087-B","npc_cpt_scp_087_b",category)
CPTBase.AddNPC("SCP-096","npc_cpt_scp_096",category)
CPTBase.AddNPC("SCP-106","npc_cpt_scp_106",category)
CPTBase.AddAdminNPC("SCP-106 Pocket Dimension Plane","npc_cpt_scp_106pdplane",category)
CPTBase.AddNPC("SCP-173","npc_cpt_scp_173",category)
-- CPTBase.AddNPC("SCP-173 (Box)","npc_cpt_scp_173_box",category) -- Shouldn't be spawnable
CPTBase.AddNPC("SCP-178","npc_cpt_scp_178specs",category)
CPTBase.AddNPC("SCP-178-1","npc_cpt_scp_178",category)
-- CPTBase.AddNPC("SCP-205","npc_cpt_scp_205",category) -- Stupid
-- CPTBase.AddNPC("SCP-205-A","npc_cpt_scp_205a",category)
-- CPTBase.AddNPC("SCP-205-B","npc_cpt_scp_205b",category)
-- CPTBase.AddNPC("SCP-205-C","npc_cpt_scp_205c",category)
-- CPTBase.AddNPC("SCP-205-D","npc_cpt_scp_205d",category)
CPTBase.AddNPC("SCP-372","npc_cpt_scp_372",category) -- Should this even be here lol
CPTBase.AddNPC("SCP-420-J","npc_cpt_scp_420",category)
CPTBase.AddNPC("SCP-427","npc_cpt_scp_427",category)
CPTBase.AddNPC("SCP-457","npc_cpt_scp_457",category)
CPTBase.AddNPC("SCP-500","npc_cpt_scp_500",category)
CPTBase.AddNPC("SCP-513","npc_cpt_scp_513",category)
-- CPTBase.AddNPC("SCP-513-1","npc_cpt_scp_513_1",category) -- Shouldn't be spawnable
CPTBase.AddNPC("SCP-575","npc_cpt_scp_575",category)
CPTBase.AddNPC("SCP-650","npc_cpt_scp_650",category)
CPTBase.AddAdminNPC("SCP-682","npc_cpt_scp_682",category)
CPTBase.AddNPC("SCP-714","npc_cpt_scp_714",category)
CPTBase.AddNPC("SCP-860-2","npc_cpt_scp_860",category)
CPTBase.AddNPC("SCP-895","npc_cpt_scp_895",category)
CPTBase.AddNPC("SCP-939 (Instance A)","npc_cpt_scp_939_a",category)
CPTBase.AddNPC("SCP-939 (Instance B)","npc_cpt_scp_939_b",category)
CPTBase.AddNPC("SCP-939 (Instance C)","npc_cpt_scp_939_c",category)
CPTBase.AddNPC("SCP-966","npc_cpt_scp_966",category)
CPTBase.AddNPC("SCP-1025","npc_cpt_scp_1025",category)
CPTBase.AddNPC("SCP-1048","npc_cpt_scp_1048",category)
CPTBase.AddNPC("SCP-1123","npc_cpt_scp_1123",category)
CPTBase.AddNPC("SCP-1356","npc_cpt_scp_1356",category)
CPTBase.AddNPC("SCP-1499-1","npc_cpt_scp_1499_1",category)
CPTBase.AddNPC("SCP-1499-1 King","npc_cpt_scp_1499_1_king",category)

-- CPTBase.AddNPC("MTF Guard","npc_cpt_scp_guard",category)
CPTBase.AddNPC("MTF Epsilon-11 Nine-Tailed Fox","npc_cpt_scp_ntf",category)
CPTBase.AddNPC("MTF Lambda-5 White Rabbits","npc_cpt_scp_lambda",category)
CPTBase.AddNPC("MTF Nu-7 Hammer Down","npc_cpt_scp_nu",category)
CPTBase.AddAdminNPC("MTF AH-64 Apache","npc_cpt_scp_apache",category)

CPTBase.AddNPC("Class D Subject","npc_cpt_scp_dclass",category)
CPTBase.AddNPC("Scientist","npc_cpt_scp_scientist",category) -- STAHP! NO!

CPTBase.AddNPC("Nightvision Goggles","ent_cpt_scp_nightvision",category) -- The object itself isn't a NPC but technically speaking, it is a NPC since well, it's running on my SNPC base

hook.Add("OnNPCKilled","CPTBase_SCP079_KillPoints",function(victim,inflictor,killer)
	local canRun = false
	local SCP = NULL
	if not killer.CPTBase_NPC then return end
	if killer == victim then return end
	for _,v in ipairs(ents.GetAll()) do
		if v:IsNPC() && v:GetClass() == "npc_cpt_scp_079" then
			canRun = true
			SCP = v
			break
		end
	end
	if canRun then
		if table.Count(SCP.tbl_LockedDoors) > 0 then
			for _,v in ipairs(SCP.tbl_LockedDoors) do
				if victim:GetPos():Distance(v:GetPos()) <= 450 then
					SCP.ExperiencePoints = SCP.ExperiencePoints +15
					break
				end
			end
		end
	end
end)

hook.Add("PlayerDeath","CPTBase_SCP079_KillPoints_Player",function(victim,inflictor,killer)
	local canRun = false
	local SCP = NULL
	if not killer.CPTBase_NPC then return end
	if killer == victim then return end
	for _,v in ipairs(ents.GetAll()) do
		if v:IsNPC() && v:GetClass() == "npc_cpt_scp_079" then
			canRun = true
			SCP = v
			break
		end
	end
	if canRun then
		if table.Count(SCP.tbl_LockedDoors) > 0 then
			for _,v in ipairs(SCP.tbl_LockedDoors) do
				if victim:GetPos():Distance(v:GetPos()) <= 450 then
					SCP.ExperiencePoints = SCP.ExperiencePoints +15
					break
				end
			end
		end
	end
end)

hook.Add("PlayerUse","CPTBase_SCP005",function(ply,ent)
	if not ply.SCP_Has005 then return end
	if ply.SCP_NextUnlockDoorT == nil then ply.SCP_NextUnlockDoorT = 0 end
	if CurTime() > ply.SCP_NextUnlockDoorT && ent:IsValid() && string.find(ent:GetClass(),"door") && string.find(ent:GetSequenceName(ent:GetSequence()),"locked") then
		ent:Fire("Unlock")
		ply:ChatPrint("Door unlocked with SCP-005")
		ply:ChatPrint("SCP-005 cooldown time is 3 seconds")
		ent:EmitSound("doors/default_locked.wav",70,100)
		ply.SCP_NextUnlockDoorT = CurTime() +3
	end
end)

	-- Custom Functions --
local NPC_Meta = FindMetaTable("NPC")
SCP_GlobalNTFCoolDown = 0
SCP_SightAngle = 50
SCP_DoorOpenDistance = 100

hook.Add("PlayerDeath","CPTBase_SCP_DeathData",function(ply)
	-- if CLIENT then
		ply:SetNWBool("SCP_HasNightvision",false)
		ply:SetNWBool("SCP_IsBeingDrained",false)
		ply:SetNWBool("SCP_Has178",false)
		ply:SetNWBool("SCP_895Horror",false)
		ply:SetNWString("SCP_895HorrorID",nil)
		ply:SetNWBool("SCP_IsBlinking",false)
		ply:SetNWBool("SCP_Touched1123",false)
		ply:SetNWBool("SCP_Touched1123_Horror",false)
		ply:SetNWInt("SCP_BlinkTime",CurTime() +math.random(4,7))
		ply:SetNWInt("SCP_LastBlinkAmount",0)
		CLIENT_SCP_NV = false
	-- end
end)

hook.Add("OnEntityCreated","CPTBase_SCP_SpawnData_NPCs",function(ent)
	if not ent:IsNPC() then return end
	ent.SCP_Infected_008 = false
	ent.SCP_IsBlinking = false
	ent.SCP_BlinkTime = CurTime() + math.random(4,7)
end)

hook.Add("Think","CPTBase_SCP_ZombieDeathFollow",function()
	for _,v in ipairs(player.GetAll()) do
		if v:Alive() then return end
		if not IsValid(v.CPTBase_SCP_Zombie) then return end
		-- v:SetPos(v.CPTBase_SCP_Zombie:GetPos() +v.CPTBase_SCP_Zombie:OBBCenter())
		if v.SCP_SpawnedZombieEntity == false then
			v.SCP_ZombieEntity = ents.Create("prop_dynamic")
			v.SCP_ZombieEntity:SetPos(v.CPTBase_SCP_Zombie:GetPos() +v.CPTBase_SCP_Zombie:OBBCenter())
			v.SCP_ZombieEntity:SetModel("models/props_junk/watermelon01_chunk02c.mdl")
			v.SCP_ZombieEntity:SetParent(v.CPTBase_SCP_Zombie)
			v.SCP_ZombieEntity:SetRenderMode(RENDERMODE_TRANSALPHA)
			v.SCP_ZombieEntity:Spawn()
			v.SCP_ZombieEntity:SetColor(Color(0,0,0,0))
			v.SCP_ZombieEntity:SetNoDraw(false)
			v.SCP_ZombieEntity:DrawShadow(false)
			v.SCP_ZombieEntity:DeleteOnRemove(v.CPTBase_SCP_Zombie)
			v.SCP_SpawnedZombieEntity = true
		end
		if IsValid(v.SCP_ZombieEntity) then
			v:Spectate(OBS_MODE_CHASE)
			v:SpectateEntity(v.SCP_ZombieEntity)
			v:SetMoveType(MOVETYPE_OBSERVER)
		end
	end
end)

hook.Add("PlayerSpawn","CPTBase_SCP_SpawnData",function(ply)
	if CLIENT then
		ply:SetNWBool("SCP_HasNightvision",false)
		ply:SetNWBool("SCP_IsBeingDrained",false)
		ply:SetNWBool("SCP_Has178",false)
		ply:SetNWBool("SCP_895Horror",false)
		ply:SetNWString("SCP_895HorrorID",nil)
		ply:SetNWBool("SCP_IsBlinking",false)
		ply:SetNWBool("SCP_Touched1123",false)
		ply:SetNWBool("SCP_Touched1123_Horror",false)
		ply:SetNWInt("SCP_BlinkTime",CurTime() +math.random(4,7))
		ply:SetNWInt("SCP_LastBlinkAmount",0)
	end
	ply.SCP_Infected_008 = false
	ply.SCP_Infected_049 = false
	ply.SCP_Inflicted_1048a = false
	ply.SCP_Disease_LungCancer = false
	ply.SCP_Disease_Appendicitis = false
	ply.SCP_Disease_CommonCold = false
	ply.SCP_Disease_Chickenpox = false
	ply.SCP_Disease_Asthma = false
	ply.SCP_Disease_CardiacArrest = false
	ply.SCP_Has714 = false
	ply.SCP_Has427 = false
	ply.SCP_Has005 = false
	ply.SCP_NextUse1123T = CurTime()
	ply.SCP_Using420 = false
	ply.CPTBase_SCP_Zombie = NULL
	ply.SCP_SpawnedZombieEntity = false
end)

hook.Add("Think","CPTBase_SCP_BlinkSystem_NPCs",function()
	local canevenblink = false
	for _,scp in ipairs(ents.GetAll()) do
		if scp:IsNPC() && (string.find(scp:GetClass(),"173") or string.find(scp:GetClass(),"087_b")) then
			canevenblink = true
		end
	end
	if canevenblink == false then return end
	local tb = {}
	for _,v in ipairs(ents.GetAll()) do
		if v:IsNPC() && !(string.find(v:GetClass(),"173") or string.find(v:GetClass(),"087_b")) && v:Health() > 0 then
			if !table.HasValue(tb,v) then
				table.insert(tb,v)
			end
		end
	end
	for i = 0, table.Count(tb) do
		if tb[i] != nil && IsValid(tb[i]) then
			if tb[i].SCP_BlinkTime == nil then tb[i].SCP_BlinkTime = CurTime() +1 end
			if tb[i].SCP_IsBlinking == nil then tb[i].SCP_IsBlinking = false end
			if tb[i]:GetClass() == "npc_cpt_scp_ntf" then
				timer.Simple(math.Round(tb[i].SCP_BlinkTime -CurTime()) -0.8,function()
					if not IsValid(tb[i]) then return end
					if tb[i].SCP_IsBlinking == true then return end
					if tb[i].SCP_BeforeBlinking then
						tb[i]:SCP_BeforeBlinking()
					end
				end)
			end
			if CurTime() > tb[i].SCP_BlinkTime && tb[i].SCP_IsBlinking == false then
				tb[i].SCP_IsBlinking = true
				if tb[i].SCP_IsBlinking == false then return end
				timer.Simple(0.5,function()
					if not tb[i]:IsValid() then return end
					if tb[i].SCP_IsBlinking == false then return end
					tb[i].SCP_IsBlinking = false
					local time = math.random(5,9)
					if GetConVarNumber("cpt_scp_173blinksame") == 1 then
						time = 5
					end
					tb[i].SCP_BlinkTime = CurTime() +time
				end)
			end
		end
	end
end)

hook.Add("Think","CPTBase_SCP_BlinkSystem",function()
	if GetConVarNumber("ai_ignoreplayers") ~= 0 then return end
	local canevenblink = false
	local scps = {}
	for _,scp in ipairs(ents.GetAll()) do
		if scp:IsNPC() && (string.find(scp:GetClass(),"173") or string.find(scp:GetClass(),"087_b")) then
			canevenblink = true
			if !table.HasValue(scps,scp) then
				table.insert(scps,scp)
			end
		end
	end
	local function AllSCPs(ply)
		for _,v in ipairs(scps) do
			if not IsValid(v) then return end
			if v:Visible(ply) then
				return true
			else
				return false
			end
		end
	end
	if canevenblink == false then return end
	local tb = {}
	for _,v in ipairs(player.GetAll()) do
		if v:IsPlayer() then
			if !table.HasValue(tb,v) then
				table.insert(tb,v)
			end
		end
	end
	for i = 0, table.Count(tb) do
		if tb[i] != nil then
			if tb[i] == nil then return end
			if tb[i]:GetNWBool("CPTBase_IsPossessing") == true then return end
			if tb[i].IsPossessing == true then return end
			if not tb[i]:Alive() then return end
			if CurTime() <= tb[i]:GetNWInt("SCP_BlinkTime") then return end
			if tb[i]:GetNWBool("SCP_IsBlinking") == true then return end
			if AllSCPs(tb[i]) then
				local deaths = tb[i]:Deaths()
				if tb[i]:Deaths() > deaths then return end
				tb[i]:SetNWBool("SCP_IsBlinking",true)
				if tb[i]:GetNWBool("SCP_IsBlinking") == false then return end
				timer.Simple(0.5,function()
					if not tb[i]:IsValid() then return end
					if not tb[i]:Alive() then return end
					tb[i]:SetNWBool("SCP_IsBlinking",false)
					local time = math.random(5,9)
					if GetConVarNumber("cpt_scp_173blinksame") == 1 then
						time = 5
					end
					if GetConVarNumber("cpt_scp_blinkmessage") == 1 then
						tb[i]:ChatPrint("You will blink in " .. time .. " seconds.")
					end
					tb[i]:SetNWInt("SCP_BlinkTime",CurTime() +time)
				end)
			end
		end
	end
end)

function NPC_Meta:SCP_IsPlayerBlinking()
	for _,v in ipairs(player.GetAll()) do
		if v:IsPlayer() then
			if v:GetNWBool("SCP_IsBlinking") == false && self:Visible(v) then
				return true
			else
				return false
			end
		end
	end
end

function NPC_Meta:SCP_CanBeSeenData()
	local tb = {}
	for _,v in ipairs(player.GetAll()) do
		if GetConVarNumber("ai_ignoreplayers") == 1 then return end
		if v:IsPlayer() && v:Visible(self) then
			if v:GetNWBool("SCP_IsBlinking") == false && v.IsPossessing == false && v:Alive() && self:Disposition(v) != D_LI && v:Visible(self) && (v:GetForward():Dot(((self:GetPos() +self:OBBCenter() +self:GetForward() *-30) -v:GetPos() +v:OBBCenter()):GetNormalized()) > math.cos(math.rad(SCP_SightAngle))) then
				if !table.HasValue(tb) then
					table.insert(tb,v)
				end
			else
				if table.HasValue(tb) && tb[v] != nil then
					tb[v] = nil
				end
			end
		end
	end
	return tb
end

function NPC_Meta:SCP_CanBeSeen()
	local tb = {}
	for _,v in ipairs(player.GetAll()) do
		if GetConVarNumber("ai_ignoreplayers") == 1 then return false end
		if v:IsPlayer() && v:Visible(self) then
			if v:GetNWBool("SCP_IsBlinking") == false && v.IsPossessing == false && v:Alive() && self:Disposition(v) != D_LI && v:Visible(self) && (v:GetForward():Dot(((self:GetPos() +self:OBBCenter() +self:GetForward() *-30) -v:GetPos() +v:OBBCenter()):GetNormalized()) > math.cos(math.rad(SCP_SightAngle))) then
				if !table.HasValue(tb) then
					table.insert(tb,v)
				end
			else
				if table.HasValue(tb) && tb[v] != nil then
					tb[v] = nil
				end
			end
		end
	end
	for _,v in ipairs(tb) do
		if v == nil then
			return false
		end
		return true
	end
	return false
end

function NPC_Meta:SCP_CanBeSeen_NPC()
	local tb = {}
	for _,v in ipairs(ents.GetAll()) do
		if v:IsNPC() && v:Visible(self) then
			if v != self && v.SCP_IsBlinking == false && v:GetClass() != "npc_bullseye" && self:Disposition(v) != D_LI && v:GetClass() != self:GetClass() && v:Visible(self) && (v:GetForward():Dot(((self:GetPos() +self:OBBCenter() +self:GetForward() *-30) -v:GetPos() +v:OBBCenter()):GetNormalized()) > math.cos(math.rad(SCP_SightAngle))) then
				if !table.HasValue(tb) then
					table.insert(tb,v)
				end
			else
				if table.HasValue(tb) && tb[v] != nil then
					tb[v] = nil
				end
			end
		end
	end
	for _,v in ipairs(tb) do
		if v == nil then
			return false
		end
		return true
	end
	return false
end

	-- Menu + ConVars --

CPTBase.AddConVar("cpt_scp_008infectiontime","200")
CPTBase.AddConVar("cpt_scp_049infectiontime","150")
CPTBase.AddConVar("cpt_scp_420effectstime","20")
CPTBase.AddConVar("cpt_scp_513effectstime","60")
CPTBase.AddConVar("cpt_scp_939viewdistance","450")

CPTBase.AddConVar("cpt_scp_939slsounds","0")
CPTBase.AddConVar("cpt_scp_173slsounds","0")
CPTBase.AddConVar("cpt_scp_049slsounds","0")
CPTBase.AddConVar("cpt_scp_ntfannouncer","1")
CPTBase.AddConVar("cpt_scp_site19","1")
CPTBase.AddConVar("cpt_scp_106damage","0")
CPTBase.AddConVar("cpt_scp_realistic966","0")
CPTBase.AddConVar("cpt_scp_usemusic","1")
CPTBase.AddConVar("cpt_scp_939smallcollision","0")
CPTBase.AddConVar("cpt_scp_mtfhiding","1")
CPTBase.AddConVar("cpt_scp_895attack","0")
CPTBase.AddConVar("cpt_scp_halloween","0")
CPTBase.AddConVar("cpt_scp_173revision","0")
CPTBase.AddConVar("cpt_scp_173blinksame","0")
CPTBase.AddConVar("cpt_scp_682audio","0")
CPTBase.AddConVar("cpt_scp_682theme","0")
CPTBase.AddConVar("cpt_scp_guardduty","0")
CPTBase.AddClientVar("cpt_scp_blinkmessage","0",true)

local function CPTBase_SCP_ResetFemurBreaker(ply)
	if ply:IsAdmin() or ply:IsSuperAdmin() then
		if SERVER then
			FEMURACTIVATED = false
			NEXTFMT = 0
			ST_FEMUR = false
			NEXTSTT = 0
			MN_FEMUR = false
			NEXTMNT = 0
		end
	end
end
concommand.Add("cpt_scp_resetfemurbreaker",CPTBase_SCP_ResetFemurBreaker)

local function CPTBase_SCP_Decontamination(ply)
	if ply:IsAdmin() or ply:IsSuperAdmin() then
		PlayGlobalSound("cpthazama/scpsl/vo/Decont_countdown.mp3")
		for _,v in ipairs(ents.GetAll()) do
			if v:IsValid() && v:GetClass() == "prop_door_rotating" || v:GetClass() == "func_door" then
				v:Fire("Unlock")
				v:Fire("Open")
				-- v:Fire("Lock")
			end
		end
		timer.Simple(38,function() for _,v in ipairs(player.GetAll()) do v:Kill() end end)
	end
end
concommand.Add("cpt_scp_decontamination",CPTBase_SCP_Decontamination)

local function CPTBase_SCP_Nuke(ply)
	if ply:IsAdmin() or ply:IsSuperAdmin() then
		PlayGlobalSound("cpthazama/scpsl/vo/Main120.mp3")
		for _,v in ipairs(ents.GetAll()) do
			if v:IsValid() && v:GetClass() == "prop_door_rotating" || v:GetClass() == "func_door" then
				v:Fire("Unlock")
				v:Fire("Open")
				-- v:Fire("Lock")
			end
		end
		timer.Simple(131,function() for _,v in ipairs(ents.GetAll()) do v:TakeDamage(999999999,nil) end end)
	end
end
concommand.Add("cpt_scp_nuke",CPTBase_SCP_Nuke)

hook.Add("PlayerSay","CPTBase_SCP_CommandsChat",function(ply,spoke)
	local lowered = string.lower(spoke)
	if ply:GetNWBool("SCP_HasNightvision") && lowered == "!removenvg" then
		ply:SetNWBool("SCP_HasNightvision",false)
		ply:ChatPrint("You take off the nightvision goggles.")
	end
	if ply:GetNWBool("SCP_Has178") && lowered == "!remove178" then
		ply:SetNWBool("SCP_Has178",false)
		ply:ChatPrint("You take off the 3D glasses.")
	end
end)