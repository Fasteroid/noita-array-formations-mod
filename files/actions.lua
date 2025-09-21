function array_cast(size) 
	draw_actions(size, true)
	add_projectile("mods/array_formations/files/array.xml")
	c.spread_degrees = c.spread_degrees - 12.0
end

table.insert( actions,
{
    id                 = "ARRAY_2",
    name               = "$action_array_2",
    description        = "$actiondesc_array_2",
    sprite             = "mods/array_formations/files/array_2.png",
	type 			   = ACTION_TYPE_DRAW_MANY,
	spawn_level        = "0,1,2,3,4,5,6", -- BURST_2
	spawn_probability  = "0.6,0.7,0.8,0.8,0.8,0.8,0.8", -- BURST_2
	price = 160,
	mana = 2,
	--max_uses = 100,
	action = function()
		array_cast(2)
	end,
} )

table.insert( actions,
{
    id                 = "ARRAY_4",
    name               = "$action_array_4",
    description        = "$actiondesc_array_4",
    sprite             = "mods/array_formations/files/array_4.png",
	type 			   = ACTION_TYPE_DRAW_MANY,
	spawn_level        = "2,3,4,5,6", -- BURST_4
	spawn_probability  = "0.4,0.5,0.6,0.6,0.6", -- BURST_4
	price = 200,
	mana = 8,
	--max_uses = 100,
	action = function()
		array_cast(4)
	end,
} )

table.insert( actions,
{
    id                  = "ARRAY_8",
    name                = "$action_array_8",
    description         = "$actiondesc_array_8",
    sprite              = "mods/array_formations/files/array_8.png",
	spawn_requires_flag = "card_unlocked_musicbox",
	type 			    = ACTION_TYPE_DRAW_MANY,
	spawn_level         = "5,6,10", -- BURST_8
	spawn_probability   = "0.1,0.1,0.5", -- BURST_8
	price = 320,
	mana = 40,
	--max_uses = 100,
	action = function()
		array_cast(8)
	end,
} )