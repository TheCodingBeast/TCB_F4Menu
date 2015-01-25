/*---------------------------------------------------------------------------
	
	Creator: TheCodingBeast - TheCodingBeast.com
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
	
---------------------------------------------------------------------------*/

-- Variables
local TCB = {}
local TCB_F4Frame

-- Menu (Open/Create)
function TCB:OpenF4Menu()
	if TCB_F4Frame and ValidPanel( TCB_F4Frame ) then
		
		-- Open
		TCB_F4Frame:SetVisible( true )
		TCB_F4Frame:Show()

		TCB_F4Frame.PanelReady = false
		
		TCB_F4Frame.ActivePanel:RefillData()

	else
 
		-- Create
		TCB_F4Frame = vgui.Create( "TCB_F4Menu" )

		-- Default Panel
		TCB_F4Frame:MakePanels( TCB_Settings.SidebarButtons[1]['panel'] )
		TCB_F4Frame.sidebuttons[1].Active = true

		-- Check Version
		TCB:CheckVersion()

		-- Update Panel
		if TCB_F4Frame.ActivePanel != nil then
			TCB_F4Frame.ActivePanel:RefillData()
		end
		
		-- Show
		TCB_F4Frame:SetVisible( true )
		TCB_F4Frame:Show()

	end
end
concommand.Add( "tcb_f4menu_open", function() TCB:OpenF4Menu() end )

-- Menu (Close)
function TCB:CloseF4Menu()
	if TCB_F4Frame then
		
		-- Hide
		TCB_F4Frame:SetVisible( false )
		TCB_F4Frame:Hide()

		-- Timer
		TCB_F4Frame.PanelReady = false

	else

		-- Create
		TCB:OpenF4Menu()

	end
end
concommand.Add( "tcb_f4menu_close", function() TCB:CloseF4Menu() end )

-- Handle ( Open / Close )
function TCB:HandleF4Menu()
	if not ValidPanel(TCB_F4Frame) or not TCB_F4Frame:IsVisible() then
		
		-- Open
		TCB:OpenF4Menu()

	else

		-- Close
		TCB:CloseF4Menu()

	end
end
hook.Add( TCB_Settings.ActivationKey1, "TCB.HandleF4Menu", TCB.HandleF4Menu)

-- Check Version 
function TCB:CheckVersion()
	if TCB_Settings.CheckVersion == true and TCB_F4Frame then

		http.Fetch( "https://raw.githubusercontent.com/TheCodingBeast/TCB_Version/master/tcb_f4menu.txt",

			function( body, len, headers, code ) 
				//Msg( body ) 
				TCB_F4Frame.StatusBar.NewVersion = tonumber(body)
			end, 

			function( error ) 

			end

		)

	end
end
timer.Create( "CheckVersionTimer", 300, 0, function() TCB:CheckVersion() end )