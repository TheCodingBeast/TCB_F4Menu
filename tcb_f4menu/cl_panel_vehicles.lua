-- Variables
local PANEL = {}
local TCB_Scroll

-- Panel
function PANEL:Init()

	self:SetSize( 650 - 2, 620 - 2 )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

	end

	TCB_Scroll = vgui.Create( "tcb_panel_scroll", self )

	-- Fill Data
	self:FillData( TCB_Scroll )

end

-- Fill Data
function PANEL:FillData( parent )

	local StartYPos = 0

	local ItemTable = CustomVehicles
	for i, item in ipairs( ItemTable ) do

		CurrentItem = vgui.Create( "tcb_panel_item", parent )
		CurrentItem:SetPos( 0, StartYPos )

		CurrentItem:UpdateInfo( item, "vehicles", "vehicles" )

		StartYPos = StartYPos + CurrentItem:GetTall() + 11

	end

end

-- Refill Data
function PANEL:RefillData()

	-- Remove Items
	TCB_Scroll:Clear()

	-- Scroll Fix
	TCB_Scroll:ScrollFix()
	
	-- Fill Items
	self:FillData( TCB_Scroll )

end

-- Derma 
vgui.Register( "tcb_panel_vehicles", PANEL, "DPanel" )