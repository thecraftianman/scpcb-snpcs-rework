include( "autorun/client/cpt_scp_vision.lua" )

local IsValid = IsValid
local haloColor895 = Color( 255, 0, 0 )
local haloColor079 = Color( 0, 161, 255 )
local haloColor106 = Color( 127, 0, 0 )
local hudWhite = color_white:Unpack()
local hudClear = color_transparent:Unpack()
local hudWhiteClear = 255, 255, 255, 100

local tab_nightvision = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 5,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 2000,
	["$pp_colour_mulb"] = 0
}

local tab_plane = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 0.3,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 30,
	["$pp_colour_mulg"] = -1,
	["$pp_colour_mulb"] = -1
}

local CLIENT_SCP_NV = false
concommand.Add( "cpt_scp_togglenightvision", function( ply, cmd, args )
	CLIENT_SCP_NV = not CLIENT_SCP_NV
end )

local CLIENT_SCP_PLANE = false
concommand.Add( "cpt_scp_toggleplanevision", function( ply, cmd, args )
	CLIENT_SCP_PLANE = not CLIENT_SCP_PLANE
end )

hook.Add( "RenderScreenspaceEffects", "CPTBase_SCP_Nightvision", function( ply )
	if CLIENT_SCP_NV == true then
		DrawColorModify( tab_nightvision )
	end
	if CLIENT_SCP_PLANE == true then
		DrawColorModify( tab_plane )
	end
end )

hook.Add( "PreDrawHalos", "CPTBase_SCP_Nightvision895", function()
	if not CLIENT_SCP_NV then return end
	local tbl = {}
	local light = DynamicLight( LocalPlayer():EntIndex() )
	if light and CLIENT_SCP_NV then
		light.Pos = LocalPlayer():GetPos() + Vector( 0, 0, 30 )
		light.r = 33
		light.g = 255
		light.b = 0
		light.Brightness = 0
		light.Size = 600
		light.Decay = 900
		light.DieTime = CurTime() + 0.2
		light.Style = 0
	end
	for _, v in ipairs( ents.FindByClass( "npc_cpt_scp_895" ) ) do
		-- if v:IsValid() && v:IsNPC() && v:GetClass() == "npc_cpt_scp_966" then
			-- v:SetNoDraw(false)
		-- end
		if IsValid( v ) and v:IsNPC() then
			table.insert( tbl, v )
		end
	end
	halo.Add( tbl, haloColor895, 15, 15, 15, true, true )
-- else
	-- for _,v in ipairs(ents.GetAll()) do
		-- if v:IsValid() && v:IsNPC() && v:GetClass() == "npc_cpt_scp_966" then
			-- v:SetNoDraw(true)
		-- end
	-- end
end )

local CLIENT_SCP_178 = false
local CLIENT_SCP_178SPAWNTIME = CurTime()
local CLIENT_SCP_178SPAWNAMOUNT = 0
concommand.Add( "cpt_scp_toggle178", function( ply, cmd, args )
	CLIENT_SCP_178 = not CLIENT_SCP_178
end )

hook.Add( "HUDPaint", "CPTBase_SCP_SetBlinkTexture", function()
	local ply = LocalPlayer()
	if not ply then return end

	local scrW = ScrW()
	local scrH = ScrH()

	if ply:GetNWBool( "SCP_IsBlinking" ) and ply:Alive() then
		surface.SetDrawColor( hudWhite )
		surface.SetMaterial( Material( "overlay/blink" ) )
		surface.DrawTexturedRect( 0, 0, scrW, scrH )
		surface.SetDrawColor( hudClear )
		surface.DrawRect( 0, 0, scrW, scrH )
	end

	if ply:GetNWBool( "SCP_IsBlinking" ) then return end

	if ply:Alive() and ply:GetNWBool( "SCP_895Horror" ) then
		surface.SetDrawColor( hudWhite )
		surface.SetTexture( surface.GetTextureID( ply:GetNWString( "SCP_895HorrorID" ) ) )
		surface.DrawTexturedRect( 0, 0, scrW, scrH )
		surface.SetDrawColor( hudClear )
		surface.DrawRect( 0, 0, scrW, scrH )
	end

	if ply:Alive() and ply:GetNWBool( "SCP_Has178" ) then
		surface.SetDrawColor( hudWhiteClear )
		surface.SetTexture( surface.GetTextureID( "models/cpthazama/scp/178/178_view" ) )
		surface.DrawTexturedRect( 0, 0, scrW, scrH )
		surface.SetDrawColor( hudClear )
		surface.DrawRect( 0, 0, scrW, scrH )
	end

	if not ply:GetNWBool( "SCP_Touched1123" ) then return end

	if not ply:GetNWBool( "SCP_Touched1123_Horror" ) then
		surface.SetDrawColor( hudWhite )
		surface.SetMaterial( Material( "engine/singlecolor" ) )
		surface.DrawTexturedRect( 0, 0, scrW, scrH )
		surface.SetDrawColor( hudClear )
		surface.DrawRect( 0, 0, scrW, scrH )
	end

	if ply:GetNWBool( "SCP_Touched1123_Horror" ) then
		surface.SetDrawColor( hudWhite )
		surface.SetTexture( surface.GetTextureID( "overlay/1123" ) )
		surface.DrawTexturedRect( 0, 0, scrW, scrH )
		surface.SetDrawColor( hudClear )
		surface.DrawRect( 0, 0, scrW, scrH )
	end
end )

	-- Menu + ConVars --

CPTBase.AddClientVar( "cpt_scp_blinkmessage", "0", true )

local hookName = "CPTBaseMenu_Add_SCP"
local menuMainTab = "Options"
local menuDropName = "CPTBase"
local menuTabName = "SCP:CB SNPCs"

local function CPTBaseMenu_SCP_SNPC( panel )
	if not game.SinglePlayer() then
		if not LocalPlayer():IsAdmin() or not LocalPlayer():IsSuperAdmin() then
			panel:AddControl( "CheckBox", { Label = "Remind you when you're going to blink?", Command = "cpt_scp_blinkmessage" } )
			panel:AddControl( "Label", { Text = "Only admins can access the other settings!" } )
			return
		end
	end
	local CPTBaseMenu_SCP_SNPC = { Options = {}, CVars = {}, Label = "#Presets", MenuButton = "1", Folder = "SCP SNPCs Settings" }
	CPTBaseMenu_SCP_SNPC.Options["#Default"] = {
		cpt_scp_008infectiontime = "200",
		cpt_scp_049infectiontime = "150",
		cpt_scp_420effectstime = "20",
		cpt_scp_513effectstime = "60",
		cpt_scp_173slsounds = "0",
		cpt_scp_049slsounds = "0",
		cpt_scp_ntfannouncer = "1",
		cpt_scp_106damage = "1",
		cpt_scp_site19 = "1",
		cpt_scp_939viewdistance = "450",
		cpt_scp_blinkmessage = "1",
		cpt_scp_usemusic = "1",
		cpt_scp_realistic966 = "0",
		cpt_scp_939smallcollision = "0",
		cpt_scp_939slsounds = "0",
		cpt_scp_mtfhiding = "1",
		cpt_scp_895attack = "0",
		cpt_scp_173revision = "0",
		cpt_scp_173blinksame = "0",
		cpt_scp_682audio = "0",
		cpt_scp_682theme = "0",
		cpt_scp_guardduty = "0",
	}
	panel:AddControl( "ComboBox", CPTBaseMenu_SCP_SNPC )
	panel:AddControl( "CheckBox", { Label = "Allow custom code on gm_site19", Command = "cpt_scp_site19" } )
	panel:AddControl( "CheckBox", { Label = "Allow guards to boss you around?", Command = "cpt_scp_guardduty" } )
	panel:AddControl( "CheckBox", { Label = "Make SCP-106 take normal damage?", Command = "cpt_scp_106damage" } )
	panel:AddControl( "CheckBox", { Label = "Enable SCP-939's Secret Laboratory sounds?", Command = "cpt_scp_939slsounds" } )
	panel:AddControl( "CheckBox", { Label = "Enable SCP-173's Secret Laboratory sounds?", Command = "cpt_scp_173slsounds" } )
	panel:AddControl( "CheckBox", { Label = "Enable SCP-049's Secret Laboratory sounds?", Command = "cpt_scp_049slsounds" } )
	panel:AddControl( "CheckBox", { Label = "Make SCP-966 actually invisible?", Command = "cpt_scp_realistic966" } )
	panel:AddControl( "CheckBox", { Label = "Make SCP-939 have a small collision?", Command = "cpt_scp_939smallcollision" } )
	panel:AddControl( "CheckBox", { Label = "Use NTF Announcer if on gm_site19?", Command = "cpt_scp_ntfannouncer" } )
	panel:AddControl( "CheckBox", { Label = "Allow MTF to run from certain SCPs?", Command = "cpt_scp_mtfhiding" } )
	panel:AddControl( "CheckBox", { Label = "Allow SCP-895 to attack players regardless of nightvision?", Command = "cpt_scp_895attack" } )
	panel:AddControl( "CheckBox", { Label = "Allow music on some SCPs?", Command = "cpt_scp_usemusic" } )
	panel:AddControl( "CheckBox", { Label = "Remind you when you're going to blink?", Command = "cpt_scp_blinkmessage" } )
	panel:AddControl( "CheckBox", { Label = "Allow SCP-682 extra audio?", Command = "cpt_scp_682audio" } )
	panel:AddControl( "CheckBox", { Label = "Allow SCP-682 battle theme?", Command = "cpt_scp_682theme" } )
	panel:AddControl( "CheckBox", { Label = "Use SCP-173's '2018 lore'?", Command = "cpt_scp_173revision" } )
	panel:AddControl( "CheckBox", { Label = "Make all NPCs and players blink every 5 seconds?", Command = "cpt_scp_173blinksame" } )
	panel:AddControl( "Slider", { Label = "SCP-008 infection time", Command = "cpt_scp_008infectiontime", Type = "Float", Min = "10", Max = "800" } )
	panel:AddControl( "Slider", { Label = "SCP-049 infection time", Command = "cpt_scp_049infectiontime", Type = "Float", Min = "10", Max = "800" } )
	panel:AddControl( "Slider", { Label = "SCP-420-J effects time", Command = "cpt_scp_420effectstime", Type = "Float", Min = "5", Max = "120" } )
	panel:AddControl( "Slider", { Label = "SCP-513 effects time", Command = "cpt_scp_513effectstime", Type = "Float", Min = "30", Max = "360" } )
	panel:AddControl( "Slider", { Label = "SCP-939 view distance", Command = "cpt_scp_939viewdistance", Type = "Float", Min = "100", Max = "7500" } )
	panel:AddControl( "Button", { Label = "Reset Femur Breaker (if it's broken)", Command = "cpt_scp_resetfemurbreaker" } )
	panel:AddControl( "Button", { Label = "Decontamination Sequence", Command = "cpt_scp_decontamination" } )
	panel:AddControl( "Button", { Label = "Alpha Warhead Detonation Sequence", Command = "cpt_scp_nuke" } )
	panel:AddControl( "Label", { Text = "Cpt. Hazama" } )
end

local function CPTBaseMenu_Add_SCP()
	spawnmenu.AddToolMenuOption( menuMainTab, menuDropName, menuTabName, menuTabName .. " Settings", "", "", CPTBaseMenu_SCP_SNPC ) -- Tab, Dropdown, Select, Title
end
hook.Add( "PopulateToolMenu", hookName, CPTBaseMenu_Add_SCP )

	-- Singleplayer Only Hooks --
--[[ Rework note: these hooks only did anything in singleplayer already, so I just prevented them
	from being added in the first place because that state shouldn't change mid-session.
	I didn't really fix them like the rest of the code, though. ]]

if not game.SinglePlayer() then return end

hook.Add( "PreDrawHalos", "CPTBase_SCP_106Possession", function()
	local tb = {}
	local tb_point = {}
	for _, v in ipairs( ents.FindByClass( "prop_physics" ) ) do
		if v:GetNWBool( "SCP106_Point" ) then
			table.insert( tb_point, v )
		end
	end

	for _, ply in ipairs( player.GetAll() ) do
		if not IsValid( ply ) then return end
		if ply:GetNWBool( "CPTBase_IsPossessing" ) and ply:GetNWBool( "CPTBase_PossessedNPCClass" ) == "npc_cpt_scp_106" then
			halo.Add( tb_point, haloColor106, 4, 4, 3, true, true )
			for _, others in ipairs( ents.GetAll() ) do
				if ( others:IsNPC() and others:GetClass() ~= "npc_cpt_scp_106" ) or ( others:IsPlayer() and others ~= v ) then
					for _, point in ipairs( tb_point ) do
						if others:GetPos():Distance( point:GetPos() ) <= 250 then
							table.insert( tb, others )
						else
							if tb[others] then
								tb[others] = nil
							end
						end
					end
				end
			end
			halo.Add( tb, haloColor106, 4, 4, 3, true, true )
		end
	end
end )

hook.Add( "RenderScreenspaceEffects", "CPTBase_SCP_079Possessor", function()
	local tbl = {}
	for _, ply in ipairs( player.GetAll() ) do
		if not IsValid( ply ) then return end
		if ply:GetNWBool( "CPTBase_IsPossessing" ) and string.find( ply:GetNWBool( "CPTBase_PossessedNPCClass" ), "scp_079" ) then
			for _, v in ipairs( ents.GetAll() ) do
				if IsValid( v ) and ( v:IsNPC() or v:IsPlayer() and v ~= ply ) then
					table.insert( tbl, v )
				end
			end
			-- if !(ply:GetNWBool("CPTBase_IsPossessing") && string.find(ply:GetNWBool("CPTBase_PossessedNPCClass"),"scp_079")) then return end
			halo.Add( tbl, haloColor079, 15, 15, 15, true, true )
		end
	end
end )

	-- Unused Functions --

--[[ local CPT_SCP_TBL_939_MOVERS = {}
	local CPT_SCP_TBL_939_MOVERNUM = 0
	hook.Add("PreDrawHalos","CPTBase_SCP_939Possession",function() -- Currently Disabled
		-- if !game.SinglePlayer() then return end
		-- for _,possessor in ipairs(player.GetAll()) do
			-- if IsValid(possessor) && possessor:GetNWBool("CPTBase_IsPossessing") == true && string.find(possessor:GetNWBool("CPTBase_PossessedNPCClass"),"scp_939") then
				-- print(possessor:Nick(),possessor:GetNWBool("CPTBase_IsPossessing"))
				-- for _,v in ipairs(player.GetAll()) do
					-- if IsValid(v) then
						-- if v:GetMoveType() == MOVETYPE_WALK && !v:Crouching() && (v:KeyDown(IN_FORWARD) or v:KeyDown(IN_BACK) or v:KeyDown(IN_MOVELEFT) or v:KeyDown(IN_MOVERIGHT) or v:KeyDown(IN_JUMP)) then
							-- CPT_SCP_TBL_939_MOVERNUM = CPT_SCP_TBL_939_MOVERNUM +1
							-- CPT_SCP_TBL_939_MOVERS[CPT_SCP_TBL_939_MOVERNUM] = v
							-- if IsValid(v:GetActiveWeapon()) then
								-- CPT_SCP_TBL_939_MOVERNUM = CPT_SCP_TBL_939_MOVERNUM +1
								-- CPT_SCP_TBL_939_MOVERS[CPT_SCP_TBL_939_MOVERNUM] = v:GetActiveWeapon()
							-- end
						-- end
					-- end
				-- end
				
				/*			-- for _,ply in ipairs(player.GetAll()) do
								if IsValid(ply) && ply:GetNWBool("CPTBase_IsPossessing") && string.find(ply:GetNWBool("CPTBase_PossessedNPCClass"),"scp_939") then
									v:SetNoDraw(false)
									if IsValid(v:GetActiveWeapon()) then
										v:GetActiveWeapon():SetNoDraw(false)
									end
								end
							end
						else
							for _,ply in ipairs(player.GetAll()) do
								if IsValid(ply) && ply:GetNWBool("CPTBase_IsPossessing") && string.find(ply:GetNWBool("CPTBase_PossessedNPCClass"),"scp_939") then
									v:SetNoDraw(true)
									if IsValid(v:GetActiveWeapon()) then
										v:GetActiveWeapon():SetNoDraw(true)
									end
								end
							end
						end
					end
				end*/

				-- for _,v in ipairs(ents.GetAll()) do
					-- if IsValid(v) && v:IsNPC() then
						-- if v:GetVelocity():Length() > 0 then
							-- if !string.find(v:GetClass(),"scp_939") then
								-- CPT_SCP_TBL_939_MOVERNUM = CPT_SCP_TBL_939_MOVERNUM +1
								-- CPT_SCP_TBL_939_MOVERS[CPT_SCP_TBL_939_MOVERNUM] = v
								-- if IsValid(v:GetActiveWeapon()) then
									-- CPT_SCP_TBL_939_MOVERNUM = CPT_SCP_TBL_939_MOVERNUM +1
									-- CPT_SCP_TBL_939_MOVERS[CPT_SCP_TBL_939_MOVERNUM] = v:GetActiveWeapon()
								-- end
							-- end
						-- end
					-- end
				-- end
				/*			-- for _,ply in ipairs(player.GetAll()) do
								if IsValid(ply) && ply:GetNWBool("CPTBase_IsPossessing") && string.find(ply:GetNWBool("CPTBase_PossessedNPCClass"),"scp_939") then
									v:SetNoDraw(false)
									if IsValid(v:GetActiveWeapon()) then
										v:GetActiveWeapon():SetNoDraw(false)
									end
								end
							end
						else
							for _,ply in ipairs(player.GetAll()) do
								if IsValid(ply) && ply:GetNWBool("CPTBase_IsPossessing") && string.find(ply:GetNWBool("CPTBase_PossessedNPCClass"),"scp_939") then
									if !string.find(v:GetClass(),"scp_939") then
										v:SetNoDraw(true)
										if IsValid(v:GetActiveWeapon()) then
											v:GetActiveWeapon():SetNoDraw(true)
										end
									end
								end
							end
						end
					end
				end

				for _,ply in ipairs(player.GetAll()) do
					if IsValid(ply) && ply:GetNWBool("CPTBase_IsPossessing") == true && string.find(ply:GetNWBool("CPTBase_PossessedNPCClass"),"scp_939") then
						halo.Add(CPT_SCP_TBL_939_MOVERS,Color(255,191,0),2,2,2,true,true)
					end
				end*/
				
				-- for _,move in ipairs(CPT_SCP_TBL_939_MOVERS) do
					-- if IsValid(move) then
						-- move:SetNoDraw(true)
					-- else
						-- table.remove(CPT_SCP_TBL_939_MOVERS,CPT_SCP_TBL_939_MOVERS[move])
					-- end
				-- end
				-- halo.Add(CPT_SCP_TBL_939_MOVERS,Color(255,191,0),2,2,2,true,true)
			-- end
		-- end
	end) ]]--

--[[ hook.Add("RenderScreenspaceEffects","CPTBase_SCP_DrainingBlur",function(ply)
	if CLIENT_SCP_PLANE == true then
		-- DrawMotionBlur(0.2,0.99,0.04)
		-- timer.Simple(2,function()
			-- hook.Remove("RenderScreenspaceEffects","CPTBase_SCP_DrainingBlur")
			-- hook.Call("CPTBase_SCP_DrainingBlur")
		-- end)
	end
end) ]]--

--[[ hook.Add("Think","CPTBase_SCP_178",function()
	-- if CLIENT_SCP_178 then
		-- if CurTime() > CLIENT_SCP_178SPAWNTIME && CLIENT_SCP_178SPAWNAMOUNT <= 10 then
			-- local ent = ents.Create("npc_cpt_scp_178")
			-- local pos = ent:SetClearPos(VectorRand())
			-- if util.IsInWorld(pos) then
				-- ent:Spawn()
				-- CLIENT_SCP_178SPAWNAMOUNT = CLIENT_SCP_178SPAWNAMOUNT +1
			-- end
			-- CLIENT_SCP_178SPAWNTIME = CurTime() +math.Rand(5,14)
		-- end
		-- for _,v in ipairs(ents.GetAll()) do
			-- if v:IsValid() && v:IsNPC() && v:GetClass() == "npc_cpt_scp_178" then
				-- v:SetNoDraw(false)
			-- end
		-- end
	-- else
		-- CLIENT_SCP_178SPAWNAMOUNT = 0
		-- for _,v in ipairs(ents.GetAll()) do
			-- if v:IsValid() && v:IsNPC() && v:GetClass() == "npc_cpt_scp_178" then
				-- v:SetNoDraw(true)
				-- timer.Simple(10,function()
					-- if IsValid(v) then
						-- v:Remove()
					-- end
				-- end)
			-- end
		-- end
	-- end
end) ]]--