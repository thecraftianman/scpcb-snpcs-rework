if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Class D"
ENT.Category = "SCP:CB"
ENT.Models = { "models/cpthazama/scp/dclass.mdl" }
ENT.Skins = { 0, 1, 2 }
ENT.ModelScale = 1
ENT.CollisionBounds = Vector( 18, 18, 70 )
ENT.BloodColor = BLOOD_COLOR_RED
ENT.RagdollOnDeath = true

-- Stats --
ENT.SpawnHealth = 60
ENT.HealthRegen = 0
ENT.MinPhysDamage = 10
ENT.MinFallDamage = 10

-- Sounds --
ENT.OnSpawnSounds = {}
ENT.OnIdleSounds = { "cpthazama/scp/dclass/dontlikethis.mp3" }
ENT.IdleSoundDelay = math.random( 30, 60 )
ENT.ClientIdleSounds = false
ENT.OnDamageSounds = { "cpthazama/scp/d9341/breath0.mp3", "cpthazama/scp/d9341/breath1.mp3", "cpthazama/scp/d9341/breath2.mp3", "cpthazama/scp/d9341/breath3.mp3", "cpthazama/scp/d9341/breath4.mp3" }
ENT.DamageSoundDelay = 0.25
ENT.OnDeathSounds = { "cpthazama/scp/dclass/gasp.mp3" }
ENT.OnDownedSounds = {}
ENT.Footsteps = {}

-- AI --
ENT.Omniscient = false
ENT.SpotDuration = 30
ENT.RangeAttackRange = 0
ENT.MeleeAttackRange = 0
ENT.ReachEnemyRange = 0
ENT.AvoidEnemyRange = 50

-- Relationships --
ENT.Factions = { FACTION_PLAYER }
ENT.Frightening = false
ENT.AllyDamageTolerance = 0.33
ENT.AfraidDamageTolerance = 0.33
ENT.NeutralDamageTolerance = 0.33

-- Locomotion --
ENT.Acceleration = 1000
ENT.Deceleration = 1000
ENT.JumpHeight = 50
ENT.StepHeight = 20
ENT.MaxYawRate = 250
ENT.DeathDropHeight = 200

-- Animations --
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1
ENT.JumpAnimation = ACT_JUMP
ENT.JumpAnimRate = 1

-- Movements --
ENT.UseWalkframes = false
ENT.WalkSpeed = 100
ENT.RunSpeed = 200

-- Climbing --
ENT.ClimbLedges = false
ENT.ClimbLedgesMaxHeight = math.huge
ENT.ClimbLedgesMinHeight = 0
ENT.LedgeDetectionDistance = 20
ENT.ClimbProps = false
ENT.ClimbLadders = false
ENT.ClimbLaddersUp = true
ENT.LaddersUpDistance = 20
ENT.ClimbLaddersUpMaxHeight = math.huge
ENT.ClimbLaddersUpMinHeight = 0
ENT.ClimbLaddersDown = false
ENT.LaddersDownDistance = 20
ENT.ClimbLaddersDownMaxHeight = math.huge
ENT.ClimbLaddersDownMinHeight = 0
ENT.ClimbSpeed = 60
ENT.ClimbUpAnimation = ACT_CLIMB_UP
ENT.ClimbDownAnimation = ACT_CLIMB_DOWN
ENT.ClimbAnimRate = 1
ENT.ClimbOffset = Vector( 0, 0, 0 )

-- Detection --
ENT.EyeBone = ""
ENT.EyeOffset = Vector( 0, 0, 0 )
ENT.EyeAngle = Angle( 0, 0, 0 )
ENT.SightFOV = 150
ENT.SightRange = 15000
ENT.MinLuminosity = 0
ENT.MaxLuminosity = 1
ENT.HearingCoefficient = 1

-- Weapons --
ENT.UseWeapons = false
ENT.Weapons = {}
ENT.WeaponAccuracy = 1
ENT.WeaponAttachment = "Anim_Attachment_RH"
ENT.DropWeaponOnDeath = false
ENT.AcceptPlayerWeapons = false

-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionPrompt = true
ENT.PossessionCrosshair = false
ENT.PossessionMovement = POSSESSION_MOVE_8DIR
ENT.PossessionViews = {}
ENT.PossessionBinds = {}

if SERVER then

	function ENT:CustomInitialize()
		self.NextDoorT = 0
		self.NextUseT = 0
	end

	function ENT:CustomThink()
		if not util.IsSCPMap() then return end
		if CurTime() <= self.NextDoorT then return end
		for _,v in ipairs( ents.FindInSphere( self:GetPos(), SCP_DoorOpenDistance ) ) do
			if not v:IsValid() then return end
			if not v:DrG_IsDoor() then return end
			v:Fire( "Open" )
		end
		self.NextDoorT = CurTime() + math.Rand( 1, 3 )
	end

	-- These hooks are called when the nextbot has an enemy (inside the coroutine)
	function ENT:OnMeleeAttack( enemy ) end
	function ENT:OnRangeAttack( enemy ) end
	function ENT:OnChaseEnemy( enemy ) end
	function ENT:OnAvoidEnemy( enemy ) end

	-- These hooks are called while the nextbot is patrolling (inside the coroutine)
	function ENT:OnReachedPatrol( pos )
		self:Wait( math.random( 3, 7 ) )
	end
	function ENT:OnPatrolUnreachable( pos ) end
	function ENT:OnPatrolling( pos ) end

	-- These hooks are called when the current enemy changes (outside the coroutine)
	function ENT:OnNewEnemy( enemy ) end
	function ENT:OnEnemyChange( oldEnemy, newEnemy ) end
	function ENT:OnLastEnemy( enemy ) end

	-- Those hooks are called inside the coroutine
	function ENT:OnSpawn() end
	function ENT:OnIdle()
		self:AddPatrolPos( self:RandomPos( 1500 ) )
	end

	-- Called outside the coroutine
	function ENT:OnTakeDamage( dmg, hitgroup )
		self:SpotEntity( dmg:GetAttacker() )
	end
	function ENT:OnFatalDamage( dmg, hitgroup ) end

	-- Called inside the coroutine
	function ENT:OnTookDamage( dmg, hitgroup ) end
	function ENT:OnDeath( dmg, hitgroup ) end
	function ENT:OnDowned( dmg, hitgroup ) end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot( ENT )