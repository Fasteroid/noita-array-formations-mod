-- most of this is stolen from data/scripts/projectiles/megalaser_launch.lua

dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/gun.lua")

local ARRAY_TAG = "array_shot_member"

function main()

    print("spawned an array formation")

    local self    = GetUpdatedEntityID()
    local self_x, self_y = EntityGetTransform( self )

    local master_owner = nil
    local all_possible_projectiles = EntityGetInRadius( self_x, self_y, 100 )

    for i=1, #all_possible_projectiles do
        local victim = all_possible_projectiles[i]

        if EntityHasTag(victim, ARRAY_TAG) then goto continue_1 end

        local victim_comp = EntityGetFirstComponent( victim, "ProjectileComponent" )
        if( victim_comp == nil ) then goto continue_1 end

        local victim_owner = ComponentGetValue2( victim_comp, "mWhoShot" )
        if( victim_owner == nil or victim_owner == NULL_ENTITY ) then goto continue_1 end

        master_owner = victim_owner
        if true then break end

        ::continue_1::
    end

    local offset_x, offset_y = nil, nil
    local projectiles_we_want = {};

    for i=1, #all_possible_projectiles do
        local victim = all_possible_projectiles[i]

        local victim_comp = EntityGetFirstComponent( victim, "ProjectileComponent" )
        if not victim_comp then goto continue_2 end

        local victim_owner = ComponentGetValue2( victim_comp, "mWhoShot" )
        if victim_owner ~= master_owner then goto continue_2 end

        if EntityHasTag(victim, ARRAY_TAG) then goto continue_2 end
        EntityAddTag(victim, ARRAY_TAG)

        if( offset_x == nil ) then
            -- velocity
            local vel_x,vel_y = GameGetVelocityCompVelocity(victim)
            if vel_x == nil then goto continue_2 end
            vel_x, vel_y = vec_normalize(vel_x, vel_y)
            offset_x, offset_y = vec_rotate(vel_x, vel_y, math.pi*0.5) -- perpendicular to flight direction
            print("got offset", offset_x, offset_y)
        end

        table.insert(projectiles_we_want, victim)
        ::continue_2::
    end

    if( #projectiles_we_want == 0 ) then return end

    table.sort(projectiles_we_want)
        
    local stepSize = 3
    local offset   = -(#projectiles_we_want - 0.5) * stepSize / 2

    for i=1, #projectiles_we_want do
        local victim = projectiles_we_want[i]

        -- placement
        local x = self_x + offset_x * offset
        local y = self_y + offset_y * offset
        EntityApplyTransform(victim, x, y, rot)

        offset = offset + stepSize
    end
    
end

main()
