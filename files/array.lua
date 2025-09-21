-- most of this is stolen from data/scripts/projectiles/megalaser_launch.lua

dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/gun.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y, rot = EntityGetTransform( entity_id )

-- velocity
local vel_x,vel_y = GameGetVelocityCompVelocity(entity_id)
vel_x, vel_y = vec_normalize(vel_x, vel_y)
if vel_x == nil then return end


local offset_x, offset_y = vec_normalize(vel_x, vel_y)
offset_x, offset_y = vec_rotate(offset_x, offset_y, math.pi*0.5) -- perpendicular to flight direction

-- enable and launch up to 5 parallel projectiles
local beams = EntityGetInRadiusWithTag( pos_x, pos_y, 5, "array_slave" )

if( beams ~= nil ) then
    
    local stepSize = 4
    local width    = #beams * 2
    local offset   = -width / 2 - #beams / 4

	for i=1, #beams do
		local beam = beams[i]

    	-- enable all components
		local temp_all_components = EntityGetAllComponents(beam)
		if( temp_all_components ~= nil ) then
			for _,comp in pairs(temp_all_components) do
				EntitySetComponentIsEnabled(beam,comp,true)
			end
		end

		-- placement
		local x = pos_x + offset_x * offset
		local y = pos_y + offset_y * offset
		EntitySetTransform(beam, x, y, rot)
        EntityRemoveTag(beam, "array_slave")

		offset = offset + stepSize
	end

end
