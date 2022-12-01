if !CPTBase then return end
AddCSLuaFile('shared.lua')
include('shared.lua')

ENT.ModelTable = {"models/cpthazama/scp/049-2.mdl"}
ENT.StartHealth = 350
ENT.CanMutate = false
ENT.CollisionBounds = Vector(18,18,70)

ENT.Faction = "FACTION_SCP"

ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackType = DMG_SLASH
ENT.MeleeAttackDamage = 10

ENT.BloodEffect = {"blood_impact_orange"}
ENT.BloodDecal = {"CPTBase_OrangeBlood"}

ENT.tbl_Animations = {
	["Walk"] = {ACT_WALK},
	["Run"] = {ACT_WALK},
	["Attack"] = {ACT_MELEE_ATTACK1},
}

ENT.tbl_Sounds = {
	["FootStep"] = {"cpthazama/scp/049/Step1.mp3","cpthazama/scp/049/Step2.mp3","cpthazama/scp/049/Step3.mp3"},
	["Strike"] = {"cpthazama/scp/D9341/Damage3.mp3"},
}

ENT.tbl_Capabilities = {CAP_OPEN_DOORS,CAP_USE}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetInit()
	self:SetHullType(HULL_HUMAN)
	self:SetMovementType(MOVETYPE_STEP)
	self.IdleLoop = CreateSound(self,"cpthazama/scp/049/0492Breath.mp3")
	self.IdleLoop:SetSoundLevel(65)
	self.IsAttacking = false
	self.NextIdleLoopT = 0
	self.NextDoorT = 0
	if self.WasInfected then
		timer.Simple(self:AnimationLength("resurrect"),function()
			if IsValid(self) then
				self.WasInfected = false
				self.CanWander = true
				self.Possessor_CanMove = true
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnResurrected()
	self:PlaySequence("resurrect",1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleEvents(...)
	local event = select(1,...)
	local arg1 = select(2,...)
	if(event == "mattack") then
		if arg1 == "both" then
			self:DoDamage(self.MeleeAttackDamageDistance *1.5,self.MeleeAttackDamage,self.MeleeAttackType)
		else
			self:DoDamage(self.MeleeAttackDamageDistance,self.MeleeAttackDamage,self.MeleeAttackType)
		end
		return true
	end
	if(event == "emit") then
		if arg1 == "step" then
			self:PlaySound("FootStep",90,90,100,true)
		end
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local function zombieDeathFollow( ply )
	if not SERVER then return end
	if ply:Health() > 0 then return end
	if not IsValid( ply.CPTBase_SCP_Zombie ) then return end
	if not ply.SCP_SpawnedZombieEntity then
		ply.SCP_ZombieEntity = ents.Create( "prop_dynamic" )
		ply.SCP_ZombieEntity:SetPos( ply.CPTBase_SCP_Zombie:GetPos() + ply.CPTBase_SCP_Zombie:OBBCenter() )
		ply.SCP_ZombieEntity:SetModel( "models/props_junk/watermelon01_chunk02c.mdl" )
		ply.SCP_ZombieEntity:SetParent( ply.CPTBase_SCP_Zombie )
		ply.SCP_ZombieEntity:SetRenderMode( RENDERMODE_TRANSALPHA )
		ply.SCP_ZombieEntity:Spawn()
		ply.SCP_ZombieEntity:SetColor( color_transparent )
		ply.SCP_ZombieEntity:SetNoDraw( false )
		ply.SCP_ZombieEntity:DrawShadow( false )
		ply.SCP_ZombieEntity:DeleteOnRemove( ply.CPTBase_SCP_Zombie )
		ply.SCP_SpawnedZombieEntity = true
	end
	if IsValid( ply.SCP_ZombieEntity ) then
		ply:Spectate( OBS_MODE_CHASE )
		ply:SpectateEntity( ply.SCP_ZombieEntity )
		ply:SetMoveType( MOVETYPE_OBSERVER )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnHitEntity(hitents,hitpos)
	if self.tbl_Sounds["Strike"] == nil then
		self:EmitSound("npc/zombie/claw_strike" .. math.random(1,3) .. ".wav",55,100)
	else
		self:EmitSound(self:SelectFromTable(self.tbl_Sounds["Strike"]),55,100)
	end
	for _,v in ipairs(hitents) do
		if v:IsValid() && v:IsPlayer() && v:Alive() && v.SCP_Has714 == false && v.SCP_Infected_049 == false then
			if v.CPTBase_SCP_InfectionOverlayT == nil then v.CPTBase_SCP_InfectionOverlayT = 0 end
			v.SCP_Infected_049 = true
			v:ChatPrint("You instantly feel weaker and want to throw up...")
			v:EmitSound("cpthazama/scp/D9341/Heartbeat.mp3",70,100)
			v:SendLua("surface.PlaySound('cpthazama/scp/music/Horror8.mp3')")
			v:ConCommand("r_screenoverlay models/props_lab/Tank_Glass001.vmt")
			v.CPTBase_SCP_InfectionOverlayT = CurTime() +4.9
			timer.Simple(5,function()
				if v:IsValid() then
					v:ConCommand("r_screenoverlay 0")
				end
			end)
			local deaths = v:Deaths()
			local time = GetConVar("cpt_scp_049infectiontime"):GetInt()
			timer.Simple(time /3,function()
				if v:IsValid() && v.SCP_Infected_049 then
					if v:Deaths() > deaths then return end
					v:EmitSound("cpthazama/scp/D9341/Damage6.mp3",70,100)
					v:ChatPrint("Parts of your skin begin to peel off and your bones start to crack...")
					v:TakeDamage(5,v)
				end
			end)
			timer.Simple(time /2,function()
				if v:IsValid() && v.SCP_Infected_049 then
					if v:Deaths() > deaths then return end
					v:EmitSound("cpthazama/scp/D9341/Cough3.mp3",70,100)
					v:SendLua("surface.PlaySound('cpthazama/scp/music/Room049.mp3')")
					v:ChatPrint("Blood begins to pour from your mouth and ears...")
					for i = 1,3 do
						ParticleEffect("blood_impact_red_01",v:GetAttachment(2).Pos,Angle(math.random(0,360),math.random(0,360),math.random(0,360)),v)
					end
				end
			end)
			timer.Simple(time,function()
				if v:IsValid() && v.SCP_Infected_049 then
					if v:Deaths() > deaths then return end
					v:ChatPrint("You lose consciousness and your body is turned into a walking corpse...")
					local zombie = ents.Create("npc_cpt_scp_049_2")
					zombie:SetPos(v:GetPos())
					zombie:SetAngles(v:GetAngles())
					zombie:Spawn()
					zombie:SetColor(v:GetColor())
					zombie:SetMaterial(v:GetMaterial())
					zombie:SetModelScale(v:GetModelScale(),0)
					CreateUndo(zombie,v:Nick() .. " (049-2 Infected)",v)
					v:Kill()
					v.CPTBase_SCP_Zombie = zombie
					v:GetRagdollEntity():Remove()
					zombie:PlaySequence("resurrect",1)
					if SERVER then zombieDeathFollow( v ) end
				end
			end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.WasInfected then
		self.CanWander = false
		self.Possessor_CanMove = false
	end
	if util.IsSCPMap() then
		if CurTime() > self.NextDoorT then
			for _,v in ipairs(ents.FindInSphere(self:GetPos(),SCP_DoorOpenDistance)) do
				if v:IsValid() && v:GetClass() == "func_door" /*&& v:GetSequenceName(v:GetSequence()) == "idle"*/ then
					v:Fire("Open")
				end
			end
			self.NextDoorT = CurTime() +math.Rand(1,3)
		end
	end
	if CurTime() > self.NextIdleLoopT then
		self.IdleLoop:Stop()
		self.IdleLoop:Play()
		self.NextIdleLoopT = CurTime() +8
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:WhenRemoved()
	self.IdleLoop:Stop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoAttack()
	if self:CanPerformProcess() == false then return end
	if (!self.IsPossessed && IsValid(self:GetEnemy()) && !self:GetEnemy():Visible(self)) then return end
	self:StopCompletely()
	self:PlayAnimation("Attack")
	self.IsAttacking = true
	self:AttackFinish()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleSchedules(enemy,dist,nearest,disp)
	if self.IsPossessed then return end
	if(disp == D_HT) then
		if nearest <= self.MeleeAttackDistance && self:FindInCone(enemy,self.MeleeAngle) then
			self:DoAttack()
		end
		if self:CanPerformProcess() then
			self:ChaseEnemy()
		end
	end
end