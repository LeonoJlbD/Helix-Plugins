
local PLUGIN = PLUGIN


PLUGIN.name = "Binds"

PLUGIN.author = "LeonoJlbD"

PLUGIN.description = "A little binds for easiest gameplay."


-- Auto-walking
local keyWalk = KEY_J  -- <== Just put your key here

-- Toggle third person
local keyToggle = KEY_P -- <== Just put your key here

local keyStop = {

	IN_FORWARD,

	IN_BACK,

	IN_MOVELEFT,

	IN_MOVERIGHT

}


function PLUGIN:PlayerButtonDown(client, button)


	if (button == keyWalk and (!client.keyWalk or client.keyWalk <= CurTime())) then

		client.moving = !client.moving

		client.keyWalk = CurTime() + 0.1

	end


	if (CLIENT) then

		if (button == keyToggle and (!client.keyToggle or client.keyToggle <= CurTime())) then

			client:ConCommand("ix_togglethirdperson")

			client.keyToggle = CurTime() + 0.1

		end

	 end	

end


function PLUGIN:SetupMove(client, moveData, cmdData)


	if (!client.moving) then return end

	if (ix.fights and client:GetFight()) then

		client.moving = nil

		return

	end

	moveData:SetForwardSpeed(moveData:GetMaxSpeed())


	for _, v in pairs(keyStop) do

		if (cmdData:KeyDown(v)) then

			client.moving = nil

		end

	end

end