if not IsAddOnLoaded 'ls_Toasts' then
	return
end

local LS = unpack(ls_Toasts)

LS:RegisterSkin("rlst", {
		name = "rLST",
		template = "elv-no-art",
		border = {
			color = {0,0,0},
			texture = {0, 0, 0, 1},
		},
		icon_border = {
			color = {0,0,0,0},
		},
		dragon = {
		    hidden = true,
		  },
		icon_highlight = {
		    hidden = true,
		  },
		bg = {
				alliance = {0,0,0,0.9},
				archaeology = alliance,
				collection = alliance,
				default = alliance,
				dungeon = alliance,
				horde = alliance,
				legendary = alliance,
				legion = alliance,
				recipe = alliance,
				store = alliance,
				transmog = alliance,
				upgrade = alliance,
				worldquest = alliance,
			},
})
 
LS:RegisterSkin("rlst-colour", {
	name = "rLST (Colour)",
	template = "elv-no-art",
	icon_border = {
		color = {0,0,0,0},
	},
	dragon = {
			hidden = true,
		},
	icon_highlight = {
			hidden = true,
		},
	bg = {
			alliance = {0,0,0,0.9},
			archaeology = alliance,
			collection = alliance,
			default = alliance,
			dungeon = alliance,
			horde = alliance,
			legendary = alliance,
			legion = alliance,
			recipe = alliance,
			store = alliance,
			transmog = alliance,
			upgrade = alliance,
			worldquest = alliance,
		},
})
