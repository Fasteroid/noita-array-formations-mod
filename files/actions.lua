function array_cast(size) 
	draw_actions(size, true)
	add_projectile("mods/array_formations/files/array.xml")
end

table.insert( actions,
{
    id                 = "ARRAY_2",
    name               = "$action_array_2",
    description        = "$actiondesc_array_2",
    sprite             = "mods/array_formations/files/array_2.png",
	type 			   = ACTION_TYPE_DRAW_MANY,
	spawn_level        = "1,2,3,4,5,6",             -- BURST_3
	spawn_probability  = "0.5,0.6,0.7,0.7,0.7,0.7", -- BURST_3
	price = 180,
	mana = 6,
	--max_uses = 100,
	action = function()
		c.spread_degrees = c.spread_degrees - 6.0
		array_cast(2)
	end,
} )

table.insert( actions,
{
    id                 = "ARRAY_3",
    name               = "$action_array_3",
    description        = "$actiondesc_array_3",
    sprite             = "mods/array_formations/files/array_3.png",
	type 			   = ACTION_TYPE_DRAW_MANY,
	spawn_level        = "2,3,4,5,6",           -- BURST_4
	spawn_probability  = "0.3,0.4,0.6,0.6,0.6", -- BURST_4
	price = 220,
	mana = 9,
	--max_uses = 100,
	action = function()
		c.spread_degrees = c.spread_degrees - 9.0
		array_cast(3)
	end,
} )

table.insert( actions,
{
    id                 = "ARRAY_4",
    name               = "$action_array_4",
    description        = "$actiondesc_array_4",
    sprite             = "mods/array_formations/files/array_4.png",
	type 			   = ACTION_TYPE_DRAW_MANY,
	spawn_level        = "3,4,5,6",         -- BURST_5?
	spawn_probability  = "0.3,0.4,0.5,0.5", -- BURST_5?
	price = 220,
	mana = 12,
	--max_uses = 100,
	action = function()
		c.spread_degrees = c.spread_degrees - 12.0
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
	price = 400,
	mana = 48,
	--max_uses = 100,
	action = function()
		c.spread_degrees = c.spread_degrees - 24.0
		array_cast(8)
	end,
} )