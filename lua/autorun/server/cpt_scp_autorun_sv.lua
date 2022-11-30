local IsValid = IsValid

local function CPTBase_SCP079_KillPoints( victim, inflictor, killer )
	local canRun = false
	local SCP = NULL
	if not killer.CPTBase_NPC then return end
	if killer == victim then return end
	for _, v in ipairs( ents.FindByClass( "npc_cpt_scp_079" ) ) do
		if v:IsNPC() then
			canRun = true
			SCP = v
			break
		end
	end
	if canRun then
		if table.Count( SCP.tbl_LockedDoors ) > 0 then
			for _, v in ipairs( SCP.tbl_LockedDoors ) do
				if victim:GetPos():Distance( v:GetPos() ) <= 450 then
					SCP.ExperiencePoints = SCP.ExperiencePoints + 15
					break
				end
			end
		end
	end
end
hook.Add( "OnNPCKilled", "CPTBase_SCP079_KillPoints_NPC", CPTBase_SCP079_KillPoints )
hook.Add( "PlayerDeath", "CPTBase_SCP079_KillPoints_Player", CPTBase_SCP079_KillPoints )

hook.Add( "PlayerSpawn", "CPTBase_SCP_SpawnData", function( ply )
	if CLIENT then
		ply:SetNWBool( "SCP_HasNightvision", false )
		ply:SetNWBool( "SCP_IsBeingDrained", false )
		ply:SetNWBool( "SCP_Has178", false )
		ply:SetNWBool( "SCP_895Horror", false )
		ply:SetNWString( "SCP_895HorrorID", nil )
		ply:SetNWBool( "SCP_IsBlinking", false )
		ply:SetNWBool( "SCP_Touched1123", false )
		ply:SetNWBool( "SCP_Touched1123_Horror", false )
		ply:SetNWInt( "SCP_BlinkTime", CurTime() + math.random( 4, 7 ) )
		ply:SetNWInt( "SCP_LastBlinkAmount", 0 )
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
end )

hook.Add( "PlayerDeath", "CPTBase_SCP_DeathData", function( ply )
	-- if not CLIENT then return end
	ply:SetNWBool( "SCP_HasNightvision", false )
	ply:SetNWBool( "SCP_IsBeingDrained", false )
	ply:SetNWBool( "SCP_Has178", false )
	ply:SetNWBool( "SCP_895Horror", false )
	ply:SetNWString( "SCP_895HorrorID", nil )
	ply:SetNWBool( "SCP_IsBlinking", false )
	ply:SetNWBool( "SCP_Touched1123", false )
	ply:SetNWBool( "SCP_Touched1123_Horror", false )
	ply:SetNWInt( "SCP_BlinkTime", CurTime() + math.random( 4, 7 ) )
	ply:SetNWInt( "SCP_LastBlinkAmount", 0 )
	CLIENT_SCP_NV = false
end )

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

hook.Add( "Think", "CPTBase_SCP_BlinkSystem_NPCs", function()
	local canevenblink = false

	for _, scp in ipairs( ents.FindByClass( "npc_cpt_scp_*" ) ) do
		if scp:IsNPC() then
			if string.find( scp:GetClass(), "173" ) or string.find( scp:GetClass(), "087_b" ) then
				canevenblink = true
			end
		end
	end

	if canevenblink == false then return end

	local tb = {}
	for _, v in ipairs( ents.FindByClass( "npc_*" ) ) do
		if v:IsNPC() then
			if v:Health() <= 0 then return end
			if not ( string.find( v:GetClass(), "173" ) or string.find( v:GetClass(), "087_b" ) ) then
				if not tb[v] then
					table.insert( tb, v )
				end
			end
		end
	end

	for i = 0, table.Count( tb ) do
		if tb[i] == nil then return end
		if not IsValid( tb[i] ) then return end
		if tb[i].SCP_BlinkTime == nil then tb[i].SCP_BlinkTime = CurTime() + 1 end
		if tb[i].SCP_IsBlinking == nil then tb[i].SCP_IsBlinking = false end

		if tb[i]:GetClass() == "npc_cpt_scp_ntf" then
			timer.Simple( math.Round( tb[i].SCP_BlinkTime - CurTime() ) - 0.8, function()
				if not IsValid( tb[i] ) then return end
				if tb[i].SCP_IsBlinking == true then return end
				if tb[i].SCP_BeforeBlinking then
					tb[i]:SCP_BeforeBlinking()
				end
			end )
		end

		if CurTime() > tb[i].SCP_BlinkTime and not tb[i].SCP_IsBlinking then
			tb[i].SCP_IsBlinking = true
			if not tb[i].SCP_IsBlinking then return end
			timer.Simple( 0.5, function()
				if not IsValid( tb[i] ) then return end
				if not tb[i].SCP_IsBlinking then return end
				tb[i].SCP_IsBlinking = false
				local time = math.random( 5, 9 )
				if GetConVarNumber( "cpt_scp_173blinksame" ) == 1 then
					time = 5
				end
				tb[i].SCP_BlinkTime = CurTime() + time
			end )
		end
	end
end )

local function AllSCPs( ply, tb )
	for _, v in ipairs( tb ) do
		if not IsValid( v ) then return end
		if v:Visible( ply ) then
			return true
		else
			return false
		end
	end
end

hook.Add( "Think", "CPTBase_SCP_BlinkSystem", function()
	if GetConVarNumber( "ai_ignoreplayers" ) == 1 then return end

	local canevenblink = false
	local scpsBlink = {}
	local scpsAll = ents.FindByClass( "npc_cpt_scp_*" )
	if table.IsEmpty( scpsAll ) then return end

	for _, scp in ipairs( scpsAll ) do
		if scp:IsNPC() then
			if string.find( scp:GetClass(), "173" ) or string.find( scp:GetClass(), "087_b" ) then
				canevenblink = true
				if not scpsBlink[scp] then
					table.insert( scpsBlink, scp )
				end
			end
		end
	end

	if canevenblink == false then return end

	local tb = {}
	for _, v in ipairs( player.GetAll() ) do
		if v:IsPlayer() then
			if not tb[v] then
				table.insert( tb, v )
			end
		end
	end

	for i = 0, table.Count( tb ) do
		if tb[i] ~= nil then
			if tb[i] == nil then return end
			if tb[i]:GetNWBool( "CPTBase_IsPossessing" ) then return end
			if tb[i].IsPossessing then return end
			if not tb[i]:Alive() then return end
			if CurTime() <= tb[i]:GetNWInt( "SCP_BlinkTime" ) then return end
			if tb[i]:GetNWBool( "SCP_IsBlinking" ) == true then return end
			if not AllSCPs( tb[i], scpsBlink ) then return end

			local deaths = tb[i]:Deaths()
			if tb[i]:Deaths() > deaths then return end

			tb[i]:SetNWBool( "SCP_IsBlinking", true )
			if not tb[i]:GetNWBool( "SCP_IsBlinking" ) then return end

			timer.Simple( 0.5, function()
				if not tb[i]:IsValid() then return end
				if not tb[i]:Alive() then return end
				tb[i]:SetNWBool( "SCP_IsBlinking", false )
				local time = math.random( 5, 9 )
				if GetConVarNumber( "cpt_scp_173blinksame" ) == 1 then
					time = 5
				end
				if GetConVarNumber( "cpt_scp_blinkmessage" ) == 1 then
					tb[i]:ChatPrint( "You will blink in " .. time .. " seconds." )
				end
				tb[i]:SetNWInt( "SCP_BlinkTime", CurTime() + time )
			end )
		end
	end
end )

hook.Add( "PlayerUse", "CPTBase_SCP005", function( ply, ent )
	if not ply.SCP_Has005 then return end
	if ply.SCP_NextUnlockDoorT == nil then ply.SCP_NextUnlockDoorT = 0 end
	if not IsValid( ent ) then return end
	if CurTime() <= ply.SCP_NextUnlockDoorT then return end
	if string.find( ent:GetClass(), "door" ) and string.find( ent:GetSequenceName( ent:GetSequence() ), "locked" ) then
		ent:Fire( "Unlock" )
		ply:ChatPrint( "Door unlocked with SCP-005" )
		ply:ChatPrint( "SCP-005 cooldown time is 3 seconds" )
		ent:EmitSound( "doors/default_locked.wav", 70, 100 )
		ply.SCP_NextUnlockDoorT = CurTime() + 3
	end
end )

hook.Add( "PlayerSay", "CPTBase_SCP_CommandsChat", function( ply, spoke )
	local lowered = string.lower( spoke )

	if ply:GetNWBool( "SCP_HasNightvision" ) and lowered == "!removenvg" then
		ply:SetNWBool( "SCP_HasNightvision", false )
		ply:ChatPrint( "You take off the nightvision goggles." )
	end

	if ply:GetNWBool( "SCP_Has178" ) and lowered == "!remove178" then
		ply:SetNWBool( "SCP_Has178", false )
		ply:ChatPrint( "You take off the 3D glasses." )
	end
end )