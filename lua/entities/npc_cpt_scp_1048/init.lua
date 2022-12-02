if not CPTBase then return end
AddCSLuaFile('shared.lua')
include('shared.lua')

util.AddNetworkString("SCP_1048_Bleed")

ENT.ModelTable = {"models/cpthazama/scp/1048.mdl"}
ENT.StartHealth = 200
ENT.CanMutate = false
ENT.CollisionBounds = Vector(8,8,22)

ENT.MeleeAttackDistance = 100
ENT.MeleeAttackDamageDistance = 300
ENT.MeleeAttackType = DMG_SONIC
ENT.MeleeAttackDamage = 8

ENT.Faction = "FACTION_SCP"
ENT.Bleeds = false

ENT.tbl_Animations = {
	["Walk"] = {ACT_WALK},
	["Run"] = {ACT_RUN},
	["Attack"] = {ACT_MELEE_ATTACK1},
}

ENT.tbl_Sounds = {
	["FootStep"] = {"physics/body/body_medium_impact_soft7.wav"},
	["Attack"] = {"cpthazama/scp/1048A/Shriek.mp3"},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Possess_OnPossessed(possessor)
	possessor:ChatPrint("Possessor Controls:")
	possessor:ChatPrint("LMB - Attack")
	possessor:ChatPrint("RMB - Transform")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetInit()
	self:SetHullType(HULL_TINY)
	self:SetMovementType(MOVETYPE_STEP)
	self.IsAttacking = false
	self.IsTransformed = false
	self.oldHealth = 0
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleEvents(...)
	local event = select(1,...)
	local arg1 = select(2,...)
	if(event == "emit") then
		if arg1 == "step" then
			self:PlaySound("FootStep",45,90,250,true)
		end
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnHitEntity(hitents,hitpos)
	local hitPlys = {}
	for _,v in ipairs(hitents) do
		if not IsValid(v) then return end
		if not v:IsPlayer() then return end
		if v:Health() <= 0 then return end
		if v.SCP_Has714 ~= false then return end
		if not hitPlys[v] then table.insert(hitPlys, v) end
		if v.SCP_Inflicted_1048a == false then
			v.SCP_Inflicted_1048a = true
			--table.insert(hitPlys, v)
			v:ChatPrint("Your body begins to melt and your trachea becomes filled with human ears...")
			v:EmitSound("cpthazama/scp/1048a/growth.mp3",75,100)
			local deaths = v:Deaths()
			timer.Simple(24,function()
				if v:IsValid() && v.SCP_Inflicted_1048a then
					if v:Deaths() > deaths then return end
					v:ChatPrint("You die from choking on all the human ears down your throat...")
					v:Kill()
				end
			end)
		end
	end

	net.Start("SCP_1048_Bleed")
		net.WriteTable(hitPlys)
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if !self.IsPossessed then
		if self:CanPerformProcess() then
			local dist = 0
			if IsValid(self:GetEnemy()) then
				dist = self:GetClosestPoint(self:GetEnemy())
			end
			if IsValid(self:GetEnemy()) && self.IsTransformed == false && dist <= 350 then
				self.oldHealth = self:Health()
				self:SetHealth(self.oldHealth *2.5)
				self:SetModel("models/cpthazama/scp/1048a.mdl")
				for i = 0,self:GetBoneCount() -1 do
					ParticleEffect("blood_impact_red",self:GetBonePosition(i),Angle(0,0,0),nil)
				end
				self:EmitSound("cpthazama/scp/D9341/Damage4.mp3",75,100)
				self.IsTransformed = true
				self:SetCollisionBounds(Vector(self.CollisionBounds.x,self.CollisionBounds.y,self.CollisionBounds.z),-(Vector(self.CollisionBounds.x,self.CollisionBounds.y,0)))
			elseif !IsValid(self:GetEnemy()) && self:CheckForValidMemory() <= 0 && self.IsTransformed == true then
				self:SetHealth(self.oldHealth)
				self:SetModel("models/cpthazama/scp/1048.mdl")
				for i = 0,self:GetBoneCount() -1 do
					ParticleEffect("blood_impact_red",self:GetBonePosition(i),Angle(0,0,0),nil)
				end
				self:EmitSound("cpthazama/scp/D9341/Damage4.mp3",75,100)
				self.IsTransformed = false
				self:SetCollisionBounds(Vector(self.CollisionBounds.x,self.CollisionBounds.y,self.CollisionBounds.z),-(Vector(self.CollisionBounds.x,self.CollisionBounds.y,0)))
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Possess_Secondary(possessor)
	if self:CanPerformProcess() then
		if self.IsTransformed == false then
			self.oldHealth = self:Health()
			self:SetHealth(self.oldHealth *2.5)
			self:SetModel("models/cpthazama/scp/1048a.mdl")
			for i = 0,self:GetBoneCount() -1 do
				ParticleEffect("blood_impact_red",self:GetBonePosition(i),Angle(0,0,0),nil)
			end
			self:EmitSound("cpthazama/scp/D9341/Damage4.mp3",75,100)
			self.IsTransformed = true
			self:SetCollisionBounds(Vector(self.CollisionBounds.x,self.CollisionBounds.y,self.CollisionBounds.z),-(Vector(self.CollisionBounds.x,self.CollisionBounds.y,0)))
		else
			self:SetHealth(self.oldHealth)
			self:SetModel("models/cpthazama/scp/1048.mdl")
			for i = 0,self:GetBoneCount() -1 do
				ParticleEffect("blood_impact_red",self:GetBonePosition(i),Angle(0,0,0),nil)
			end
			self:EmitSound("cpthazama/scp/D9341/Damage4.mp3",75,100)
			self.IsTransformed = false
			self:SetCollisionBounds(Vector(self.CollisionBounds.x,self.CollisionBounds.y,self.CollisionBounds.z),-(Vector(self.CollisionBounds.x,self.CollisionBounds.y,0)))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoAttack()
	if self:CanPerformProcess() == false then return end
	if self.IsTransformed == false then return end
	if !self.IsPossessed && (IsValid(self:GetEnemy()) && !self:GetEnemy():Visible(self)) then return end
	self:StopCompletely()
	self:PlayAnimation("Attack",2)
	self:PlaySound("Attack")
	self.IsAttacking = true
	local attack_time = 0.5
	local hitents = {}
	for i = 1,16 do
		attack_time = attack_time +0.5
		timer.Simple(attack_time,function()
			if self:IsValid() then
				for _,v in ipairs(ents.FindInSphere(self:GetPos(),self.MeleeAttackDamageDistance)) do
					if v:IsValid() && ((v:IsPlayer() && v:Alive() && GetConVar("ai_ignoreplayers"):GetInt() == 0 && v.IsPossessing == false) || (v:IsNPC() && v != self && v.Faction != self.Faction && v:Disposition(self) != D_LI)) then
						v:TakeDamage(8,self)
						table.insert(hitents,v)
					end
				end
				self:OnHitEntity(hitents)
			end
		end)
	end
	self:AttackFinish()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleSchedules(enemy,dist,nearest,disp)
	if self.IsPossessed then return end
	if(disp == D_HT) then
		if self.IsTransformed && nearest <= self.MeleeAttackDistance && self:FindInCone(enemy,self.MeleeAngle) then
			self:DoAttack()
		end
		if self:CanPerformProcess() then
			self:ChaseEnemy()
		end
	end
end