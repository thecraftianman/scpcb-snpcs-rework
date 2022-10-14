--[[--------------------------------------------------
	Copyright (c) 2019 by Cpt. Hazama, All rights reserved.
	Nothing in these files or/and code may be reproduced, adapted, merged or
	modified without prior written consent of the original author, Cpt. Hazama
--------------------------------------------------]]--
include( "server/cpt_utilities.lua" )
include( "client/cpt_scp_vision.lua" )
include( "cpt_scp_map.lua" )

-- if !CPTBase.IsAddonUpdated("cptbase","54") then return end

CPTBase.RegisterMod( "SCP:CB SNPCs", "0.2.1" )
-- CPTBase.AddAddon("scp","10")

CPTBase.DefineDecal( "SCP_PDCorrosion", { "decals/decalpd3" } )
-- CPTBase.DefineDecal("SCP_457Scorch",{"decals/decal_footprint_scorch"})
CPTBase.AddParticleSystem( "particles/cpt_scp_pocketdimension.pcf", {} )
CPTBase.AddParticleSystem( "particles/DOOR_EXPLOSION.pcf", {} )

local category = "SCP:CB"
-- CPTBase.AddNPC("SCP-106 (Isolation)","npc_cpt_scpiso_106",category)
CPTBase.AddNPC( "SCP-173 (Isolation)", "npc_cpt_scpiso_173", category )
CPTBase.AddAdminNPC( "SCP-303 (Isolation)", "npc_cpt_scpiso_303", category )
CPTBase.AddNPC( "SCP-650 (Isolation)", "npc_cpt_scpiso_650", category )

CPTBase.AddNPC( "(Classic) SCP-008-1", "npc_cpt_scp_008_1_old", category )
CPTBase.AddNPC( "(Classic) SCP-096", "npc_cpt_scp_096_old", category )
CPTBase.AddNPC( "(Classic) SCP-106", "npc_cpt_scp_106_old", category )
CPTBase.AddNPC( "(Classic) SCP-173", "npc_cpt_scp_173_old", category )
CPTBase.AddNPC( "(Classic) MTF Guard", "npc_cpt_scp_guard_old", category )

CPTBase.AddAdminNPC( "SCP-005", "npc_cpt_scp_005", category )
CPTBase.AddAdminNPC( "SCP-008", "npc_cpt_scp_008", category )
CPTBase.AddNPC( "SCP-008-1", "npc_cpt_scp_008_1", category )
CPTBase.AddAdminNPC( "SCP-012", "npc_cpt_scp_012", category )
CPTBase.AddNPC( "SCP-035", "npc_cpt_scp_035", category )
CPTBase.AddNPC( "SCP-049", "npc_cpt_scp_049", category )
CPTBase.AddNPC( "SCP-049-2", "npc_cpt_scp_049_2", category )
CPTBase.AddNPC( "SCP-049-2 Soldier", "npc_cpt_scp_049_2_ntf", category )
CPTBase.AddNPC( "SCP-066", "npc_cpt_scp_066", category )
CPTBase.AddAdminNPC( "SCP-079", "npc_cpt_scp_079", category )
CPTBase.AddAdminNPC( "SCP-079 Camera", "ent_cpt_scp_camera", category )
CPTBase.AddNPC( "SCP-087-1", "npc_cpt_scp_087_1", category )
CPTBase.AddNPC( "SCP-087-B", "npc_cpt_scp_087_b", category )
CPTBase.AddNPC( "SCP-096", "npc_cpt_scp_096", category )
CPTBase.AddNPC( "SCP-106", "npc_cpt_scp_106", category )
CPTBase.AddAdminNPC( "SCP-106 Pocket Dimension Plane", "npc_cpt_scp_106pdplane", category )
CPTBase.AddNPC( "SCP-173", "npc_cpt_scp_173", category )
-- CPTBase.AddNPC("SCP-173 (Box)","npc_cpt_scp_173_box",category) -- Shouldn't be spawnable
CPTBase.AddNPC( "SCP-178", "npc_cpt_scp_178specs", category )
CPTBase.AddNPC( "SCP-178-1", "npc_cpt_scp_178", category )
-- CPTBase.AddNPC("SCP-205","npc_cpt_scp_205",category) -- Stupid
-- CPTBase.AddNPC("SCP-205-A","npc_cpt_scp_205a",category)
-- CPTBase.AddNPC("SCP-205-B","npc_cpt_scp_205b",category)
-- CPTBase.AddNPC("SCP-205-C","npc_cpt_scp_205c",category)
-- CPTBase.AddNPC("SCP-205-D","npc_cpt_scp_205d",category)
CPTBase.AddNPC( "SCP-372", "npc_cpt_scp_372", category ) -- Should this even be here lol
CPTBase.AddNPC( "SCP-420-J", "npc_cpt_scp_420", category )
CPTBase.AddNPC( "SCP-427", "npc_cpt_scp_427", category )
CPTBase.AddNPC( "SCP-457", "npc_cpt_scp_457", category )
CPTBase.AddNPC( "SCP-500", "npc_cpt_scp_500", category )
CPTBase.AddNPC( "SCP-513", "npc_cpt_scp_513", category )
-- CPTBase.AddNPC("SCP-513-1","npc_cpt_scp_513_1",category) -- Shouldn't be spawnable
CPTBase.AddNPC( "SCP-575", "npc_cpt_scp_575", category )
CPTBase.AddNPC( "SCP-650", "npc_cpt_scp_650", category )
CPTBase.AddAdminNPC( "SCP-682", "npc_cpt_scp_682", category )
CPTBase.AddNPC( "SCP-714", "npc_cpt_scp_714", category )
CPTBase.AddNPC( "SCP-860-2", "npc_cpt_scp_860", category )
CPTBase.AddNPC( "SCP-895", "npc_cpt_scp_895", category )
CPTBase.AddNPC( "SCP-939 (Instance A)", "npc_cpt_scp_939_a", category )
CPTBase.AddNPC( "SCP-939 (Instance B)", "npc_cpt_scp_939_b", category )
CPTBase.AddNPC( "SCP-939 (Instance C)", "npc_cpt_scp_939_c", category )
CPTBase.AddNPC( "SCP-966", "npc_cpt_scp_966", category )
CPTBase.AddNPC( "SCP-1025", "npc_cpt_scp_1025", category )
CPTBase.AddNPC( "SCP-1048", "npc_cpt_scp_1048", category )
CPTBase.AddNPC( "SCP-1123", "npc_cpt_scp_1123", category )
CPTBase.AddNPC( "SCP-1356", "npc_cpt_scp_1356", category )
CPTBase.AddNPC( "SCP-1499-1", "npc_cpt_scp_1499_1", category )
CPTBase.AddNPC( "SCP-1499-1 King", "npc_cpt_scp_1499_1_king", category )

-- CPTBase.AddNPC("MTF Guard","npc_cpt_scp_guard",category)
CPTBase.AddNPC( "MTF Epsilon-11 Nine-Tailed Fox", "npc_cpt_scp_ntf", category )
CPTBase.AddNPC( "MTF Lambda-5 White Rabbits", "npc_cpt_scp_lambda", category )
CPTBase.AddNPC( "MTF Nu-7 Hammer Down", "npc_cpt_scp_nu", category )
CPTBase.AddAdminNPC( "MTF AH-64 Apache", "npc_cpt_scp_apache", category )

CPTBase.AddNPC( "Class D Subject", "npc_cpt_scp_dclass", category )
CPTBase.AddNPC( "Scientist", "npc_cpt_scp_scientist", category ) -- STAHP! NO!

CPTBase.AddNPC( "Nightvision Goggles", "ent_cpt_scp_nightvision", category ) -- The object itself isn't a NPC but technically speaking, it is a NPC since well, it's running on my SNPC base

hook.Add( "PlayerUse", "CPTBase_SCP005", function( ply, ent )
	if not ply.SCP_Has005 then return end
	if ply.SCP_NextUnlockDoorT == nil then ply.SCP_NextUnlockDoorT = 0 end
	if not ent:IsValid() then return end
	if CurTime() > ply.SCP_NextUnlockDoorT and string.find( ent:GetClass(), "door" ) and string.find( ent:GetSequenceName( ent:GetSequence() ), "locked" ) then
		ent:Fire( "Unlock" )
		ply:ChatPrint( "Door unlocked with SCP-005" )
		ply:ChatPrint( "SCP-005 cooldown time is 3 seconds" )
		ent:EmitSound( "doors/default_locked.wav", 70, 100 )
		ply.SCP_NextUnlockDoorT = CurTime() + 3
	end
end )

	-- Custom Functions --

local NPC_Meta = FindMetaTable( "NPC" )
local SCP_SightAngle = 50
SCP_GlobalNTFCoolDown = 0
SCP_DoorOpenDistance = 100

hook.Add( "OnEntityCreated", "CPTBase_SCP_SpawnData_NPCs", function( ent )
	if not ent:IsNPC() then return end
	ent.SCP_Infected_008 = false
	ent.SCP_IsBlinking = false
	ent.SCP_BlinkTime = CurTime() + math.random( 4, 7 )
end )

hook.Add( "Think", "CPTBase_SCP_ZombieDeathFollow", function()
	for _, v in ipairs( player.GetAll() ) do
		if v:Alive() then return end
		if not IsValid( v.CPTBase_SCP_Zombie ) then return end
		-- v:SetPos(v.CPTBase_SCP_Zombie:GetPos() +v.CPTBase_SCP_Zombie:OBBCenter())
		if not v.SCP_SpawnedZombieEntity then
			v.SCP_ZombieEntity = ents.Create( "prop_dynamic" )
			v.SCP_ZombieEntity:SetPos( v.CPTBase_SCP_Zombie:GetPos() + v.CPTBase_SCP_Zombie:OBBCenter() )
			v.SCP_ZombieEntity:SetModel( "models/props_junk/watermelon01_chunk02c.mdl" )
			v.SCP_ZombieEntity:SetParent( v.CPTBase_SCP_Zombie )
			v.SCP_ZombieEntity:SetRenderMode( RENDERMODE_TRANSALPHA )
			v.SCP_ZombieEntity:Spawn()
			v.SCP_ZombieEntity:SetColor( Color( 0, 0, 0, 0 ) )
			v.SCP_ZombieEntity:SetNoDraw( false )
			v.SCP_ZombieEntity:DrawShadow( false )
			v.SCP_ZombieEntity:DeleteOnRemove( v.CPTBase_SCP_Zombie )
			v.SCP_SpawnedZombieEntity = true
		end
		if IsValid( v.SCP_ZombieEntity ) then
			v:Spectate( OBS_MODE_CHASE )
			v:SpectateEntity( v.SCP_ZombieEntity )
			v:SetMoveType( MOVETYPE_OBSERVER )
		end
	end
end )

function NPC_Meta:SCP_IsPlayerBlinking()
	for _, v in ipairs( player.GetAll() ) do
		if not v:IsPlayer() then return end
		if self:Visible( v ) and not v:GetNWBool( "SCP_IsBlinking" ) then
			return true
		else
			return false
		end
	end
end

function NPC_Meta:SCP_CanBeSeenData()
	local tb = {}

	for _, v in ipairs( player.GetAll() ) do
		if GetConVarNumber( "ai_ignoreplayers" ) == 1 then return end
		if not v:IsPlayer() then return end
		if v:Visible( self ) then
			local plyRelations = self:Disposition( v ) ~= D_LI
			local plyIsBlink = v:GetNWBool( "SCP_IsBlinking" )

			local scpSightAngTrig = math.cos( math.rad( SCP_SightAngle ) )
			local scpVec = self:GetPos() + self:OBBCenter() + self:GetForward() * -30 -- Rework note: What is this magic number here for?
			local scpVecRel = scpVec - v:GetPos() + v:OBBCenter()
			local plyScpDotVec = v:GetForward():Dot( scpVecRel:GetNormalized() )
			local plyVisCheck = plyScpDotVec > scpSightAngTrig

			if v:Alive() and plyRelations and v:Visible( self ) and plyVisCheck and plyIsBlink == false and v.IsPossessing == false then
				if not table.HasValue( tb ) then
					table.insert( tb, v )
				end
			else
				if table.HasValue( tb ) and tb[v] ~= nil then
					tb[v] = nil
				end
			end
		end
	end

	return tb
end

function NPC_Meta:SCP_CanBeSeen()
	local tb = self:SCP_CanBeSeenData()

	for _, v in ipairs( tb ) do
		if v == nil then
			return false
		end
		return true
	end
	return false
end

function NPC_Meta:SCP_CanBeSeen_NPC()
	local tb = {}

	for _, v in ipairs( ents.GetAll() ) do
		if not v:IsNPC() then return end
		if not v:Visible( self ) then return end

		local npcDiffEnt = v ~= self
		local npcNotBullseye = v:GetClass() ~= "npc_bullseye" -- Rework note: Why are Bullseyes a particular exception to this check?
		local npcRelations = self:Disposition(v) ~= D_LI
		local npcDiffClass = v:GetClass() ~= self:GetClass()

		local scpSightAngTrig = math.cos( math.rad( SCP_SightAngle ) )
		local scpVec = self:GetPos() + self:OBBCenter() + self:GetForward() * -30 -- Rework note: What is this magic number here for?
		local scpVecRel = scpVec - v:GetPos() + v:OBBCenter()
		local npcScpDotVec = v:GetForward():Dot( scpVecRel:GetNormalized() )
		local npcVisCheck = npcScpDotVec > scpSightAngTrig

		if npcDiffEnt and not v.SCP_IsBlinking and npcNotBullseye and npcRelations and npcDiffClass and v:Visible( self ) and npcVisCheck then
			if not table.HasValue( tb ) then
				table.insert( tb, v )
			end
		else
			if table.HasValue( tb ) and tb[v] ~= nil then
				tb[v] = nil
			end
		end
	end

	for _, v in ipairs( tb ) do
		if v == nil then
			return false
		end
		return true
	end

	return false
end

	-- Menu + ConVars --

CPTBase.AddConVar( "cpt_scp_008infectiontime", "200" )
CPTBase.AddConVar( "cpt_scp_049infectiontime", "150" )
CPTBase.AddConVar( "cpt_scp_420effectstime", "20" )
CPTBase.AddConVar( "cpt_scp_513effectstime", "60" )
CPTBase.AddConVar( "cpt_scp_939viewdistance", "450" )

CPTBase.AddConVar( "cpt_scp_939slsounds", "0" )
CPTBase.AddConVar( "cpt_scp_173slsounds", "0" )
CPTBase.AddConVar( "cpt_scp_049slsounds", "0" )
CPTBase.AddConVar( "cpt_scp_ntfannouncer", "1" )
CPTBase.AddConVar( "cpt_scp_site19", "1" )
CPTBase.AddConVar( "cpt_scp_106damage", "0" )
CPTBase.AddConVar( "cpt_scp_realistic966", "0" )
CPTBase.AddConVar( "cpt_scp_usemusic", "1" )
CPTBase.AddConVar( "cpt_scp_939smallcollision", "0" )
CPTBase.AddConVar( "cpt_scp_mtfhiding", "1" )
CPTBase.AddConVar( "cpt_scp_895attack", "0" )
CPTBase.AddConVar( "cpt_scp_halloween", "0" )
CPTBase.AddConVar( "cpt_scp_173revision", "0" )
CPTBase.AddConVar( "cpt_scp_173blinksame", "0" )
CPTBase.AddConVar( "cpt_scp_682audio", "0" )
CPTBase.AddConVar( "cpt_scp_682theme", "0" )
CPTBase.AddConVar( "cpt_scp_guardduty", "0" )

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
			if v:IsValid() and v:GetClass() == "prop_door_rotating" or v:GetClass() == "func_door" then
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
			if v:IsValid() and v:GetClass() == "prop_door_rotating" or v:GetClass() == "func_door" then
				v:Fire("Unlock")
				v:Fire("Open")
				-- v:Fire("Lock")
			end
		end
		timer.Simple(131,function() for _,v in ipairs(ents.GetAll()) do v:TakeDamage(999999999,nil) end end)
	end
end
concommand.Add("cpt_scp_nuke",CPTBase_SCP_Nuke)