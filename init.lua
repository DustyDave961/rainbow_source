
local source_list = {
	{"black", "Darkened", "292421",}, {"blue", "Blue", "0000FF",},
	{"cyan", "Cyan", "00FFFF",}, {"green", "Green", "00FF00",}, 
	{"magenta", "Magenta", "FF00FF",}, {"orange", "Orange", "FF6103",}, 
	{"purple", "Purple", "800080",}, {"red", "Red", "FF0000",}, 
	{"yellow", "Yellow", "FFFF00",}, {"frosted", "Frosted", "FFFFFF",}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local description = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node("rainbow_source:"..name.."_water_source", {
		description = description.." Water Source",
		drawtype = "liquid",
		tiles = {
			{
				name = "default_water_source_animated.png^[colorize:#"..colour..":122",
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
		},
		special_tiles = {
			{
				name = "default_water_source_animated.png^[colorize:#"..colour..":122",
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
				backface_culling = false,
			},
		},
		alpha = 160,
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "rainbow_source:"..name.."_water_flowing",
		liquid_alternative_source = "rainbow_source:"..name.."_water_source",
		liquid_viscosity = 1,
		post_effect_color = {a = 103, r = 30, g = 60, b = 90},
		groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
		sounds = default.node_sound_water_defaults(),
	})

	minetest.register_node("rainbow_source:"..name.."_water_flowing", {
		description = description.." Flowing Water",
		drawtype = "flowingliquid",
		tiles = {"default_water.png^[colorize:#"..colour},
		special_tiles = {
			{
				name = "default_water_flowing_animated.png^[colorize:#"..colour..":122",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.8,
				},
			},
			{
				name = "default_water_flowing_animated.png^[colorize:#"..colour..":122",
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.8,
				},
			},
		},
		alpha = 160,
		paramtype = "light",
		paramtype2 = "flowingliquid",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "flowing",
		liquid_alternative_flowing = "rainbow_source:"..name.."_water_flowing",
		liquid_alternative_source = "rainbow_source:"..name.."_water_source",
		liquid_viscosity = 1,
		post_effect_color = {a = 103, r = 30, g = 60, b = 90},
		groups = {water = 3, liquid = 3, puts_out_fire = 1,
			not_in_creative_inventory = 1, cools_lava = 1},
		sounds = default.node_sound_water_defaults(),
	})








end
