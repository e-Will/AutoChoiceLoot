function AutoChoiceLoot.ToggleFrame(frame)
	if frame:IsVisible() then
		frame:Hide();
	else
		frame:Show();
	end
end


-- minimap button round moving
function AutoChoiceLoot.MoveMinimapButton()
	local xpos,ypos
	if AutoChoiceLootOptions.SquareMinimap=="ON" then
		xpos = 110 * cos(AutoChoiceLootOptions.IconPos or 0)
		ypos = 110 * sin(AutoChoiceLootOptions.IconPos or 0)
		xpos = math.max(-82,math.min(xpos,84))
		ypos = math.max(-86,math.min(ypos,82))
	else
		xpos = 80*cos(AutoChoiceLootOptions.IconPos or 0)
		ypos = 80*sin(AutoChoiceLootOptions.IconPos or 0)
	end
	AutoChoiceLoot_IconFrame:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-xpos,ypos-52)
	if AutoChoiceLootOptions.ShowIcon=="ON" then
		AutoChoiceLoot_IconFrame:Show()
	else
		AutoChoiceLoot_IconFrame:Hide()
	end
end

function AutoChoiceLoot.DragMinimapButton()
	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft() or 400, Minimap:GetBottom() or 400
	xpos = xmin-xpos/Minimap:GetEffectiveScale()+70
	ypos = ypos/Minimap:GetEffectiveScale()-ymin-70
	AutoChoiceLootOptions.IconPos = math.deg(math.atan2(ypos,xpos))
	AutoChoiceLoot.MoveMinimapButton()
end

function AutoChoiceLoot.MinimapButtonOnClick()
	PlaySound("GAMEGENERICBUTTONPRESS");
	if arg1=="LeftButton" then
		AutoChoiceLoot.ToggleFrame(AutoChoiceLootFrame);
	end
	
end