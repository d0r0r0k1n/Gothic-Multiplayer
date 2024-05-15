-- THIS IS PRIMITIVE CODE OF SELECTION MENU - I'LL TRY TO REWRITE IT SOMEDAY

SelectionMenu = { Draw = {}, DrawInfo = {}, DrawSelected = {}, Text = {}, TextInfo = {} }

-- CREATES STUFF NEEDED TO USE ALL BELOW
function StartFrames()
	for i = 0, GetMaxPlayers() - 1 do
		Player[i] = {};
		Player[i].isMenuShowing = false;
		Player[i].currentMenu = false;
		Player[i].selectedOption = 1;
	end
end

function StopFrames(playerid)
	Player[playerid].isMenuShowing = false;
	Player[playerid].currentMenu = false;
	Player[playerid].selectedOption = 1;
end

-- CREATES SELECTION MENU(THE PARENT OF OPTIONS)
function CreateSelectionMenu(x, y, width, height, font)
	if not x or not y or not width or not height or not font then
		return false
	end
	
	local count = #SelectionMenu + 1
	
	SelectionMenu[count] = { Draw = {}, DrawInfo = {}, DrawSelected = {}, Text = {}, TextInfo = {} }
	
	local fx = x - 120
	local y = 550
	local height = fx + 270
	
	SelectionMenu[count].frame = CreateTexture(fx,y,width,height,"Frame_GMPA.TGA");
	SelectionMenu[count].count = count;
	SelectionMenu[count].x = x ; SelectionMenu[count].y = y ; SelectionMenu[count].font = font ;
	
	return SelectionMenu[count]
end

-- DESTROYS AN OPTION BY INDEX
function DestroySelectionMenu(selectionmenu)
	local index = selectionmenu.count
	DestroyTexture(SelectionMenu[index].frame)
	for i, option in ipairs(SelectionMenu[index].Draw) do
		DestroyDraw(option)
	end
	for i, s_option in ipairs(SelectionMenu[index].DrawSelected) do
		DestroyDraw(s_option)
	end
	table.remove(SelectionMenu, index)
end

-- CREATES AN OPTION IN SPECIFIED SELECTION MENU
function CreateOption(selectionmenu, name, font, red, green, blue, red_s, green_s, blue_s)

	if not selectionmenu or not name or not font or not red or not green or not blue or not red_s
	 or not green_s or not blue_s then
		return false
	end
	
	-- dodaj jeden
	local count = #selectionmenu.Draw + 1
	
	-- przesun w dol
	
	selectionmenu.y = selectionmenu.y + 150
	local x = selectionmenu.x
	local y = selectionmenu.y
	
	
	selectionmenu.Draw[count] = CreateDraw(x,y,name,font,red,green,blue);
	-- dla SetOptionName
	selectionmenu.DrawInfo[count] = {}
	selectionmenu.DrawInfo[count].self = selectionmenu.Draw[count]
	selectionmenu.DrawInfo[count].x = x
	selectionmenu.DrawInfo[count].y = y
	selectionmenu.DrawInfo[count].font = font
	selectionmenu.DrawInfo[count].r = red ; selectionmenu.DrawInfo[count].g = green ; selectionmenu.DrawInfo[count].b = blue
	selectionmenu.DrawSelected[count] = CreateDraw(x,y,name,font,red_s,green_s,blue_s);
	
	selectionmenu.DrawInfo[count].selected = selectionmenu.DrawSelected[count] -- for setopname also
	selectionmenu.DrawInfo[count].r2 = red_s ; selectionmenu.DrawInfo[count].g2 = green_s ; selectionmenu.DrawInfo[count].b2 = blue_s
	
	return selectionmenu.DrawInfo[count]
end

-- SETS NEW NAME FOR SPECIFIED OPTION
function SetOptionName(option, name)
	if not option or not name then return false end
	local selected = option.selected ; local x = option.x ;
	local self = option.self ;
	local y = option.y ; local name = tostring(name) ; local font = option.font ;
	local r, g, b = option.r, option.g, option.b ;
	local r2, g2, b2 = option.r2, option.g2, option.b2 ;
	UpdateDraw(self, x, y, name, font, r, g, b)
	UpdateDraw(selected, x, y, name, font, r2, g2, b2)
	return true
end

-- CREATES TEXT, TEXTS ARE IGNORED BY SELECTION MENU'S OPTIONS
function CreateText(selectionmenu, name, font, red, green, blue)
	if not selectionmenu or not name or not font or not red or not green or not blue then
		return false
	end
	
	local count = #selectionmenu.Text + 1
	
	selectionmenu.y = selectionmenu.y + 50
	local x = selectionmenu.x
	local y = selectionmenu.y
	
	selectionmenu.Text[count] = CreateDraw(x,y,name,font,red,green,blue);
	
	-- для settextname
	
	selectionmenu.TextInfo[count] = {}
	selectionmenu.TextInfo[count].self = selectionmenu.Text[count]
	selectionmenu.TextInfo[count].x = x
	selectionmenu.TextInfo[count].y = y
	selectionmenu.TextInfo[count].font = font
	selectionmenu.TextInfo[count].r = red ; selectionmenu.TextInfo[count].g = green ; selectionmenu.TextInfo[count].b = blue
	
	return selectionmenu.TextInfo[count]
end

-- SETS NEW NAME FOR SPECIFIED TEXT
function SetTextName(text, name)
	if not text or not name then return false end
	local self = text.self
	local x = text.x ; local y = text.y
	local name = tostring(name) ; local font = text.font
	local r, g, b = text.r, text.g, text.b
	UpdateDraw(self, x, y, name, font, r, g, b)
	return true
end

-- GETS THE NUMBER OF ALL CREATED SELECTION MENUS
function GetSelectionMenus()
	return #SelectionMenu
end

-- GETS THE NUMBER OF ALL CREATED OPTIONS IN SPECIFIED SELECTION MENU
function GetSelectionMenuOptions(selectionmenu)
	return #selectionmenu.Draw
end

-- GETS THE NUMBER OF ALL CREATED TEXTS IN SPECIFIED SELECTION MENU
function GetSelectionMenuTexts(selectionmenu)
	return #selectionmenu.Text
end

-- GETS THE NUMBER OF CURRENTLY SELECTED OPTION
function GetSelectedOption(playerid)
	local selectedOption = Player[playerid].selectedOption
	if selectedOption then
		return selectedOption
	else
		return false
	end
end

-- SHOWS SPECIFIED SELECTION MENU
function ShowSelectionMenu(playerid, selectionmenu)
	Player[playerid].isMenuShowing = true
	Player[playerid].currentMenu = selectionmenu
	Player[playerid].selectedOption = 1 -- SET SELECTED OPTION TO 1 EVERY SHOW
	
	-- показать рамку
	ShowTexture(playerid, selectionmenu.frame)
	
	local selectedOption = Player[playerid].selectedOption
	FreezePlayer(playerid, 1);
	if GetSelectionMenuOptions(selectionmenu) > 0 then
		for i = 1, GetSelectionMenuOptions(selectionmenu) do
			ShowDraw(playerid,selectionmenu.Draw[i]);
		end
		HideDraw(playerid,selectionmenu.Draw[selectedOption]);
		ShowDraw(playerid,selectionmenu.DrawSelected[selectedOption]);
	end
	
	-- показать текст
	if GetSelectionMenuTexts(selectionmenu) > 0 then
		for i = 1, GetSelectionMenuTexts(selectionmenu) do
			ShowDraw(playerid,selectionmenu.Text[i]);
		end
	end
	
end

-- HIDES SPECIFIED SELECTION MENU
function HideSelectionMenu(playerid, selectionmenu)
	Player[playerid].isMenuShowing = false
	Player[playerid].currentMenu = false
	Player[playerid].selectedOption = 1 -- SET SELECTED OPTION TO 1 EVERY HIDE
	
	-- скрыть рамку
	HideTexture(playerid, selectionmenu.frame)
	
	FreezePlayer(playerid, 0);
	if GetSelectionMenuOptions(selectionmenu) > 0 then
		for i = 1, GetSelectionMenuOptions(selectionmenu) do
			HideDraw(playerid,selectionmenu.Draw[i]);
			HideDraw(playerid,selectionmenu.DrawSelected[i]);
		end
	end
	
	-- скрыть текст
	if GetSelectionMenuTexts(selectionmenu) > 0 then
		for i = 1, GetSelectionMenuTexts(selectionmenu) do
			HideDraw(playerid,selectionmenu.Text[i]);
		end
	end
		
end

-- CHECKS IF ANY MENU IS SHOWING FOR SPECIFIED PLAYER
function IsMenuShowing(playerid)
	local isShowing = Player[playerid].isMenuShowing
	if isShowing ~= nil and isShowing ~= false then -- если меню ещё показывается
		return true
	else
		return false
	end
end

-- RETURNS THE ACTIVE MENU OF SPECIFIED PLAYER
function GetActiveMenu(playerid)
	if Player[playerid].currentMenu ~= nil and Player[playerid].currentMenu ~= false then
		return Player[playerid].currentMenu
	else
		return false
	end
end

-- SWITCHES OPTION DOWN IN SPECIFIED SELECTION MENU
function SwitchOptionDown(playerid, selectionmenu)
	if IsMenuShowing(playerid) then
		local selectedOption = Player[playerid].selectedOption
		
		if selectedOption < GetSelectionMenuOptions(selectionmenu) then
			HideDraw(playerid, selectionmenu.DrawSelected[selectedOption]);
			ShowDraw(playerid, selectionmenu.Draw[selectedOption]);
			
			HideDraw(playerid,selectionmenu.Draw[selectedOption + 1]);
			ShowDraw(playerid,selectionmenu.DrawSelected[selectedOption + 1]);
			
			Player[playerid].selectedOption = selectedOption + 1;
			Player[playerid].currentMenu = selectionmenu
			local s_option = GetSelectedOption(playerid)
			OnSelectionChanged(playerid, s_option)
			
		elseif selectedOption == GetSelectionMenuOptions(selectionmenu) then
			-- вернуться к началу
			HideDraw(playerid, selectionmenu.DrawSelected[selectedOption]);
			ShowDraw(playerid, selectionmenu.Draw[selectedOption]);
			
			Player[playerid].selectedOption = 1
			
			HideDraw(playerid,selectionmenu.Draw[Player[playerid].selectedOption]);
			ShowDraw(playerid,selectionmenu.DrawSelected[Player[playerid].selectedOption]);
		end
	end
end

-- SWITCHES OPTION UP IN SPECIFIED SELECTION MENU
function SwitchOptionUp(playerid, selectionmenu)
	if IsMenuShowing(playerid) then
		local selectedOption = Player[playerid].selectedOption
		if selectedOption > 1 then
			HideDraw(playerid, selectionmenu.DrawSelected[selectedOption]);
			ShowDraw(playerid, selectionmenu.Draw[selectedOption]);
			
			HideDraw(playerid,selectionmenu.Draw[selectedOption - 1]);
			ShowDraw(playerid,selectionmenu.DrawSelected[selectedOption - 1]);
			
			Player[playerid].selectedOption = selectedOption - 1;
			Player[playerid].currentMenu = selectionmenu
			local s_option = GetSelectedOption(playerid)
			OnSelectionChanged(playerid, s_option)
		elseif selectedOption == 1 then
			-- пролистать до конца
			HideDraw(playerid, selectionmenu.DrawSelected[selectedOption]);
			ShowDraw(playerid, selectionmenu.Draw[selectedOption]);
			
			Player[playerid].selectedOption = GetSelectionMenuOptions(selectionmenu);
			
			HideDraw(playerid,selectionmenu.Draw[Player[playerid].selectedOption]);
			ShowDraw(playerid,selectionmenu.DrawSelected[Player[playerid].selectedOption]);
		end
	end
end

