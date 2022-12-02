--[[--------------------------------------------------
	Copyright (c) 2018 by Cpt. Hazama, All rights reserved.
	Nothing in these files or/and code may be reproduced, adapted, merged or
	modified without prior written consent of the original author, Cpt. Hazama
--------------------------------------------------]]--

-- 079 -----------------------------------------------------------------------------------------------------------------
local tab_computer = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0.2,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

local blueTextColor = Color( 0, 161, 255, 255 )
local hudFont = "TargetID"
local tierPosX = 15

local CLIENT_SCP_PC = false
concommand.Add( "cpt_scp_togglepcvision", function( ply, cmd, args )
	CLIENT_SCP_PC = not CLIENT_SCP_PC
end )

hook.Add( "HUDPaint", "CPTBase_SCP079_HUD", function()
	if not CLIENT_SCP_PC then return end
	if not LocalPlayer():GetNWBool( "CPTBase_IsPossessing" ) then return end
	if LocalPlayer():GetNWBool( "CPTBase_IsPossessing" ) and LocalPlayer():GetNWString( "CPTBase_PossessedNPCClass" ) ~= "npc_cpt_scp_079" then return end
	local SCP079 = LocalPlayer():GetNWEntity( "CPTBase_PossessedNPC" )
	-- local SCP079
	-- for _,v in ipairs( ents.GetAll() ) do
		-- if v:GetClass() == "npc_cpt_scp_079" then
			-- SCP079 = v
			-- break
		-- end
	-- end
	if not IsValid( SCP079 ) then return end
	local iAux = SCP079:GetNWInt( "CPTBase_SCP079_AuxCount" )
	local iAuxMax = SCP079:GetNWInt( "CPTBase_SCP079_MaxAuxCount" )
	local iLocks = SCP079:GetNWInt( "CPTBase_SCP079_LockCount" )
	local iTier = SCP079:GetNWInt( "CPTBase_SCP079_Tier" )
	local iEXP = SCP079:GetNWInt( "CPTBase_SCP079_Experience" )
	local iEXPMax = SCP079:GetNWInt( "CPTBase_SCP079_ExperienceMax" )
	local bCooldown = SCP079:GetNWBool( "CPTBase_SCP079_OnCooldown" )

	draw.RoundedBox( 1, 10, 10, 230, 75, Color( 0, 0, 0, 200 ) )

	local auxText = "Auxiliary Power - " .. iAux .. " / " .. iAuxMax
	draw.SimpleText( auxText, hudFont, 15, 15, blueTextColor )

	local tierText = "Tier Level " .. iTier
	draw.SimpleText( tierText, hudFont, tierPosX, 30, blueTextColor )

	local tierText = "Experience - " .. math.Round(iEXP) .. " / " .. math.Round(iEXPMax)
	draw.SimpleText( tierText, hudFont, tierPosX, 45, blueTextColor )

	local tierText = "Locked Doors - " .. iLocks
	draw.SimpleText( tierText, hudFont, tierPosX, 60, blueTextColor )

	if bCooldown then
		local posX = ScrW() / 2
		local posY = ScrH() / 2
		surface.SetTexture( surface.GetTextureID( "overlay/079_delay" ) )
		surface.SetDrawColor( blueTextColor:Unpack() )
		surface.DrawTexturedRectRotated( posX, posY, 100, 100, 0 )
	end
end)
----------------------------------------------------------------------------------------------------------------------------

-- Red vision -----------------------------------------------------------------------------------------------------------------
local tab_redvis = {
	["$pp_colour_addr"] = 0.02,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 3,
	["$pp_colour_mulr"] = 100,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}
----------------------------------------------------------------------------------------------------------------------------

-- Grey vision -----------------------------------------------------------------------------------------------------------------
local tab_greyvis = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = -0.2,
	["$pp_colour_contrast"] = 8,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}
----------------------------------------------------------------------------------------------------------------------------

-- 106 vision -----------------------------------------------------------------------------------------------------------------
local tab_106vis = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0.02,
	["$pp_colour_brightness"] = -0.2,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 100
}
----------------------------------------------------------------------------------------------------------------------------

-- zombie vision -----------------------------------------------------------------------------------------------------------------
local tab_zomvis = {
	["$pp_colour_addr"] = 0.02,
	["$pp_colour_addg"] = 0.02,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = -0.2,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 100,
	["$pp_colour_mulg"] = 100,
	["$pp_colour_mulb"] = 0
}
----------------------------------------------------------------------------------------------------------------------------

-- 372 vision -----------------------------------------------------------------------------------------------------------------
local tab_372vis = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0.05,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = -0.2,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 50,
	["$pp_colour_mulb"] = 0
}
----------------------------------------------------------------------------------------------------------------------------

-- 457 vision -----------------------------------------------------------------------------------------------------------------
local tab_457vis = {
	["$pp_colour_addr"] = 0.06,
	["$pp_colour_addg"] = 0.06,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = -0.6,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 200,
	["$pp_colour_mulg"] = 200,
	["$pp_colour_mulb"] = 0
}
----------------------------------------------------------------------------------------------------------------------------

hook.Add( "RenderScreenspaceEffects", "CPTBase_SCP_RealVision", function( ply )
	if CLIENT_SCP_PC == true then
		DrawColorModify( tab_computer )
	end
end )