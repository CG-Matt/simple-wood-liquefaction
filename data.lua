data:extend(
{
	{
		type = "fluid",
		name = "liquefacted-wood",
		default_temperature = 150,
		fuel_value = "1.5MJ",
		base_color = {r=0.57, g=0.392, b=0.114},
		flow_color = {r=0.57, g=0.392, b=0.114},
		icon = "__simple-wood-liquefaction__/graphics/liquefacted-wood.png",
		icon_size = 64, icon_mipmaps = 4,
		-- pressure_to_speed_ratio = 0.4,
		-- flow_to_energy_ratio = 0.59,
		subgroup = "fluid",
		order = "w[wood]"
	},
	{
		type = "recipe",
		category = "chemistry",
		name = "wood-liquefaction",
		icon_size = 64, icon_mipmaps = 4,
		icon = "__simple-wood-liquefaction__/graphics/wood-liquefaction.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-d[wood-liquefaction]",
		enabled = false,
		energy_required = 3,
		crafting_machine_tint =
		{
			primary = {r=0.57, g=0.392, b=0.114, a=1.000},
			secondary = {r=0.57, g=0.392, b=0.114, a=1.000},
			tertiary = {r=0.57, g=0.392, b=0.114, a = 1.000},
			quaternary = {r=0.57, g=0.392, b=0.114, a = 1.000}
		},
		ingredients =
		{
			{type = "item", name = "wood", amount = 1},
			{type = "fluid", name = "steam", amount = 10}
		},
		results =
		{
			{type = "fluid", name = "liquefacted-wood", amount = 1}
		}
	},
	{
		type = "recipe",
		category = "chemistry",
		name = "solid-fuel-from-wood",
		icon_size = 64, icon_mipmaps = 4,
		icon = "__simple-wood-liquefaction__/graphics/solid-fuel-from-wood.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-f[solid-fuel-from-wood]",
		enabled = false,
		energy_required = 3,
		crafting_machine_tint =
		{
			primary = {r=0.57, g=0.392, b=0.114, a = 1.000},
			secondary = {r=0.57, g=0.392, b=0.114, a = 1.000},
			tertiary = {r=0.57, g=0.392, b=0.114, a = 1.000},
			quaternary = {r=0.57, g=0.392, b=0.114, a = 1.000}
		},
		ingredients =
		{
			{type = "fluid", name = "liquefacted-wood", amount = 5}
		},
		result = "solid-fuel"
	},
	{
		type = "technology",
		name = "wood-liquefaction",
		icon_size = 256, icon_mipmaps = 4,
		icon = "__base__/graphics/technology/oil-processing.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "wood-liquefaction"
			},
			{
				type = "unlock-recipe",
				recipe = "solid-fuel-from-wood"
			}
		},
		prerequisites = {"oil-processing"},
		unit =
		{
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30,
			count = 120
		},
		order = "w"
	}
})

if mods["matts-lib"] then
	data.raw.fluid["liquefacted-wood"].subgroup = "matts-fluids"
	data.raw.fluid["liquefacted-wood"].order = "i"
end