-- Variables
TCB_Settings = {}

-- >> Simple Settings

-- Settings
TCB_Settings.ActivationKey1 = "ShowSpare2"		// F1 (ShowHelp), 	F2 (ShowTeam), 	F3 (ShowSpare1), 	F4 (ShowSpare2)
TCB_Settings.ActivationKey2	= KEY_F4			// F1 (KEY_F1), 	F2 (KEY_F2), 	F3 (KEY_F3), 		F4 (KEY_F4)

TCB_Settings.CheckVersion	= true

TCB_Settings.TitleOne		= "Server Name"
TCB_Settings.TitleTwo		= "Subtitle Here!"

TCB_Settings.PrimaryColor	= Color( 52, 152, 219, 255 )
TCB_Settings.SecondaryColor	= Color( 41, 128, 185, 255 )

-- Custom Web Panels (If Enabled Below)
TCB_Settings.WebPanel_1		= "http://www.thecodingbeast.com"
TCB_Settings.WebPanel_2		= "http://www.thecodingbeast.com"
TCB_Settings.WebPanel_3		= "http://www.thecodingbeast.com"
TCB_Settings.WebPanel_4		= "http://www.thecodingbeast.com" 



-- >> Advanced Settings

-- Button Variables
TCB_Settings.JobsCount 		= #RPExtraTeams
TCB_Settings.EntitiesCount 	= #DarkRPEntities
TCB_Settings.WeaponsCount 	= 0 
TCB_Settings.ShipmentCount 	= 0 
TCB_Settings.AmmoCount 		= #GAMEMODE.AmmoTypes
TCB_Settings.VehiclesCount 	= "vehicles"

for k,v in ipairs(CustomShipments) do
	if v['seperate'] then
		TCB_Settings.WeaponsCount 	= TCB_Settings.WeaponsCount 	+ 1
	end
	if !v['noship'] then
		TCB_Settings.ShipmentCount 	= TCB_Settings.ShipmentCount 	+ 1
	end
end

-- Buttons
TCB_Settings.SidebarButtons = {
	
	{ text = "Commands", 	panel = "tcb_panel_commands", 	info = true, 	func = 6							},

	{ text = "Divider",		panel = "",						info = false,	func = 0 							},

	{ text = "Forum",		panel = "tcb_panel_custom1",	info = false,	func = 0 							},
	{ text = "Rules",		panel = "tcb_panel_custom2",	info = false,	func = 0 							},
	{ text = "Shop",		panel = "tcb_panel_custom3",	info = false,	func = 0 							},
	{ text = "Staff",		panel = "tcb_panel_custom4",	info = false,	func = 0 							},

	{ text = "Divider",		panel = "",						info = false,	func = 0 							},

	{ text = "Jobs", 		panel = "tcb_panel_jobs",		info = true,	func = TCB_Settings.JobsCount  		},
	{ text = "Entities",	panel = "tcb_panel_entities",	info = true,	func = TCB_Settings.EntitiesCount	},
	{ text = "Weapons",		panel = "tcb_panel_guns",		info = true,	func = TCB_Settings.WeaponsCount	},
	{ text = "Shipments",	panel = "tcb_panel_shipments",	info = true,	func = TCB_Settings.ShipmentCount 	},
	{ text = "Ammo",		panel = "tcb_panel_ammo",		info = true,	func = TCB_Settings.AmmoCount 		},
	{ text = "Vehicles",	panel = "tcb_panel_vehicles",	info = true,	func = TCB_Settings.VehiclesCount	},

}

-- Version (Don't Change)
TCB_Settings.Version 		= "1.0"