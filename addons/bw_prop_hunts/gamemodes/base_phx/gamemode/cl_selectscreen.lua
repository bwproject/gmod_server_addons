
local CENTER_HEIGHT = 250
local PANEL = {}

function PANEL:Init()

	self:SetText( "" )
	self.Buttons = {}
	self.BottomButtons = {}
	self:SetSkin( GAMEMODE.HudSkin )

	self.IsForHelp = false

	self.pnlButtons = vgui.Create( "DPanelList", self )
	self.pnlButtons:SetPadding( 10 )
	self.pnlButtons:SetSpacing( 10 )
	self.pnlButtons:SetDrawBackground( false )
	self.pnlButtons:EnableVerticalScrollbar()

	self.lblMain = vgui.Create( "DLabel", self )
		self.lblMain:SetText( GAMEMODE.Name )
		self.lblMain:SetFont( "PHX.TitleFont" )
		self.lblMain:SetColor( color_white )

	self.pnlMain = vgui.Create( "DPanelList", self )
		self.pnlMain:SetNoSizing( true )
		self.pnlMain:SetDrawBackground( false )
		self.pnlMain:EnableVerticalScrollbar()

	self.btnCancel = vgui.Create( "DButton", self )
		self.btnCancel:SetText( PHX:FTranslate("MISC_CLOSE") or "Закрыть" )
		self.btnCancel:SetSize( 120, 32 )
		self.btnCancel:SetFont( "HudHintTextLarge" )
		self.btnCancel:SetFGColor( color_white )
		self.btnCancel.DoClick = function() self:Remove() end
		self.btnCancel:SetVisible( false )

	self.lblHoverText = vgui.Create( "RichText", self )
		self.lblHoverText:SetText( "" )
		self.lblHoverText:SetFGColor( color_white )
		self.lblHoverText:SetContentAlignment( 8 )

	self.lblFooterText = vgui.Create( "DLabel", self )
		self.lblFooterText:SetText( "" )
		self.lblFooterText:SetFont( "HudHintTextLarge" )
		self.lblFooterText:SetColor( Color(200,200,200) )
		self.lblFooterText:SetContentAlignment( 8 )
		self.lblFooterText:SetWrap( false )

	self.pnlMain:AddItem( self.lblHoverText )

	self:PerformLayout()
	self.OpenTime = SysTime()

end

function PANEL:NoFadeIn()
	self.OpenTime = 0
end

function PANEL:ClearSelectedPanel()

	self.pnlMain:Clear()
	self.pnlMain:AddItem( self.lblHoverText )

	for k, btn in pairs( self.BottomButtons ) do
		btn.m_bSelected = false
		if ( IsValid( btn.pPanel ) ) then
			btn.pPanel:SetVisible( false )
		end
	end

end

function PANEL:SetHeaderText( strName )
	self.lblMain:SetText( strName )
end

function PANEL:SetForHelp( strHelpText, ContribsText )

	self.lblHoverText:SetText( PHX:FTranslate("HELP_F1") or "Ошибка: справка не найдена." )

	timer.Simple(0, function()
		self.lblHoverText.PerformLayout = function(me)
			me:SetFontInternal("HudHintTextLarge")
		end
	end)

end

function PANEL:SetHoverText( strName )
	self.lblHoverText:SetText( strName or "" )
end

function PANEL:GetHoverText( strName )
	return self.lblHoverText:GetValue()
end

function PANEL:AddSelectButton( strName, fnFunction, txt )

	local btn = vgui.Create( "DButton", self.pnlButtons )
	btn:SetText( strName )
	btn:SetSize( 200, 40 )
	btn:SetFont( "HudHintTextLarge" )
	btn:SetTextColor( color_white )

	btn.Paint = function(self, w, h)
		if self:IsHovered() or self:GetSelected() then
			surface.SetDrawColor(200,150,12,220)
		else
			surface.SetDrawColor(40,40,40,220)
		end
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(200,150,12,80)
		surface.DrawRect(0, 0, 3, h)
	end

	btn.DoClick = function()
		fnFunction()
		surface.PlaySound( Sound("buttons/lightswitch2.wav") )
		self:Remove()
	end

	self.pnlButtons:AddItem( btn )
	table.insert( self.Buttons, btn )
	return btn

end

function PANEL:AddSpacer( h )

	local btn = vgui.Create( "Panel", self )
	btn:SetSize( 200, h )
	table.insert( self.Buttons, btn )
	return btn

end

function PANEL:AddCancelButton()
	self.btnCancel:SetVisible( true )
end

function PANEL:PerformLayout()

	self:SetSize( ScrW(), ScrH() )

	local CenterY = ScrH() / 2.0
	local CenterX = ScrW() / 2.0
	local InnerWidth = 640

	self.lblMain:SizeToContents()
	self.lblMain:SetPos( ScrW() * 0.5 - self.lblMain:GetWide() * 0.5, CenterY - CENTER_HEIGHT - self.lblMain:GetTall() * 1.2 )

	self.pnlButtons:SetPos( ScrW() * 0.5 - InnerWidth * 0.5, (CenterY - CENTER_HEIGHT) + 20 )
	self.pnlButtons:SetSize( 210, (CENTER_HEIGHT * 2) - self.btnCancel:GetTall() - 20 - 20 - 20 )

	self.btnCancel:SetPos( ScrW() * 0.5 + InnerWidth * 0.5 - self.btnCancel:GetWide(), CenterY + CENTER_HEIGHT - self.btnCancel:GetTall() - 20 )

	self.lblHoverText:SetPos( ScrW() * 0.5 - InnerWidth * 0.5 + 50, (CenterY - 150) )
	self.lblHoverText:SetSize( 300, 300 )

	self.pnlMain:SetPos( self.pnlButtons.x + self.pnlButtons:GetWide() + 10, self.pnlButtons.y )
	self.pnlMain:SetSize( InnerWidth - self.pnlButtons:GetWide() - 10, 400 )

	self.lblFooterText:SetSize( ScrW(), 30 )
	self.lblFooterText:SetPos( 0, CenterY + CENTER_HEIGHT + 10 )

	local x = self.pnlButtons.x
	for k, btn in pairs( self.BottomButtons ) do
		btn:SetPos( x, CenterY + CENTER_HEIGHT - btn:GetTall() - 20 )
		x = x + btn:GetWide() + 8
	end

end

function PANEL:Paint()

	Derma_DrawBackgroundBlur( self, self.OpenTime )

	local CenterY = ScrH() / 2.0
	local CenterX = ScrW() / 2.0
	local InnerWidth = 640

	-- Background overlay
	surface.SetDrawColor( 10, 10, 10, 230 )
	surface.DrawRect( 0, 0, ScrW(), ScrH() )

	-- Center card
	surface.SetDrawColor( 25, 25, 25, 240 )
	surface.DrawRect( CenterX - InnerWidth * 0.5 - 30, CenterY - CENTER_HEIGHT - 50, InnerWidth + 60, CENTER_HEIGHT * 2 + 100 )

	-- Gold accent line top
	surface.SetDrawColor( 200, 150, 12, 200 )
	surface.DrawRect( CenterX - InnerWidth * 0.5 - 30, CenterY - CENTER_HEIGHT - 50, InnerWidth + 60, 2 )

	-- Gold accent line bottom
	surface.DrawRect( CenterX - InnerWidth * 0.5 - 30, CenterY + CENTER_HEIGHT + 48, InnerWidth + 60, 2 )

end

GM.VGUISplash = {}
GM.VGUISplash = vgui.RegisterTable( PANEL, "DPanel" )
