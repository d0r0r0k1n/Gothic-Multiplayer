print("Please wait...Loading");

local MAX_PLAYERS = GetMaxSlots(); 
local MAX_BOTS = GetMaxBots();

local version = "0.1"

local timedraw;
local Player = {};

local gVob;

local FD={};

PATH_FILE = "Items/";

--Craft
local Craft={}
function Craft_Init()
	MAX_CRAFT_MENU=3;
	for i=0, MAX_CRAFT_MENU-1 do
		Craft[i]={};
		Craft[i].menu_name="NULL";
		Craft[i].max_items=10;
		Craft[i].science=-1;		
		Craft[i].item={};
		for j=0, Craft[i].max_items-1 do
			Craft[i].item[j]={};
			Craft[i].item[j].name="NULL";
			Craft[i].item[j].instance="NULL";
			Craft[i].item[j].count=1;	
			Craft[i].item[j].max_ingredients=1;
			Craft[i].item[j].ingredient={};
			for v=0, 20 do
				Craft[i].item[j].ingredient[v]={};
				Craft[i].item[j].ingredient[v].instance="NULL";
				Craft[i].item[j].ingredient[v].name="NULL";
				Craft[i].item[j].ingredient[v].count=0;
			end
		end
	end
	
	Craft[0].menu_name="Воспом.";
	Craft[0].max_items=2;
	--
	Craft[0].item[0].instance="ITRW_ARROW";
	Craft[0].item[0].name="Стрела x2";
	Craft[0].item[0].max_ingredients=1;
	Craft[0].item[0].count=2;
	Craft[0].item[0].ingredient[0].instance="ITMI_WOOD";
	Craft[0].item[0].ingredient[0].name="Дерево";
	Craft[0].item[0].ingredient[0].count=1;
	--
	Craft[0].item[1].instance="ITRW_BOLT";
	Craft[0].item[1].name="Болт x2";
	Craft[0].item[1].max_ingredients=1;
	Craft[0].item[1].count=2;
	Craft[0].item[1].ingredient[0].instance="ITMI_WOOD";
	Craft[0].item[1].ingredient[0].name="Дерево";
	Craft[0].item[1].ingredient[0].count=1;
	
	Craft[2].menu_name="Еда";
	Craft[2].max_items=1;
	--
	Craft[2].item[0].instance="ITFOMUTTON";
	Craft[2].item[0].name="Жаренное мясо";
	Craft[2].item[0].max_ingredients=1;
	Craft[2].item[0].ingredient[0].instance="ITFOMUTTONRAW";
	Craft[2].item[0].ingredient[0].name="Мясо";
	Craft[2].item[0].ingredient[0].count=1;
	
	
	Craft[1].menu_name="Медицина";
	Craft[1].max_items=6;
	Craft[1].science=5;
	--
	Craft[1].item[0].instance="itpo_health_01";
	Craft[1].item[0].name="Эссенция ж.";
	Craft[1].item[0].max_ingredients=2;
	Craft[1].item[0].ingredient[0].instance="ItPl_Health_Herb_01";
	Craft[1].item[0].ingredient[0].name="Л. растение";
	Craft[1].item[0].ingredient[0].count=2;
	Craft[1].item[0].ingredient[1].instance="ITMI_FLASK";
	Craft[1].item[0].ingredient[1].name="Мензурка";
	Craft[1].item[0].ingredient[1].count=1;
	--
	Craft[1].item[1].instance="itpo_health_02";
	Craft[1].item[1].name="Экстракт ж.";
	Craft[1].item[1].max_ingredients=2;
	Craft[1].item[1].ingredient[0].instance="ItPl_Health_Herb_02";
	Craft[1].item[1].ingredient[0].name="Л. травы";
	Craft[1].item[1].ingredient[0].count=2;
	Craft[1].item[1].ingredient[1].instance="ITMI_FLASK";
	Craft[1].item[1].ingredient[1].name="Мензурка";
	Craft[1].item[1].ingredient[1].count=1;
	--
	--[[Craft[1].item[2].instance="itpo_health_03";
	Craft[1].item[2].name="Эликсир ж.";
	Craft[1].item[2].max_ingredients=2;
	Craft[1].item[2].ingredient[0].instance="ItPl_Health_Herb_03";
	Craft[1].item[2].ingredient[0].name="Л. корень";
	Craft[1].item[2].ingredient[0].count=2;
	Craft[1].item[2].ingredient[1].instance="ITMI_FLASK";
	Craft[1].item[2].ingredient[1].name="Мензурка";
	Craft[1].item[2].ingredient[1].count=1;]]
	--
	Craft[1].item[2].instance="ItPo_Mana_01";
	Craft[1].item[2].name="Эссенция маны";
	Craft[1].item[2].max_ingredients=2;
	Craft[1].item[2].ingredient[0].instance="ItPl_Mana_Herb_01";
	Craft[1].item[2].ingredient[0].name="О. крапива";
	Craft[1].item[2].ingredient[0].count=2;
	Craft[1].item[2].ingredient[1].instance="ITMI_FLASK";
	Craft[1].item[2].ingredient[1].name="Мензурка";
	Craft[1].item[2].ingredient[1].count=1;
	--
	Craft[1].item[3].instance="ItPo_Mana_02";
	Craft[1].item[3].name="Экстракт маны";
	Craft[1].item[3].max_ingredients=2;
	Craft[1].item[3].ingredient[0].instance="ItPl_Mana_Herb_02";
	Craft[1].item[3].ingredient[0].name="О. трава";
	Craft[1].item[3].ingredient[0].count=2;
	Craft[1].item[3].ingredient[1].instance="ITMI_FLASK";
	Craft[1].item[3].ingredient[1].name="Мензурка";
	Craft[1].item[3].ingredient[1].count=1;
	--
	--[[Craft[1].item[5].instance="ItPo_Mana_03";
	Craft[1].item[5].name="Эликсир маны";
	Craft[1].item[5].max_ingredients=2;
	Craft[1].item[5].ingredient[0].instance="ItPl_Mana_Herb_03";
	Craft[1].item[5].ingredient[0].name="О. корень";
	Craft[1].item[5].ingredient[0].count=2;
	Craft[1].item[5].ingredient[1].instance="ITMI_FLASK";
	Craft[1].item[5].ingredient[1].name="Мензурка";
	Craft[1].item[5].ingredient[1].count=1;]]
end

--Skinedit_Chairs
local Chairs = {};

function OnSelectionChanged(playerid, selectedoption)
	if IsMenuShowing(playerid) then
		--SendPlayerMessage(playerid, 255, 255, 255, "You have selected option " .. selectedoption)
	end
end

local my_checkid = 423;

--Callendar
local changing_day=0;
local day=1;
local month=1;
local year=879;
local days={31,28,31,30,31,30,31,31,30,31,30,31}
local months={"января","февраля","марта","апреля","мая","июня","июля","августа","сентября","октября","ноября","декабря"};

local MAX_PLAYERS = GetMaxSlots();
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
	
	SelectionMenu[count].frame = CreateTexture(fx,y,width,height,"DLG_CONVERSATION.TGA");
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
	
	-- добавить один пункт
	local count = #selectionmenu.Draw + 1
	
	-- перелестнуть вниз
	
	selectionmenu.y = selectionmenu.y + 150
	local x = selectionmenu.x
	local y = selectionmenu.y
	
	
	selectionmenu.Draw[count] = CreateDraw(x,y,name,font,red,green,blue);
	-- для SetOptionName
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
	
	-- show the frame
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
	
	-- показ текста
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
	
	-- показать текст
	if GetSelectionMenuTexts(selectionmenu) > 0 then
		for i = 1, GetSelectionMenuTexts(selectionmenu) do
			HideDraw(playerid,selectionmenu.Text[i]);
		end
	end
		
end

-- CHECKS IF ANY MENU IS SHOWING FOR SPECIFIED PLAYER
function IsMenuShowing(playerid)
	local isShowing = Player[playerid].isMenuShowing
	if isShowing ~= nil and isShowing ~= false then -- jesli menu sie pokazuje
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
			-- отменить полностью
			HideDraw(playerid, selectionmenu.DrawSelected[selectedOption]);
			ShowDraw(playerid, selectionmenu.Draw[selectedOption]);
			
			Player[playerid].selectedOption = GetSelectionMenuOptions(selectionmenu);
			
			HideDraw(playerid,selectionmenu.Draw[Player[playerid].selectedOption]);
			ShowDraw(playerid,selectionmenu.DrawSelected[Player[playerid].selectedOption]);
		end
	end
end



function OnSelectionConfirmed(playerid)
local namba = random(3);
	if IsMenuShowing(playerid) then
		local selectedOption = GetSelectedOption(playerid)
		local money = Player[playerid].bank
		
		--[[
		***********************
				БРОНЯ
		***********************
		]]
		if GetActiveMenu(playerid) == ArmorMenu then
			if selectedOption == 1 then
				if money >= 50 then
			local a = GetINI("armors.cfg", "ItAr_Bau_L")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 50
			GiveItem(playerid,"ItAr_Bau_L",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Bau_L", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Bau_L")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
			
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
			end
			
			elseif selectedOption == 2 then
				if money >= 160 then
				
			local a = GetINI("armors.cfg", "ItAr_Vlk_L")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 160
				GiveItem(playerid,"ItAr_Vlk_L",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Vlk_L", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Vlk_L")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 3 then
				if money >= 180 then
				
			local a = GetINI("armors.cfg", "ItAr_Vlk_M")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 180
				GiveItem(playerid,"ItAr_Vlk_M",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Vlk_M", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Vlk_M")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 4 then
				if money >= 210 then
				
			local a = GetINI("armors.cfg", "ItAr_Vlk_H")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 210
				GiveItem(playerid,"ItAr_Vlk_H",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Vlk_H", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Vlk_H")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 5 then
				if money >= 410 then
				
			local a = GetINI("armors.cfg", "ItAr_koza_L")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 410
				GiveItem(playerid,"ItAr_koza_L",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_koza_L", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_koza_L")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
			
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 6 then
				if money >= 460 then
				
			local a = GetINI("armors.cfg", "ItAr_Leather_L")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 460
				GiveItem(playerid,"ItAr_Leather_L",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Leather_L", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Leather_L")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 7 then
				if money >= 550 then
			local a = GetINI("armors.cfg", "ItAr_koza_m")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 550
				GiveItem(playerid,"ItAr_koza_m",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_koza_m", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_koza_m")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 8 then
				if money >= 600 then
				
			local a = GetINI("armors.cfg", "ItAr_Bdt_M")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 600
				GiveItem(playerid,"ItAr_Bdt_M",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Bdt_M", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Bdt_M")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				
			elseif selectedOption == 9 then
				if money >= 900 then
			local a = GetINI("armors.cfg", "ItAr_Bdt_H")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 900
				GiveItem(playerid,"ItAr_Bdt_H",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды было:",a));
			SetINI("armors.cfg", "ItAr_Bdt_H", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItAr_Bdt_H")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Одежды осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этой одежды"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				
elseif selectedOption == 10 then
				if money >= 540 then
				local a = GetINI("armors.cfg", "ItRw_Mil_Crossbow")
			if a > "0" then
				Player[playerid].bank = Player[playerid].bank - 540
				GiveItem(playerid,"ItRw_Mil_Crossbow",1);
				SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Луков было:",a));
			SetINI("armors.cfg", "ItRw_Mil_Crossbow", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItRw_Mil_Crossbow")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Луков осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого лука"));
			end
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
elseif selectedOption == 11 then
				if money >= 1120 then
				local a = GetINI("armors.cfg", "ItRw_Crossbow_M_01")
				if a > "0" then
				Player[playerid].bank = Player[playerid].bank - 1120
				GiveItem(playerid,"ItRw_Crossbow_M_01",1);
				SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Луков было:",a));
			SetINI("armors.cfg", "ItRw_Crossbow_M_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItRw_Crossbow_M_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Луков осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого лука"));
			end
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end				
elseif selectedOption == 12 then
				if money >= 400 then
				local a = GetINI("armors.cfg", "ItRw_Bow_L_03_Mis")
				if a > "0" then
				Player[playerid].bank = Player[playerid].bank - 400
				GiveItem(playerid,"ItRw_Bow_L_03_Mis",1);
				SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Арбалетов было:",a));
			SetINI("armors.cfg", "ItRw_Bow_L_03_Mis", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItRw_Bow_L_03_Mis")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Арбалетов осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого арбалета"));
			end
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
elseif selectedOption == 13 then
				if money >= 840 then
				local a = GetINI("armors.cfg", "ItRw_Bow_M_01")
				if a > "0" then
				Player[playerid].bank = Player[playerid].bank - 840
				GiveItem(playerid,"ItRw_Bow_M_01",1);
				SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Арбалетов было:",a));
			SetINI("armors.cfg", "ItRw_Bow_M_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ItRw_Bow_M_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Арбалетов осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого арбалета"));
			end
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				
elseif selectedOption == 14 then
				if money >= 5 then
				local a = GetINI("armors.cfg", "ITRW_ARROW")
				if a > "0" then
				Player[playerid].bank = Player[playerid].bank - 5
				GiveItem(playerid,"ITRW_ARROW",10);
				SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Связок с стрелами было:",a));
			SetINI("armors.cfg", "ITRW_ARROW", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ITRW_ARROW")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Связок с стрелами осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет связок с стрелами"));
			end
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				
elseif selectedOption == 15 then
				if money >= 5 then
				local a = GetINI("armors.cfg", "ITRW_BOLT")
				if a > "0" then
				Player[playerid].bank = Player[playerid].bank - 5
				GiveItem(playerid,"ITRW_BOLT",10);
				SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Связок с болтами было:",a));
			SetINI("armors.cfg", "ITRW_BOLT", a-1 );
			SaveAccount(playerid);
			local a = GetINI("armors.cfg", "ITRW_BOLT")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Связок с болтами осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет связок с болтами"));
			end
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end	
			
			elseif selectedOption == 16 then
				HideSelectionMenu(playerid, ArmorMenu)
			end
			
		--[[
		***********************
		  ОРУЖИЕ БЛИЖНЕГО БОЯ
		***********************
		]]
			
		elseif GetActiveMenu(playerid) == WeaponsMenu then
			if selectedOption == 1 then
				if money >= 210 then
				
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_01")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 210
				GiveItem(playerid,"ItMw_1H_Sword_Short_01",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Short_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 2 then
				if money >= 230 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_02")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 230
				GiveItem(playerid,"ItMw_1H_Sword_Short_02",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Short_02", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_02")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 3 then
				if money >= 250 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_04")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 250
				GiveItem(playerid,"ItMw_1H_Sword_Short_04",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Short_04", a-1 ); 
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_04")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 4 then
				if money >= 290 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_05")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 290
				GiveItem(playerid,"ItMw_1H_Sword_Short_05",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Short_05", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Short_05")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 5 then
				if money >= 380 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Mace_04")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 380
				GiveItem(playerid,"ItMw_1H_Mace_04",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Mace_04", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Mace_04")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 6 then
				if money >= 540 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_01")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 540
				GiveItem(playerid,"ItMw_1H_Sword_Bastard_01",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 7 then
				if money >= 600 then
				local a = GetINI("weapons.cfg", "ItMw_1H_Axe_02")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 600
				GiveItem(playerid,"ItMw_1H_Axe_02",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Axe_02", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Axe_02")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 8 then
				if money >= 720 then
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Broad_03")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 720
				GiveItem(playerid,"ItMw_1H_Sword_Broad_03",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Broad_03", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Broad_03")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 9 then
				if money >= 740 then
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Broad_04")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 740
				GiveItem(playerid,"ItMw_1H_Sword_Broad_04",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Broad_04", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Broad_04")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 10 then
				if money >= 790 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_02")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 790
				GiveItem(playerid,"ItMw_1H_Sword_Bastard_02",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_02", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_02")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 11 then
				if money >= 800 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_03")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 800
				GiveItem(playerid,"ItMw_1H_Sword_Bastard_03",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_03", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_03")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 12 then
				if money >= 830 then
				
				local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_04")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 830
				GiveItem(playerid,"ItMw_1H_Sword_Bastard_04",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_04", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_1H_Sword_Bastard_04")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 13 then
				if money >= 260 then
				
				local a = GetINI("weapons.cfg", "ItMw_2H_Staff_01")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 260
				GiveItem(playerid,"ItMw_2H_Staff_01",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_2H_Staff_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_2H_Staff_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 14 then
				if money >= 750 then
				
				local a = GetINI("weapons.cfg", "ItMw_2H_Axe_Old_01")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 750
				GiveItem(playerid,"ItMw_2H_Axe_Old_01",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_2H_Axe_Old_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_2H_Axe_Old_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 15 then
				if money >= 820 then
				
				local a = GetINI("weapons.cfg", "ItMw_2H_Sword_Light_02")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 820
				GiveItem(playerid,"ItMw_2H_Sword_Light_02",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия было:",a));
			SetINI("weapons.cfg", "ItMw_2H_Sword_Light_02", a-1 );
			SaveAccount(playerid);
			local a = GetINI("weapons.cfg", "ItMw_2H_Sword_Light_02")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Оружия осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого оружия"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 16 then
				HideSelectionMenu(playerid, WeaponsMenu)
			end
			
			--[[
		***********************
				АЛХИМИЯ
		***********************
		]]
			
		elseif GetActiveMenu(playerid) == AlchemyMenu then
			if selectedOption == 1 then
				if money >= 25 then
				
			local a = GetINI("alchemy.cfg", "ItPo_Health_01")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 25
				GiveItem(playerid,"ItPo_Health_01",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ItPo_Health_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ItPo_Health_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 2 then
				if money >= 35 then
				
				local a = GetINI("alchemy.cfg", "ItPo_Health_02")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 35
				GiveItem(playerid,"ItPo_Health_02",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ItPo_Health_02", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ItPo_Health_02")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 3 then
				if money >= 50 then
				
				local a = GetINI("alchemy.cfg", "ItPo_Health_03")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 50
				GiveItem(playerid,"ItPo_Health_03",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ItPo_Health_03", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ItPo_Health_03")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 4 then
				if money >= 20 then
				
				local a = GetINI("alchemy.cfg", "ItPo_Mana_01")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 20
				GiveItem(playerid,"ItPo_Mana_01",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ItPo_Mana_01", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ItPo_Mana_01")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 5 then
				if money >= 40 then
				
				local a = GetINI("alchemy.cfg", "ITPO_HEALHILDA_MIS")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 40
				GiveItem(playerid,"ITPO_HEALHILDA_MIS",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ITPO_HEALHILDA_MIS", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ITPO_HEALHILDA_MIS")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 6 then
				if money >= 40 then
				
				local a = GetINI("alchemy.cfg", "ITPO_HEALRANDOLPH_MIS")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 40
				GiveItem(playerid,"ITPO_HEALRANDOLPH_MIS",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ITPO_HEALRANDOLPH_MIS", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ITPO_HEALRANDOLPH_MIS")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 7 then
				if money >= 50 then
				
				local a = GetINI("alchemy.cfg", "ITPO_HEALOBSESSION_MIS")
			if a > "0" then
			Player[playerid].bank = Player[playerid].bank - 50
				GiveItem(playerid,"ITPO_HEALOBSESSION_MIS",1);
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий было:",a));
			SetINI("alchemy.cfg", "ITPO_HEALOBSESSION_MIS", a-1 );
			SaveAccount(playerid);
			local a = GetINI("alchemy.cfg", "ITPO_HEALOBSESSION_MIS")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Зелий осталось:",a));
			else
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет этого зелья"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 8 then
				HideSelectionMenu(playerid, AlchemyMenu)
			end
			
			--[[
		***********************
				ЕДА
		***********************
				]]
		
			elseif GetActiveMenu(playerid) == TradeMenu then
if selectedOption == 1 then -- 1 - номер пункта в меню
				if money >= 5 then -- 5 - цена				
				local a = GetINI("food.cfg", "ItFo_Apple") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 5 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Apple",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Яблок было:",a));
			SetINI("food.cfg", "ItFo_Apple", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Apple") -- снова вычисляем сколко осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Яблок осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет яблок"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 2 then -- 2 - номер пункта в меню
				if money >= 25 then -- 25 - цена				
				local a = GetINI("food.cfg", "ItFo_Cheese") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 25 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Cheese",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Сыра было:",a));
			SetINI("food.cfg", "ItFo_Cheese", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Cheese") -- снова вычисляем сколко осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Сыра осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет сыра"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 3 then -- 3 - номер пункта в меню
				if money >= 30 then -- 30 - цена				
				local a = GetINI("food.cfg", "ItFo_Bacon") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 30 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Bacon",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Окороков было:",a));
			SetINI("food.cfg", "ItFo_Bacon", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Bacon") -- снова вычисляем сколко осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Окороков осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет окороков"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 4 then -- 4 - номер пункта в меню
				if money >= 10 then -- 10 - цена				
				local a = GetINI("food.cfg", "ItFo_Bread") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 10 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Bread",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Хлеба было:",a));
			SetINI("food.cfg", "ItFo_Bread", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Bread") -- снова вычисляем сколко осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Хлеба осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет хлеба"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 5 then -- 5 - номер пункта в меню
				if money >= 7 then -- 7 - цена				
				local a = GetINI("food.cfg", "ItFo_Fish") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 7 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Fish",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы было:",a));
			SetINI("food.cfg", "ItFo_Fish", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Fish") -- снова вычисляем сколко осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет рыбы"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 6 then -- 6 - номер пункта в меню
				if money >= 30 then -- 30 - цена				
				local a = GetINI("food.cfg", "ItFo_Sausage") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 30 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Sausage",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Колбасы было:",a));
			SetINI("food.cfg", "ItFo_Sausage", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Sausage") -- снова вычисляем сколко осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Колбасы осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет колбасы"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 7 then -- 7 - номер пункта в меню
				if money >= 35 then -- 35 - цена				
				local a = GetINI("food.cfg", "ItFo_Wine") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 35 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Wine",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Вина было:",a));
			SetINI("food.cfg", "ItFo_Wine", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Wine") -- снова вычисляем сколько осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Вина осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет вина"));
			end
				
				else
				SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end				
elseif selectedOption == 8 then -- 8 - номер пункта в меню
				if money >= 15 then -- 15 - цена				
				local a = GetINI("food.cfg", "ItFo_Beer") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 15 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Beer",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива было:",a));
			SetINI("food.cfg", "ItFo_Beer", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Beer") -- снова вычисляем сколько осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет пива"));
			end
				
				else
				SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 9 then -- 9 - номер пункта в меню
				if money >= 15 then -- 15 - цена				
				local a = GetINI("food.cfg", "ItFo_Milk") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 15 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Milk",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Молока было:",a));
			SetINI("food.cfg", "ItFo_Milk", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Milk") -- снова вычисляем сколько осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Молока осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет молока"));
			end
				
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end
elseif selectedOption == 10 then -- 10 - номер пункта в меню
				if money >= 30 then -- 30 - цена				
				local a = GetINI("food.cfg", "ItFo_Stew") -- вычисляем сколько осталось на складе
			if a > "0" then -- условие: если на складе больше 0, тогда
			Player[playerid].bank = Player[playerid].bank - 30 -- вычитаем цену из кошелька игрока
			GiveItem(playerid,"ItFo_Stew",1); -- выдаем ему купленный предмет
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Похлебок было:",a));
			SetINI("food.cfg", "ItFo_Stew", a-1 );
			SaveAccount(playerid); -- вычитаем предмет со склада
			local a = GetINI("food.cfg", "ItFo_Stew") -- снова вычисляем сколько осталось
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Похлебок осталось:",a)); -- выводим
			else --иначе
			SendPlayerMessage(playerid,0,255,255,string.format("%s","К сожалению у торговца больше нет похлебок"));
			end
				
				else
				SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
end				
			elseif selectedOption == 11 then
				HideSelectionMenu(playerid, TradeMenu)
				end
				
				--[[
		***********************
			  ПЕРЕКУПЩИК
		***********************
				]]
		
			elseif GetActiveMenu(playerid) == ResselerMenu then
			if selectedOption == 1 then
				if money >= 10 then
				Player[playerid].bank = Player[playerid].bank - 10
				GiveItem(playerid,"ITMI_BROOM",1); --метла
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 2 then
				if money >= 15 then
				Player[playerid].bank = Player[playerid].bank - 15
				GiveItem(playerid,"ITMISWORDRAW",1); --сталь
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				elseif selectedOption == 3 then
				if money >= 35 then
				Player[playerid].bank = Player[playerid].bank - 35
				GiveItem(playerid,"ItMw_2H_Axe_L_01",1); --кирка
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				elseif selectedOption == 4 then
				if money >= 10 then
				Player[playerid].bank = Player[playerid].bank - 10
				GiveItem(playerid,"ITKE_LOCKPICK",1); --отмычка
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				elseif selectedOption == 5 then
				if money >= 70 then
				Player[playerid].bank = Player[playerid].bank - 70
				GiveItem(playerid,"ItMw_2H_Bau_Axe",1); --топор дровосека
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				elseif selectedOption == 6 then
				if money >= 10 then
				Player[playerid].bank = Player[playerid].bank - 10
				GiveItem(playerid,"ItMi_Scoop",1); --ложка
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 7 then
				HideSelectionMenu(playerid, ResselerMenu)
				end
				
				--[[
		***********************
				ТАНИС
		***********************
				]]
				elseif GetActiveMenu(playerid) == TanisMenu then
			if selectedOption == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Танис: Я Танис - охотник. Могу обучить тебя как нужно правильно красться."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		elseif selectedOption == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Танис: У меня все отлично. Хотя многие поговаривают, что я умер. Но это лишь слухи, хе-хе."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);	
		elseif selectedOption == 3 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Танис: Колония - место, с помощью которого мы одержим победу над орками!"),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);	
		elseif selectedOption == 4 then
		local science = GetPlayerScience(playerid,SCIENCE_SNEAKING);
			if science == 0 then
				if money >= 100 then
				Player[playerid].bank = Player[playerid].bank - 100
				SetPlayerScience(playerid,SCIENCE_SNEAKING,1);
				GameTextForPlayer(playerid,50,5500,string.format("%s","Танис учит вас подкрадыванию."),"FONT_OLD_10_WHITE_HI.TGA",0,255,0,2500);	
				else
				GameTextForPlayer(playerid,50,5500,string.format("%s","У Вас недостаточно денег!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);	
				end
			else
			GameTextForPlayer(playerid,50,5500,string.format("%s","Вы уже обучены подкрадыванию."),"FONT_OLD_10_WHITE_HI.TGA",255,255,0,2500);	
			end
		elseif selectedOption == 5 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Танис: Удачной охоты."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);	
		HideSelectionMenu(playerid, TanisMenu)
		end
		
		--[[
		***********************
				Горожане
		***********************
				]]

		elseif GetActiveMenu(playerid) == GorodMenu then
			if selectedOption == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Это наше наказание, чертова Колония."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		elseif selectedOption == 2 then
		if namba == 0 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Поговаривают, что горбатясь в шахте можно быстро состариться и подохнуть."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		elseif namba == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Королевские солдаты питаются мясом каждый день#недовольно#."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		elseif namba == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Похоже, что некоторые добровольно прутся сюда. Понятия не имею зачем."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		elseif namba == 3 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Бывшие правители колонии ошиваются где-то тут, будь осторожнее."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		end
		elseif selectedOption == 3 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Ты больной? Иди копай, придурок."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);		
		elseif selectedOption == 4 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Мы погибаем здесь. Лучше уж на войне помирать, чем так..."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		elseif selectedOption == 5 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Рудокоп: Береги себя."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		HideSelectionMenu(playerid, GorodMenu)
		end
		
					--[[
		***********************
				Ималин
		***********************
				]]
				elseif GetActiveMenu(playerid) == VorMenu then
			if selectedOption == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Ималин: Меня зовут Ималин. А ты можешь не представляться, мне насрать как тебя зовут."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		elseif selectedOption == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Ималин: Ты что, не видишь? Пошел вон с такими вопросами!"),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		elseif selectedOption == 3 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Ималин: Это тюрьма, придурок."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);		
		elseif selectedOption == 4 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Ималин: Проваливай уже."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		HideSelectionMenu(playerid, VorMenu)
		end
		
		--[[
		***********************
				Карлос
		***********************
				]]
				elseif GetActiveMenu(playerid) == PovarMenu then
			if selectedOption == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Я Карлос, разливаю пиво всем желающим при деньгах."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);	
		elseif selectedOption == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Все хорошо, пока в бочке есть пиво #ухмыляется#"),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);	
		elseif selectedOption == 3 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Центральная площадь Хориниса. Если ты хочешь выпить или перекусить - то ты пришел по нужному адресу."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);	
		elseif selectedOption == 4 then
		if money >= 8 then
		Player[playerid].bank = Player[playerid].bank - 8
		GiveItem(playerid,"ItFo_Stew",1);
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Вот. Ешь, пока горячая."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		else
			GameTextForPlayer(playerid,50,5500,string.format("%s","Недостаточно медных монет!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);
		end
		
		elseif selectedOption == 5 then
		if money >= 6 then
		Player[playerid].bank = Player[playerid].bank - 6
		GiveItem(playerid,"ItFo_FishSoup",1);
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Здесь рыбы полно, так что ухи хватит на всех."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		else
			GameTextForPlayer(playerid,50,5500,string.format("%s","Недостаточно медных монет!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);
		end
		
		elseif selectedOption == 6 then
		if money >= 5 then
		Player[playerid].bank = Player[playerid].bank - 5
		GiveItem(playerid,"ItFo_Booze",1);
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Много не пей."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		else
			GameTextForPlayer(playerid,50,5500,string.format("%s","Недостаточно медных монет!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);
		end
		
		elseif selectedOption == 7 then
		if money >= 10 then
		Player[playerid].bank = Player[playerid].bank - 10
		GiveItem(playerid,"ItFo_Addon_LousHammer",1);
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Это крепкое пойло. Не для слабаков."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		else
			GameTextForPlayer(playerid,50,5500,string.format("%s","Недостаточно медных монет!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);
		end
		elseif selectedOption == 8 then
		if money >= 15 then
		Player[playerid].bank = Player[playerid].bank - 15
		GiveItem(playerid,"ItFo_Addon_SchlafHammer",1);
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Хорошева опитита."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		else
			GameTextForPlayer(playerid,50,5500,string.format("%s","Недостаточно медных монет!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);
		end
		elseif selectedOption == 9 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Карлос: Заходи еще."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		HideSelectionMenu(playerid, PovarMenu)
		end
		
		
		--[[
		***********************
				Слепой алхимик
		***********************
				]]
				elseif GetActiveMenu(playerid) == Quest1Menu then
		if selectedOption == 1 then
		if Player[playerid].quest == 0 then
		if Player[playerid].timer == true then
		Player[playerid].timer = false
		Player[playerid].quest = 1;
		GameTextForPlayer(playerid,50,5500,string.format("%s","Слепой алхимик: Джейк, это ты? У меня для тебя зелье, доставишь его к отшельнику в Мертвой Гарпии."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		SendPlayerMessage(playerid,236,236,0,string.format("%s","Зелье получено, у тебя 2 минуты."));
		SetTimerEx("Questcancel",1200*1000,0,playerid);
		else
		GameTextForPlayer(playerid,1500,5500,string.format("%s","Рано!"),"FONT_OLD_10_WHITE_HI.TGA",255,0,0,2500);
		end
		elseif Player[playerid].quest == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Слепой алхимик: Какого Белиара!? Пошевеливайся, Джейк, если эффект иссякнет, то тебе не заплатят."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		elseif Player[playerid].quest == 2 then
		if Player[playerid].timer == true then
		Player[playerid].timer = false
		GameTextForPlayer(playerid,50,5500,string.format("%s","Слепой алхимик: Извини, приятель. На сегодня я не приготовил зелий. Приходи завтра..."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		SendPlayerMessage(playerid,236,236,0,string.format("%s","Жди 20 минут."));
		SetTimerEx("Questunblock",1200000*3,0,playerid);
		else
		GameTextForPlayer(playerid,50,5500,string.format("%s","Слепой алхимик: Извини, приятель. На сегодня я не приготовил зелий. Приходи завтра..."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		SendPlayerMessage(playerid,236,236,0,string.format("%s","Время уже запущено."));
		end
			end
		elseif selectedOption == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Слепой алхимик: Кто здесь?"),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		HideSelectionMenu(playerid, Quest1Menu);
		end
		
		--[[
		***********************
				Отшельник
		***********************
				]]
				elseif GetActiveMenu(playerid) == Quest2Menu then
		if selectedOption == 1 then
		if Player[playerid].quest == 0 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Отшельник: Приветствую, странник. Сейчас я ничем не могу помочь, я жду одного человека."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		elseif Player[playerid].quest == 1 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Отшельник: Отшельник: Погоди, ты ведь не Джейк... Видимо, Джейку не здоровится. Ну что-ж, давай сюда, я заплачу."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,4500);
		SendPlayerMessage(playerid,236,236,0,string.format("%s","Получено 50 медных монет."));
		Player[playerid].bank = Player[playerid].bank + 50;
		Player[playerid].quest = 2;
		elseif Player[playerid].quest == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Отшельник: Что-то еще?"),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		end
		elseif selectedOption == 2 then
		GameTextForPlayer(playerid,50,5500,string.format("%s","Отшельник: Удачи, странник."),"FONT_OLD_10_WHITE_HI.TGA",255,255,255,2500);
		HideSelectionMenu(playerid, Quest2Menu);
		end
		
			--[[
		***********************
		  ОРУЖИЕ ДАЛЬНЕГО БОЯ
		***********************
				]]
		
			elseif GetActiveMenu(playerid) == RangeMenu then
			if selectedOption == 1 then
				if money >= 4 then
				Player[playerid].bank = Player[playerid].bank - 4
				GiveItem(playerid,"ItRw_Bow_L_01",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 2 then
				if money >= 7 then
				Player[playerid].bank = Player[playerid].bank - 7
				GiveItem(playerid,"ItRw_Bow_L_02",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 3 then
				if money >= 10 then
				Player[playerid].bank = Player[playerid].bank - 10
				GiveItem(playerid,"ItRw_Bow_L_03",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 4 then
				if money >= 14 then
				Player[playerid].bank = Player[playerid].bank - 14
				GiveItem(playerid,"ItRw_Bow_L_04",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 5 then
				if money >= 17 then
				Player[playerid].bank = Player[playerid].bank - 17
				GiveItem(playerid,"ItRw_Bow_M_01",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 6 then
				if money >= 21 then
				Player[playerid].bank = Player[playerid].bank - 21
				GiveItem(playerid,"ItRw_Bow_M_02",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 7 then
				if money >= 25 then
				Player[playerid].bank = Player[playerid].bank - 25
				GiveItem(playerid,"ItRw_Bow_M_03",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 8 then
				if money >= 29 then
				Player[playerid].bank = Player[playerid].bank - 29
				GiveItem(playerid,"ItRw_Bow_M_04",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 9 then
				if money >= 35 then
				Player[playerid].bank = Player[playerid].bank - 35
				GiveItem(playerid,"ItRw_Bow_H_01",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 10 then
				if money >= 40 then
				Player[playerid].bank = Player[playerid].bank - 40
				GiveItem(playerid,"ItRw_Bow_H_02",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 11 then
				if money >= 50 then
				Player[playerid].bank = Player[playerid].bank - 50
				GiveItem(playerid,"ItRw_Bow_H_03",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 12 then
				if money >= 70 then
				Player[playerid].bank = Player[playerid].bank - 70
				GiveItem(playerid,"ItRw_Bow_H_04",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 13 then
				if money >= 5 then
				Player[playerid].bank = Player[playerid].bank - 5
				GiveItem(playerid,"ItRw_Crossbow_L_01",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 14 then
				if money >= 15 then
				Player[playerid].bank = Player[playerid].bank - 15
				GiveItem(playerid,"ItRw_Crossbow_L_02",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 15 then
				if money >= 23 then
				Player[playerid].bank = Player[playerid].bank - 23
				GiveItem(playerid,"ItRw_Crossbow_M_01",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 16 then
				if money >= 50 then
				Player[playerid].bank = Player[playerid].bank - 50
				GiveItem(playerid,"ItRw_Crossbow_M_02",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 17 then
				if money >= 70 then
				Player[playerid].bank = Player[playerid].bank - 70
				GiveItem(playerid,"ItRw_Crossbow_H_01",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 18 then
				if money >= 100 then
				Player[playerid].bank = Player[playerid].bank - 100
				GiveItem(playerid,"ItRw_Crossbow_H_02",1);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				
			elseif selectedOption == 19 then
				if money >= 3 then
				Player[playerid].bank = Player[playerid].bank - 3
				GiveItem(playerid,"ITRM_ARROW",50);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
				
			elseif selectedOption == 20 then
				if money >= 3 then
				Player[playerid].bank = Player[playerid].bank - 3
				GiveItem(playerid,"ITRM_BOLT",50);
				else
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет!" );
				end
			elseif selectedOption == 21 then
				HideSelectionMenu(playerid, RangeMenu)
			end
		
		end
	end
end

function Questunblock(playerid)
if Player[playerid].quest == 1 then
SendPlayerMessage(playerid,255,0,0,"Алхимик приготовил зелье!");
elseif Player[playerid].quest == 2 then
SendPlayerMessage(playerid,255,0,0,"Алхимик приготовил зелье!");
end
Player[playerid].quest = 0;
Player[playerid].timer = true;
end

function Questcancel(playerid)
if Player[playerid].quest == 1 then
SendPlayerMessage(playerid,255,0,0,"Зелье утратило свои свойства!");
elseif Player[playerid].quest == 2 then
SendPlayerMessage(playerid,255,0,0,"На сегодня зелий не заготовлено!");
end
Player[playerid].quest = 2;
Player[playerid].timer = true;
end

Server = {};
Server.vob_info = {};
gVob = {};

local _badwords = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}

player_has = {}
player_need = {}
player_want = {}
player_want_amount = {}
played_need_count = {}
craftitem_id = {}
ingr_need_count = {}
player_magictype = {}
player_willgetxp = {}
player_currcraft = {} 

function Drop_protected_items(params)
    local result, playerid, item_instance, amount = sscanf(params, "dsd");
	if result == 1 then
        DropItem(playerid, item_instance, amount);
		SendPlayerMessage(playerid,255,0,0,"Администрация изъяла из вашего инвентаря запрещенные предметы.");
	end
end

local my_checkid = 123;

function Initsss()
	for i = 0, MAX_PLAYERS - 1 do
		Player[i] = {};
		Player[i].nick = nil;
		Player[i].loggedIn = 0;
		Player[i].password = nil;
		Player[i].moveobj = nil;
		Player[i].class = nil;
		Player[i].timer = true;
		Player[i].chat = true;
		Player[i].propozycja = false;
		Player[i].warn = 0;
		Player[i].bank = 0;
		Player[i].Items = -1;
		Player[i].kills = 0;
		Player[i].deaths = 0;
		Player[i].leader = 0;
		Player[i].inven = 0;
		Player[i].homekey = 0;
		Player[i].rank = 0;
		Player[i].alchemylvl = 0;
		Player[i].blacksmithxp = 0;
		Player[i].blacksmithlvl = 0;
		Player[i].runexp = 0;
		Player[i].runelvl = 0;
		Player[i].admin = 0;
		Player[i].gmp1 = 0;
		Player[i].gmp2 = 0;
		Player[i].gmp3 = 0;
		Player[i].hunger = 0;
		Player[i].thirst = 0;
		Player[i].pmavaible = true;
		Player[i].freeze = false;
		Player[i].logout=0;
		
		
		Player[i].ht_able=1;
			
		--Skin_Edit
		Player[i].OnSkinEdit=0;	
		Player[i].skin_edit_timer=0;		
		Player[i].sedit_join=0;
		Player[i].sedit_cursor=0;
		Player[i].sedit_gender=0;
		Player[i].sedit_gender_texture="";
		Player[i].sedit_body=0;
		Player[i].sedit_head=0;
		Player[i].sedit_fatness=1;
		Player[i].sedit_scale=1;
		Player[i].sedit_head_texture="";
		Player[i].sedit_face=0;
		--Craft
		Player[i].craft_cursor=0;
		Player[i].OnCraftMenu=0;
		Player[i].SubMenu=-1;
		Player[i].able_craft={};
		for j=0, 100 do
			Player[i].able_craft[j]=0;
		end
		--Listing
		Player[i].lists_count=0;
		Player[i].lists={};
		for j=0, 500 do
			Player[i].lists[j]={};
			Player[i].lists[j].text="NULL";
			Player[i].lists[j].author="NULL";
			Player[i].lists[j].enabled_mark=0;
			Player[i].lists[j].mark_untouched=0;
			Player[i].lists[j].d_day=0;
			Player[i].lists[j].d_month=0;
			Player[i].lists[j].d_year=0;
		end
		
						for j = 0, 499 do
					Player[i][j] = {};
					Player[i][j].Item_Instance = 0;
					Player[i][j].Amount = 0;
					Player[i][j].Equip = 0;
					end
	end

end

--pdeathx={};
--pdeathy={};
--pdeathz={};
deathcounter={};

function OnGamemodeInit()

for i = 0, GetMaxSlots() - 1 do
	Player[i] = {};
	Player[i].id = -1;
	--[[Player[i].x = nil;
	Player[i].y = nil;
	Player[i].z = nil;]]
	deathcounter[i]=0;
	end
--[[for i = 0, GetMaxSlots() - 1 do
	Player[i] = {};
	Player[i].id = -1;
	Player[i].x = nil;
	Player[i].y = nil;
	Player[i].z = nil;
	end]]
SetGamemodeName("WoM RP v.1.0");
SetServerDescription("World Of Mordrag" .. "\n" .. "Версия мода: 1.0" .. version .. "\n" .. "Режим: Role Play" .. "\n" .. "Вход: Свободный");
EnableChat(0);
EnableExitGame(0);
OpenLocks(1);
Initsss();
--LoadWorld();
AddPlayerClass("PC_HERO",-5882.2651367188, -251.90199279785, -818.64013671875, 36 , -5882.2651367188, -251.90199279785, -818.64013671875, 36);
SetRespawnTime(1200000*3);
CreateGlobalView();
InitMenus();
Craft_Init();

hungt=SetTimer("HT_Counter",1000*4*60*2,1);

--Sounds
	scfail = CreateSound("DOOR_LOCK.WAV");
	scluck={};
	scluck [0] = CreateSound("ANVILHIT02.WAV");
	scluck [1] = CreateSound("ANVILHIT01.WAV");
--Textures
	--News
		
		texturenews = CreateTexture(2600, 3100, 6000, 5000, "Frame_GMPA.TGA")
		drawnews1 = CreateDraw(2700, 3200, string.format("%s" , "НОВОСТИ"), "Font_Old_20_White_Hi.TGA", 0, 255, 0)
		drawnews2 = CreateDraw(2700, 3550, string.format("%s" , "1. Сервер открыт"), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		drawnews3 = CreateDraw(2700, 3800, string.format("%s" , "2. Информация на форуме "), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		drawnews4 = CreateDraw(2700, 4050, string.format("%s" , "4. Смена скина /вскин  "), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		drawnews5 = CreateDraw(2700, 4300, string.format("%s" , "5. Внешность /вн - просмотр М"), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		drawnews6 = CreateDraw(2700, 4550, string.format("%s" , "6? - "), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
	
	bgl={};
	bgl[0] = CreateTexture(4000, 1700, 7400, 6600, "LETTERS.TGA");
	 bgl[1] = CreateTexture(4000, 1700, 7400, 6600, "LETTER1.TGA");
	 bgl[2] = CreateTexture(4000, 1700, 7400, 6600, "LETTER2.TGA");
	 wax = CreateTexture(4300,5000,5300,6000,"WAX.TGA");
	logontx = CreateTexture(2700,2000,6800,7500, "LETTERS.TGA");
	womtx = CreateTexture(1600,3400,2500,4500,"WOM.TGA");
	 bg = CreateTexture(5800, 1600, 8100, 3200, "BOOK_RED_L.TGA");
	 returnd = CreateDraw(4000,7000,"Нажмите LCtrl для выхода/возвращения","Font_Old_10_White_Hi.TGA",255,100,0);
	 bgc = CreateTexture(3900,1700, 5000,5000, "Frame_GMPA.TGA");
	bgci = CreateTexture(5000,1700, 6000,5000, "Frame_GMPA.TGA");
	
	th_dr=CreateDraw(6400,7020,"Вода","FONT_OLD_10_WHITE_HI.TGA",0,50,255);
	hg_dr=CreateDraw(6400,6420,"Еда","FONT_OLD_10_WHITE_HI.TGA",255,255,0);
	th_bg=CreateTexture(6400,7300,7400,7600, "BAR_BACK.TGA");
	hg_bg=CreateTexture(6400,6600,7400,6900, "BAR_BACK.TGA");
	hungtx={};
		hungtx[0]=CreateTexture(6430,6660,7370,6865, "BAR_MISC.TGA");
		hungtx[1]=CreateTexture(6430,6660,7120,6865, "BAR_MISC.TGA");
		hungtx[2]=CreateTexture(6430,6660,6870,6865, "BAR_MISC.TGA");
		hungtx[3]=CreateTexture(6430,6660,6620,6865, "BAR_MISC.TGA");
	thirtx={};
		thirtx[0]=CreateTexture(6430,7360,7370,7565, "BAR_MANA.TGA");
		thirtx[1]=CreateTexture(6430,7360,7120,7565, "BAR_MANA.TGA");
		thirtx[2]=CreateTexture(6430,7360,6870,7565, "BAR_MANA.TGA");
		thirtx[3]=CreateTexture(6430,7360,6620,7565, "BAR_MANA.TGA");
--End Textures

--Thirst/Hunger timers
	htt={};
--
FD_Init();
--NPC_Bandit();
--NPC_BanditXard();
--NPC_BanditXard2();
--NPC_BanditMost();
--NPC_BanditMost2();
--NPC_BanditMost3();
--BOT_Bot_Alchemy();
--BOT_Bot_Hunter();
BOT_Bot_Trader();
BOT_Mob_Kuznec();
BOT_Bot_Reseller();
BOT_Bot_Tanis();
--BOT_Bot_Quest1();
--BOT_Bot_Quest2();
BOT_Bot_Vor();
--BOT_Bot_Guard();
--BOT_Bot_Guard2();
--BOT_Bot_Guard3();
--BOT_Bot_Guard4();
--BOT_Bot_Povar();
--BOT_Bot_Mudak();
BOT_Bot_Citizen();
--BOT_Bot_Citizen2();
--BOT_Bot_Citizen3();
--BOT_Bot_Citizen4();
--BOT_Bot_Citizen5();
--BOT_Bot_Citizen6();
BOT_Bot_Citizen7();
--BOT_Bot_Citizen8();
--BOT_Bot_Citizen9();
--BOT_Bot_Citizen10();
--BOT_Bot_Traktir();
--BOT_Bot_Baba();
--BOT_Bot_Anakronoloh();

--SetTimer("DayTime",5000,1);
end

function FD_Init()
	MAX_FD=28;
	for i=0, MAX_FD-1 do
		FD[i]={};
	end
	
	----------------
	FD[0].instance="ItFo_Apple";
	FD[0].food=1;
	FD[0].drink=0;
	-----------------
	----------------
	FD[1].instance="ItFo_Cheese";
	FD[1].food=1;
	FD[1].drink=0;
	-----------------
	----------------
	FD[2].instance="ItFo_Bacon";
	FD[2].food=1;
	FD[2].drink=0;
	-----------------
	----------------
	FD[3].instance="ItFo_Fish";
	FD[3].food=1;
	FD[3].drink=0;
	-----------------
	----------------
	FD[4].instance="ItFoMuttonRaw";
	FD[4].food=1;
	FD[4].drink=0;
	-----------------
	----------------
	FD[5].instance="ItFoMutton";
	FD[5].food=1;
	FD[5].drink=0;
	-----------------
	----------------
	FD[6].instance="ItFo_Stew";
	FD[6].food=1;
	FD[6].drink=1;
	-----------------
	----------------
	FD[7].instance="ItFo_CoragonsBeer";
	FD[7].food=0;
	FD[7].drink=1;
	-----------------
	----------------
	FD[8].instance="ItFo_FishSoup";
	FD[8].food=1;
	FD[8].drink=1;
	-----------------
	----------------
	FD[9].instance="ItFo_Sausage";
	FD[9].food=1;
	FD[9].drink=0;
	-----------------
	----------------
	FD[10].instance="ItFo_Honey";
	FD[10].food=1;
	FD[10].drink=0;
	-----------------
	----------------
	FD[11].instance="ItFo_Water";
	FD[11].food=0;
	FD[11].drink=1;
	-----------------
	----------------
	FD[12].instance="ItFo_Beer";
	FD[12].food=0;
	FD[12].drink=1;
	-----------------
	----------------
	FD[13].instance="ItFo_Booze";
	FD[13].food=1;
	FD[13].drink=0;
	-----------------
	----------------
	FD[14].instance="ItFo_Wine";
	FD[14].food=0;
	FD[14].drink=1;
	-----------------
	----------------
	FD[15].instance="ItFo_Milk";
	FD[15].food=0;
	FD[15].drink=1;
	-----------------
	----------------
	FD[16].instance="ItFo_Addon_Shellflesh";
	FD[16].food=1;
	FD[16].drink=0;
	-----------------
	----------------
	FD[17].instance="ItFo_Addon_Rum";
	FD[17].food=0;
	FD[17].drink=1;
	-----------------
	----------------
	FD[18].instance="ItFo_Addon_Grog";
	FD[18].food=0;
	FD[18].drink=1;
	-----------------
	----------------
	FD[19].instance="ItFo_Addon_LousHammer";
	FD[19].food=0;
	FD[19].drink=1;
	-----------------
	----------------
	FD[20].instance="ItFo_Addon_SchlafHammer";
	FD[20].food=0;
	FD[20].drink=1;
	-----------------
	----------------
	FD[21].instance="ItFo_Addon_SchnellerHering";
	FD[21].food=1;
	FD[21].drink=0;
	-----------------
	----------------
	FD[22].instance="ItFo_Addon_Pfeffer_01";
	FD[22].food=1;
	FD[22].drink=0;
	-----------------
	----------------
	FD[23].instance="ItFo_Addon_FireStew";
	FD[23].food=1;
	FD[23].drink=1;
	-----------------
	----------------
	FD[24].instance="ItFo_Addon_Meatsoup";
	FD[24].food=1;
	FD[24].drink=1;
	-----------------
	----------------
	FD[25].instance="ItPl_Mushroom_01";
	FD[25].food=1;
	FD[25].drink=0;
	-----------------
	----------------
	FD[26].instance="ItPl_Mushroom_02";
	FD[26].food=1;
	FD[26].drink=0;
	-----------------
	----------------
	FD[27].instance="ItFo_Bread";
	FD[27].food=1;
	FD[27].drink=0;
	-----------------
	
end

function InitMenus()
StartFrames()
	ArmorMenu = CreateSelectionMenu(5800, 3000, 7700, 500, "Font_Old_10_White_Hi.TGA")
	CreateOption(ArmorMenu, "50м|10зщ|Крестьянская одежда", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(ArmorMenu, "160м|10зщ|Горожанин 1", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(ArmorMenu, "180м|10зщ|Горожанин 2", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(ArmorMenu, "210м|10зщ|Горожанин 3", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(ArmorMenu, "410м|20зщ|Кожанный костюм", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --5
	CreateOption(ArmorMenu, "460м|25зщ|Кожанный доспех", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(ArmorMenu, "550м|30зщ|Кожанная броня", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --7
	CreateOption(ArmorMenu, "600м|35зщ|Средняя бандитская", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --8
	CreateOption(ArmorMenu, "900м|50зщ|Тяжелая бандитская", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --9
	CreateOption(ArmorMenu, "540м|45у|Арбалет", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --10
	CreateOption(ArmorMenu, "1120м|90у|Арбалет", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --11
	CreateOption(ArmorMenu, "400м|35у|Лук", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --12
	CreateOption(ArmorMenu, "840м|65у|Составной лук", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --13
	CreateOption(ArmorMenu, "10 стрел | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --14
	CreateOption(ArmorMenu, "10 болтов | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --15
	CreateOption(ArmorMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --16
	
	WeaponsMenu = CreateSelectionMenu(5800, 3000, 7700, 500, "Font_Old_10_White_Hi.TGA")
	CreateOption(WeaponsMenu, "210м|12у|Короткий меч", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(WeaponsMenu, "230м|14у|Защита землепашца", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(WeaponsMenu, "250м|16у|Ранящий шип", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(WeaponsMenu, "290м|20у|Наказание рудокопа", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(WeaponsMenu, "380м|29у|Стальной язык", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --5
	CreateOption(WeaponsMenu, "540м|45у|Ржавый большой меч", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(WeaponsMenu, "600м|51у|Сокрушающий черепа", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --7
	CreateOption(WeaponsMenu, "720м|58у|Шепот бури", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --8
	CreateOption(WeaponsMenu, "740м|59у|Длань стражника", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --9
	CreateOption(WeaponsMenu, "790м|64у|Мясник", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --10
	CreateOption(WeaponsMenu, "800м|65у|Палач", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --11
	CreateOption(WeaponsMenu, "830м|66у|Слово берсеркера", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --12
	CreateOption(WeaponsMenu, "260м|17у|Боевой посох", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --13
	CreateOption(WeaponsMenu, "750м|67у|Старый боевой топор", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --14
	CreateOption(WeaponsMenu, "820м|71у|Клинок Хранителя", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --15
	CreateOption(WeaponsMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --16
	
	RangeMenu = CreateSelectionMenu(5800, 3000, 7700, 500, "Font_Old_10_White_Hi.TGA")
	CreateOption(RangeMenu, "Ивовый лук | 7 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(RangeMenu, "Охотничий лук | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(RangeMenu, "Вязовый лук | 14 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(RangeMenu, "Охотничий арбалет | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(RangeMenu, "Легкий Арбалет | 15 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --7
	CreateOption(RangeMenu, "10 стрел | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --9
	CreateOption(RangeMenu, "10 болтов | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --10
	CreateOption(RangeMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --11
	
	AlchemyMenu = CreateSelectionMenu(5800, 3000, 7700, 500, "Font_Old_10_White_Hi.TGA")
	CreateOption(AlchemyMenu, "Лечебная эссенция | 25 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(AlchemyMenu, "Лечебный экстракт | 35 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(AlchemyMenu, "Лечебный эликсир | 50 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(AlchemyMenu, "Эссенция маны | 20 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(AlchemyMenu, "Лечение лихорадки | 40 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --5
	CreateOption(AlchemyMenu, "Зелье от привыкания | 40 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(AlchemyMenu, "Лечение одержимости | 50 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --7
	CreateOption(AlchemyMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --8
	
	TradeMenu = CreateSelectionMenu(5800, 3000, 7700, 500, "Font_Old_10_White_Hi.TGA") --еда
	CreateOption(TradeMenu, "Яблоко | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(TradeMenu, "Сыр | 25 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(TradeMenu, "Окорок | 30 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(TradeMenu, "Хлеб | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(TradeMenu, "Рыба | 7 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --5
	CreateOption(TradeMenu, "Колбаса | 30 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(TradeMenu, "Вино | 35 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --7
	CreateOption(TradeMenu, "Пиво | 15 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --8
	CreateOption(TradeMenu, "Молоко | 15 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --9
	CreateOption(TradeMenu, "Похлебка | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --10
	CreateOption(TradeMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --11
	
	ResselerMenu = CreateSelectionMenu(5800, 3000, 7000, 50, "Font_Old_10_White_Hi.TGA") --перекупщик
	CreateOption(ResselerMenu, "Метла | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(ResselerMenu, "Сталь | 15 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(ResselerMenu, "Кирка | 35 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(ResselerMenu, "Отмычка | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(ResselerMenu, "Топор дровосека | 70 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --5
	CreateOption(ResselerMenu, "Ложка | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(ResselerMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --7
	
	TanisMenu = CreateSelectionMenu(5800, 3000, 7900, 500, "Font_Old_10_White_Hi.TGA") --ТАНИС!
	CreateOption(TanisMenu, "Ты кто?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(TanisMenu, "Как дела?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(TanisMenu, "Что это за место?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(TanisMenu, "(обучиться подкрадыванию | 100 мед)", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(TanisMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --5
	
	Quest1Menu = CreateSelectionMenu(5800, 3000, 7900, 500, "Font_Old_10_White_Hi.TGA") --КВЕСТ!
	CreateOption(Quest1Menu, "(Покашлять)", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(Quest1Menu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --2
	
	Quest2Menu = CreateSelectionMenu(5800, 3000, 7900, 500, "Font_Old_10_White_Hi.TGA") --КВЕСТ!
	CreateOption(Quest2Menu, "(Обратиться к отшельнику)", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(Quest2Menu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --2
	
	GorodMenu = CreateSelectionMenu(5800, 3000, 7900, 500, "Font_Old_10_White_Hi.TGA") --горожане
	CreateOption(GorodMenu, "Что это за место?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(GorodMenu, "Есть какие-нибудь слухи?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(GorodMenu, "Где мне найти работу?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(GorodMenu, "Как обстановка?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(GorodMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --5
	
	VorMenu = CreateSelectionMenu(5800, 3000, 7900, 500, "Font_Old_10_White_Hi.TGA") --Вор
	CreateOption(VorMenu, "Ты кто?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(VorMenu, "Как дела?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(VorMenu, "Что это за место?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(VorMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --4
	
	PovarMenu = CreateSelectionMenu(5800, 3000, 7900, 500, "Font_Old_10_White_Hi.TGA") --Карлос
	CreateOption(PovarMenu, "Ты кто?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --1
	CreateOption(PovarMenu, "Как дела?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --2
	CreateOption(PovarMenu, "Что это за место?", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --3
	CreateOption(PovarMenu, "Похлебка | 8 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --4
	CreateOption(PovarMenu, "Уха | 6 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --5
	CreateOption(PovarMenu, "Самогон | 5 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --6
	CreateOption(PovarMenu, "Молот Лу | 10 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --7
	CreateOption(PovarMenu, "Двойной молот | 15 мед", "Font_Old_10_White_Hi.TGA", 255, 255, 255, 102, 205, 0) --8
	CreateOption(PovarMenu, "(Выйти)", "Font_Old_10_White_Hi.TGA", 255, 100, 0, 255, 0, 0) --9
	
	local hour,minute = GetTime(); --время
	clockg = CreateDraw(150, 7500, string.format("%d%s%d", hour,":",minute), "Font_Old_10_White_Hi.TGA", 255, 255, 255);
	--dateg = CreateDraw(150,7500,"","Font_10_Book_Hi.TGA",100,100,255);
	clockr = CreateDraw(7000,7000,":","Font_10_Book_Hi.TGA",200,200,255);
	local timetimer = SetTimer("UpDateTime",5000,1);
end

function UpDateTime()
hour,minute=GetTime();
	local stime="";
	if hour >22 or hour<6 then 
		stime="Ночь";
	elseif hour>=6 and hour<13 then
		stime="Утро";
	elseif hour>=13 and hour<18 then
		stime="День";
	elseif hour>=18 and hour<=22 then
		stime="Вечер";
	end
	if minute<10 then
		UpdateDraw(clockg,150, 7500,string.format("%s %d%s%d",stime,hour,":0",minute),"FONT_OLD_10_WHITE_HI.TGA",255,255,255);
	else
		UpdateDraw(clockg,150, 7500,string.format("%s %d%s%d",stime,hour,":",minute),"FONT_OLD_10_WHITE_HI.TGA",255,255,255);
	end
		UpdateDraw(clockr,6400,7600,os.date("RT: %d/%m/%Y %X"),"FONT_OLD_10_WHITE_HI.TGA",255,255,255);
		
	--[[if hour==0 and (minute==0 or minute==1) then
		if changing_day==0 then
			changing_day=1;
			SetTimer("DateUpdate",10000,0);
		end
	end]]
	local maxp=GetMaxPlayers();
	if maxp~=0 then
		for i=0, maxp-1 do
			--ShowDraw(i,dateg);
			ShowDraw(i,clockg);
			ShowDraw(i,clockr);
		end
	end
	--SaveWorld();
	--UpdateDraw(dateg,150, 7500,string.format("%d %s %d",day,months[month],year),"FONT_OLD_10_WHITE_HI.TGA",255,255,255);
end

--[[function DateUpdate()

		if days[month]>=day+1 then
			day=day+1;
		elseif days[month]==day then
			day=1;
			if month~=12 then
				month=month+1;
			else
				month=1;
				year=year+1;
			end
		end
		
		changing_day=0;
end]]

function SaveWorld()
	local worldFile=io.open("world//time.par","w+");
	worldFile:write(hour.." "..minute.." "..day.." "..month.." "..year);
	worldFile:close();
end

function LoadWorld()
	local worldFile=io.open("world//time.par","r+");
	hour=0;
	minute=0;
	if worldFile then
		local filestream=worldFile:read();
		local result;
		local gd,gm,gy;
		result,hour,minute,gd,gm,gy=sscanf(filestream,"ddddd");
		if result==1 then
			day=gd; month=gm; year=gy;
			SetTime(hour,minute);
		end
	end
end

function OnPlayerText(playerid, text)
if Player[playerid].loggedIn == 1 then
if Player[playerid].Mute == false then
local msgType = GetChatMessageType(text)
	text=string.gsub(text,"/",",");
		if msgType == "RP" then
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 1000 then 
				if i==playerid then
					if string.len(text)>80 then
						SendPlayerMessage(i,255,255,255,string.format("%s %s%s","Вы:",string.sub(text,1,80),"-"));
						SendPlayerMessage(i,255,255,255,string.format("%s %s",string.sub(text,81,string.len(text)),"(Вы)"));
					else
					SendPlayerMessage(i,255,255,255,string.format("%s %s","Вы:",text));
					end
				else
					if string.len(text)>80 then
						SendPlayerMessage(i,255,255,255,string.format("%s%s %s%s",GetPlayerName(playerid),":",string.sub(text,1,80),"-"));
						SendPlayerMessage(i,255,255,255,string.format("%s %s%s%s",string.sub(text,81,string.len(text)),"(",GetPlayerName(playerid),")"));
					else
						SendPlayerMessage(i,255,255,255,string.format("%s%s %s",GetPlayerName(playerid),":",text));
					end
				end
			elseif GetDistancePlayers(playerid,i)>1000 and GetDistancePlayers(playerid,i)<=1500 then
				SendPlayerMessage(i,255,255,255,string.format("%s %s",GetPlayerName(playerid),": #неразборчивая речь вдалеке#"));
			end
end
		elseif msgType == "SCREAM" then
			text = text:gsub("^.", " ")
			for i = 0, GetMaxPlayers() - 1 do
				if GetDistancePlayers(playerid, i) < 3000 then
					SendPlayerMessage(i, 242, 8, 8, string.format("%s %s %s",GetPlayerName(playerid),"крикнул:",text))
				end
			end
		elseif msgType == "TO" then
			text = text:gsub("^.", " ")
				for i = 0, GetMaxPlayers() -1 do
					if GetDistancePlayers(playerid, i) < 1000 then
						SendPlayerMessage(i, 140, 190, 140, string.format("%s((%s:%s))","(DO)",GetPlayerName(playerid),text))
					end
				end
		elseif msgType == "OOC" then
			text = text:gsub("^.", " ")
			for i = 0, GetMaxPlayers() -1 do
				if GetDistancePlayers(playerid, i) < 1000 then
					SendPlayerMessage(i, 255, 255, 0, string.format("%s((%s:%s))","(OOC)",GetPlayerName(playerid),text))
				end
			end
		elseif msgType == "ME" then
			text = text:gsub("^.", " ")
			for i = 0, GetMaxPlayers() -1 do
				if GetDistancePlayers(playerid, i) < 1000 then
					SendPlayerMessage(i, 242, 86, 8, string.format("#%s %s#",GetPlayerName(playerid),text))
				end
			end
		end
	elseif Player[playerid].Mute == true then
    SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
	end
	else
		SendPlayerMessage(playerid, 255, 0, 0, "Залогинься, чтобы писать в чат.")
	end
end

function GetChatMessageType(message)
	if message then
		local firstChar = message:sub(1, 1)
			if firstChar == "!" then
				return "SCREAM"
			elseif firstChar == "." then
				return "TO"
			elseif firstChar == "$" then
				return "OOC"
			elseif firstChar == "#" then
				return "ME"
			else return "RP"
			end
	end
end

function OnPlayerConnect(playerid)
SetPlayerWorld(playerid,"WOM_COLONY.ZEN","START");
if IsNPC(playerid) == 0 then
--White(playerid);
SendMessageToAll(17,255,0,string.format("%s %s %d%s %s",GetPlayerName(playerid),"(ID:",playerid,")","присоединился к игре"));
SendPlayerMessage(playerid,0,213,255,string.format("%s","Команды РП чата : /о - OOC /я - действие персонажа /к - крик /ш - шепот"));
SendPlayerMessage(playerid,0,213,255,string.format("%s","/лс (ID игрока) (текст) || /репорт (текст)"));
SendPlayerMessage(playerid,0,213,255,string.format("%s","Новости - F2"));
--SetPlayerColor(playerid,236,236,236);
--EnablePlayerNicknameID(playerid,0);
--ShowDraw(playerid,timedraw); --время

	GetMD5File(playerid,"Data\\WOM_COLONY.VDF");
	GetMD5File(playerid,"_work\\data\\scripts\\_compiled\\gothic.dat");
	
Player[playerid].loggedIn = 0;
Player[playerid].password = nil;
Player[playerid].propozycja = false;
Player[playerid].class = nil;
Player[playerid].takeaway = " ";
Player[playerid].takeawaynum = 0;
Player[playerid].removeawaynum = 0;
Player[playerid].allowpick = false;
Player[playerid].timer = true;
Player[playerid].Help1Menu = nil;
Player[playerid].pmavaible = true;
Player[playerid].AFK = false;
Player[playerid].Mute = true;
Player[playerid].invis = false;
Player[playerid].chat = true;
Player[playerid].moveobj = 0;
Player[playerid].warn = 0;
Player[playerid].moveobjtype = 1;
Player[playerid].skintype = {};
Player[playerid].curpos = 0;
Player[playerid].bank = 0;
Player[playerid].kills = 0;
Player[playerid].deaths = 0;
Player[playerid].leader = 0;
Player[playerid].inven = 0;
Player[playerid].homekey = 0;
Player[playerid].craft = 0;
Player[playerid].admin = 0;
Player[playerid].craft = 0;
Player[playerid].rank = 0;
Player[playerid].alchemylvl = 0;
Player[playerid].blacksmithxp = 0;
Player[playerid].blacksmithlvl = 0;
Player[playerid].runexp = 0;
Player[playerid].runelvl = 0;
Player[playerid].gmp1 = 0;
Player[playerid].gmp2 = 0;
Player[playerid].gmp3 = 0;
Player[playerid].hunger = 0;
Player[playerid].thirst = 0;
Player[playerid].discribe = "NULL";
Player[playerid].quest = 2;
Player[playerid].freeze = false;
Player[playerid].logout=0;


Player[playerid].ht_able=1;
--Craft
		Player[playerid].craft_cursor=0;
		Player[playerid].OnCraftMenu=0;
		Player[playerid].SubMenu=-1;
		Player[playerid].able_craft={};
		for i=0, 100 do
			Player[playerid].able_craft[i]=0;
		end
--Listing
		Player[playerid].lists_count=0;
		Player[playerid].lists={};
		for i=0, 120 do
			Player[playerid].lists[i]={};
			Player[playerid].lists[i].text="NULL";
			Player[playerid].lists[i].author="NULL";
			Player[playerid].lists[i].enabled_mark=0;
			Player[playerid].lists[i].mark_untouched=0;
			Player[playerid].lists[i].d_day=0;
			Player[playerid].lists[i].d_month=0;
			Player[playerid].lists[i].d_year=0;
		end
		
--Skin_Edit
		Player[playerid].OnSkinEdit=0;	
		--Player[playerid].skin_edit_timer=0;		
		Player[playerid].sedit_join=0;
		Player[playerid].sedit_cursor=0;
		Player[playerid].sedit_gender=0;
		Player[playerid].sedit_gender_texture="";
		Player[playerid].sedit_body=0;
		Player[playerid].sedit_head=0;
		Player[playerid].sedit_fatness=1;
		Player[playerid].sedit_scale=1;
		Player[playerid].sedit_head_texture="";
		Player[playerid].sedit_face=0;

SetPlayerEnable_OnPlayerKey(playerid,1);
SetPlayerPos(playerid, -5882.2651367188, -251.90199279785, -818.64013671875, 36);
FreezePlayer(playerid, 1);
	if GetPlayerName(playerid) == "Nickname" then
		SendPlayerMessage(playerid,255,0,0,"Привет. Сначала смени себе ник, а потом заходи :)");
		Kick(playerid);
	end
	
	
	SetTimerEx("Logon_Info",1500,0,playerid);
end
end

function HT_Counter()
	local maxp=GetMaxPlayers();
	if maxp~=0 then
		for i=0, maxp-1 do
			if Player[i].loggedIn==1 then
				if Player[i].ht_able==1 then
					Player[i].hunger=Player[i].hunger+1;
					Player[i].thirst=Player[i].thirst+1.5;
				end
				HT_Check(i);
			end
		end
	end
end

function HT_Check(playerid)
	if Player[playerid].hunger<3 then
		HideTexture(playerid,hungtx[1]);
		HideTexture(playerid,hungtx[2]);
		HideTexture(playerid,hungtx[3]);
		ShowTexture(playerid,hungtx[0]);
	elseif Player[playerid].hunger>=3 and Player[playerid].hunger<7 then
		HideTexture(playerid,hungtx[0]);
		HideTexture(playerid,hungtx[2]);
		HideTexture(playerid,hungtx[3]);
		ShowTexture(playerid,hungtx[1]);
	
	elseif Player[playerid].hunger>=7 and Player[playerid].hunger<11 then
		HideTexture(playerid,hungtx[0]);
		HideTexture(playerid,hungtx[1]);
		HideTexture(playerid,hungtx[3]);
		ShowTexture(playerid,hungtx[2]);
	
	elseif Player[playerid].hunger>=11 and Player[playerid].hunger<15 then
		HideTexture(playerid,hungtx[0]);
		HideTexture(playerid,hungtx[1]);
		HideTexture(playerid,hungtx[2]);
		ShowTexture(playerid,hungtx[3]);
	
	elseif Player[playerid].hunger>=15 then
		HideTexture(playerid,hungtx[0]);
		HideTexture(playerid,hungtx[1]);
		HideTexture(playerid,hungtx[2]);
		HideTexture(playerid,hungtx[3]);
	
		Hunger_Critical(playerid);
	end
	
	if Player[playerid].hunger<15 then
		SetPlayerMaxHealth(playerid,Player[playerid].max_health);
		SetPlayerStrength(playerid,Player[playerid].strength);
	end
	
	if Player[playerid].thirst<3 then
		HideTexture(playerid,thirtx[1]);
		HideTexture(playerid,thirtx[2]);
		HideTexture(playerid,thirtx[3]);
		ShowTexture(playerid,thirtx[0]);
	elseif Player[playerid].thirst>=3 and Player[playerid].thirst<7 then
		HideTexture(playerid,thirtx[0]);
		HideTexture(playerid,thirtx[2]);
		HideTexture(playerid,thirtx[3]);
		ShowTexture(playerid,thirtx[1]);
	
	elseif Player[playerid].thirst>=7 and Player[playerid].thirst<11 then
		HideTexture(playerid,thirtx[0]);
		HideTexture(playerid,thirtx[1]);
		HideTexture(playerid,thirtx[3]);
		ShowTexture(playerid,thirtx[2]);
	
	elseif Player[playerid].thirst>=11 and Player[playerid].thirst<15 then
		HideTexture(playerid,thirtx[0]);
		HideTexture(playerid,thirtx[1]);
		HideTexture(playerid,thirtx[2]);
		ShowTexture(playerid,thirtx[3]);
	
	elseif Player[playerid].thirst>=15 then
		HideTexture(playerid,thirtx[0]);
		HideTexture(playerid,thirtx[1]);
		HideTexture(playerid,thirtx[2]);
		HideTexture(playerid,thirtx[3]);
	
		Thirst_Critical(playerid);
	end
	
	if Player[playerid].thirst<15 then
		SetPlayerDexterity(playerid,Player[playerid].dexterity);
	end
end

function Hunger_Critical(playerid)
	local crit_percent=10;
	crit_percent=10+5*(Player[playerid].hunger-15);
	if crit_percent>80 then
		crit_percent=80;
	end
	
	SetPlayerMaxHealth(playerid,Player[playerid].max_health-(Player[playerid].max_health/100*crit_percent));
	SetPlayerStrength(playerid,Player[playerid].strength-(Player[playerid].strength/100*crit_percent));
	local mh=GetPlayerMaxHealth(playerid);
	local h=GetPlayerHealth(playerid);
	if GetPlayerHealth(playerid)>GetPlayerMaxHealth(playerid) then
		CompleteHeal(playerid);
	end
end

function Thirst_Critical(playerid)
	local crit_percent=10;
	crit_percent=10+5*(Player[playerid].thirst-15);
	if crit_percent>80 then
		crit_percent=80;
	end
	SetPlayerDexterity(playerid,Player[playerid].dexterity-(Player[playerid].dexterity/100*crit_percent));

end

function OnPlayerMD5File(playerid, pathFile, hash)
 
    if pathFile == "Data\\WOM_COLONY.VDF" then
 
        --[[if hash ~= "AA5CA9041C35E90FFD3D7B78ECC74734" then
            SendPlayerMessage(playerid,255,255,0,"У тебя нет нужного РП пака для сервера.");
			SendPlayerMessage(playerid,255,255,0,"You do not have the correct pack for RP server.");
			SendPlayerMessage(playerid,255,255,0,"Download: heart-of-roleplay.tk.hostinghood.com");
            Kick(playerid);
			end]]
	elseif pathFile == "_work\\data\\scripts\\_compiled\\gothic.dat" then
		if hash ~= "c6fb6cbc86bdf80e5c79d0767b6d803b" and hash ~= "81aa52c0d2e22ca1140b0ac6ada6f48b" then
			SendPlayerMessage(playerid,255,255,0,"У тебя нет корретного файла GOTHIC.DAT");
			SendPlayerMessage(playerid,255,255,0,"You have got incorrect GOTHIC.DAT!.");
			SendPlayerMessage(playerid,255,255,0,"Download: http://heart-of-roleplay.tk.hostinghood.com/.");
            Kick(playerid);
        end
        end
end

function Logon_Info(playerid)
	--ShowChat(playerid,0)
	PlayPlayerSound(playerid,CreateSound("CHAPTER_01.WAV"));
	FreezePlayer(playerid, 1);
	--[[logontitle = CreatePlayerDraw(playerid,3000,2150,"WORLD OF MORDRAG ROLEPLAY SERVER","FONT_OLD_20_WHITE_HI.TGA",0,196,255);
	local logtext1="   Добро пожаловать на RP сервер проекта World of Mordrag.";
	local logtext2="   Если вы зашли на сервер впервые, введите /рег (пароль)";
	local logtext3="   Если же вы зарегистрированы, введите /лог (пароль).";
	local logtext4="   Для смены облика (скина) введите /вскин. Альтернатива /скин";
	local logtext5="   (переключение в меню происходит стрелками, выбор - ENTER)"
	local logtext6="                                     vk.com/mordrag_roleplay";
	logontxt1 = CreatePlayerDraw(playerid,3100,2500,logtext1,"Font_10_Book_Hi.TGA",255,255,255);
	logontxt2 = CreatePlayerDraw(playerid,3100,2900,logtext2,"Font_10_Book_Hi.TGA",255,255,255);
	logontxt3 = CreatePlayerDraw(playerid,3100,3300,logtext3,"Font_10_Book_Hi.TGA",255,255,255);
	logontxt4 = CreatePlayerDraw(playerid,3100,3700,logtext4,"Font_10_Book_Hi.TGA",255,255,255);
	logontxt5 = CreatePlayerDraw(playerid,3100,4100,logtext5,"Font_10_Book_Hi.TGA",255,255,255);
	logontxt6 = CreatePlayerDraw(playerid,3100,6800,logtext6,"Font_10_Book_Hi.TGA",255,255,255);
	ShowTexture(playerid,logontx);
	ShowTexture(playerid,womtx);
	ShowPlayerDraw(playerid,logontitle);
	ShowPlayerDraw(playerid,logontxt1);
	ShowPlayerDraw(playerid,logontxt2);
	ShowPlayerDraw(playerid,logontxt3);
	ShowPlayerDraw(playerid,logontxt4);
	ShowPlayerDraw(playerid,logontxt5);
	ShowPlayerDraw(playerid,logontxt6);
	SetTimerEx("Disable_Logon",25*1000,0,playerid);]]
end

function Disable_Logon(playerid)
	ShowChat(playerid,1)
	HideTexture(playerid,logontx);
	HideTexture(playerid,womtx);
	HidePlayerDraw(playerid,logontitle);
	HidePlayerDraw(playerid,logontxt1);
	HidePlayerDraw(playerid,logontxt2);
	HidePlayerDraw(playerid,logontxt3);
	HidePlayerDraw(playerid,logontxt4);
	HidePlayerDraw(playerid,logontxt5);
	HidePlayerDraw(playerid,logontxt6);
end

function OnPlayerHit(playerid, killerid)
 local p_x, p_y, p_z = GetPlayerPos(killerid);

if GetPlayerInstance(playerid) == "PC_HERO" and IsNPC(playerid) == 1 then
	SetPlayerHealth(playerid,GetPlayerMaxHealth(playerid));
elseif GetPlayerInstance(playerid) == "Sheep" or GetPlayerInstance(playerid) == "Hammel" and IsNPC(playerid) == 1 then
	SetPlayerHealth(playerid,GetPlayerMaxHealth(playerid));
	end
		
if Player[playerid].invis == true then
		SetPlayerHealth(killerid,0);
		PlayAnimation(killerid,"T_DEADB");
		GameTextForPlayer(killerid,3000,3500,"Не стоило это делать","Font_Old_10_White_Hi.TGA",0,255,0,5000);
end
end

function OnPlayerUnconscious(playerid, p_classid, killerid, k_classid)
 local uncon_name = GetPlayerName(playerid);
 for i = 0, MAX_PLAYERS - 1 do
 if GetDistancePlayers(playerid,i) <= 1100 then  
SendPlayerMessage(i,0,213,255,string.format("%s %s",uncon_name,"потерял сознание."));
--GiveItem(playerid,oruzhka,1);
UnequipMeleeWeapon(playerid);
UnequipRangeWeapon(playerid);

end
end
end

function Unconca()
CreateItem(Player[playerid].mel,1,xq,yq,zq,GetPlayerWorld(playerid));
SendPlayerMessage(playerid,0,213,255,string.format("%s %s",Player[playerid].mel,"опасна."));
Player[playerid].timer = true;
end

function OnPlayerStandUp(playerid)
	--[[if Player[playerid].mel~="NULL" then
		GiveItem(playerid,Player[playerid].mel,1);
		Player[playerid].mel="NULL";
	end]]
	local name = GetPlayerName(playerid);
	 for i = 0, MAX_PLAYERS - 1 do
	 if GetDistancePlayers(playerid,i) <= 1100 then
	  
	   SendPlayerMessage(i,0,213,255,string.format("%s %s",name,"поднялся с земли."));   
	 end
	end
end

function OnPlayerChangeWorld(playerid, world)
    --[[if world == "WOM_COLONY\\WOM_COLONY.ZEN" then
	    SetPlayerWorld(playerid,"WOM_COLONY.ZEN","START");
		SetPlayerPos(playerid,-22142.0546875, -3109.78125, -26207.619140625, 6);
		SendPlayerMessage(playerid,255,0,0,"Мудак, сказано же - в колонию не ходить!");
	end]]
end

function OnPlayerChangeClass(playerid, classid)
if IsNPC(playerid) == 0 then
		Player[playerid].nick = GetPlayerName(playerid);
		local file = io.open("account/"..Player[playerid].nick..".txt","r+");
		if file then
			SendPlayerMessage(playerid,0,255,0,"Чтобы войти, пропишите - /лог (пароль)");
			--GameTextForPlayer(playerid,1200, 4450,"Чтобы войти, пиши - /лог (пароль)","Font_Old_20_White_Hi.TGA",255,255,0,25000);
			FreezePlayer(playerid,1);
			file:close();
		else
			SendPlayerMessage(playerid,0,255,0,"Чтобы зарегистрироваться, пропишите: /рег (пароль)");
			--GameTextForPlayer(playerid,1200, 4450,"Чтобы зарегистрироваться, пиши: /рег (пароль)","Font_Old_20_White_Hi.TGA",255,255,0,30000);
			FreezePlayer(playerid,1);
	end
SpawnPlayer(playerid);
end
end

function OnPlayerSpawn(playerid, classid)
if IsNPC(playerid) == 0 and deathcounter[playerid]>0 then
	SetPlayerPos(playerid,-5882.2651367188, -251.90199279785, -818.64013671875);
	SetPlayerAngle(playerid,36);
end
--[[if IsNPC(playerid) == 1 then
		if playerid == Player[playerid].id then
			local x = Player[playerid].x;
			local y = Player[playerid].y;
			local z = Player[playerid].z;
			SetPlayerPos(playerid,x,y,z);
		end
	end]]

end

function OnPlayerDeath(playerid, p_classid, killerid, k_classid)
UnequipMeleeWeapon(playerid);
UnequipRangeWeapon(playerid);
	if IsNPC(playerid) == 0 and IsNPC(killerid) == 0 or IsNPC(killerid) == 1 then
	if killerid == -1 then
	    SendMessageToAll(29,210,230,string.format("%s %s",GetPlayerName(playerid),"совершил самоубийство."));
		Player[playerid].deaths = Player[playerid].deaths + 1
                SendPlayerMessage(playerid,250,0,0,"Если это была не РП смерть - перезайдите на сервер! Спасибо!");
				SendPlayerMessage(playerid,250,0,0,"У вас 20 минут, чтобы выйти до обнуления аккаунта.");
	else
		SendMessageToAll(29,210,230,string.format("%s %s %s",GetPlayerName(killerid),"убил",GetPlayerName(playerid)));
		Player[killerid].kills = Player[killerid].kills + 1
		Player[playerid].deaths = Player[playerid].deaths + 1
                SendPlayerMessage(playerid,250,0,0,"Если это была не РП смерть - перезайдите на сервер! Спасибо!");	
				SendPlayerMessage(playerid,250,0,0,"У вас 20 минут, чтобы выйти до обнуления аккаунта.");
	end
	end

 
	--[[if IsNPC(playerid) == 1 then
local x,y,z = GetPlayerPos(playerid);
Player[playerid].x = x;
Player[playerid].y = y;
Player[playerid].z = z;
Player[playerid].id = playerid;
SetTimerEx("SpawnPlayer",29*1000,0,playerid);
end]]

	--[[if IsNPC(playerid) == 1 then
	SetTimerEx("SpawnPlayer",1200000*3,0,playerid);
	end]]

--if IsNPC(playerid) == 0 then
--deathcounter[playerid]=deathcounter[playerid]+1;
--end
	
local inst = GetPlayerInstance(playerid);
local razdelka = GetPlayerScience(killerid,SCIENCE_COLLECTING_TROPHIES);
if inst == "Wolf" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_WolfFur",1);
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Bloodfly" then
if razdelka == 0 then
GiveItem(killerid,"ItAt_Wing",1);
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_Wing",2);
GiveItem(killerid,"ItAt_Sting",1);
end
elseif inst == "Swampdrone" then
if razdelka == 0 then
GiveItem(killerid,"ItAt_Wing",1);
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_Wing",2);
end
elseif inst == "Blattcrawler" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
GiveItem(killerid,"ITAT_CLAW",1);
end
elseif inst == "Bloodhound" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",3);
GiveItem(killerid,"ItAt_ShadowFur",1);
end
elseif inst == "Giant_DesertRat" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITAT_TEETH",1);
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Giant_Rat" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITAT_TEETH",1);
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Swamprat" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITAT_TEETH",1);
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Gobbo_Green" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",1);
GiveItem(killerid,"ItPl_Health_Herb_01",1);
end
elseif inst == "Gobbo_Black" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",1);
GiveItem(killerid,"ItPl_Health_Herb_01",1);
end
elseif inst == "Gobbo_Skeleton" then
if razdelka == 0 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",1);
elseif razdelka == 1 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",1);
GiveItem(killerid,"ItAt_SkeletonBone",1);
end
elseif inst == "Skeleton" then
if razdelka == 0 then
GiveItem(killerid,"ItAt_SkeletonBone",1);
elseif razdelka == 1 then
GiveItem(killerid,"ItMw_2H_Sword_M_01",0);
GiveItem(killerid,"ItAt_SkeletonBone",3);
end
elseif inst == "StoneGolem" then
if razdelka == 0 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",0);
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_StoneGolemHeart",1);
end
elseif inst == "FireGolem" then
if razdelka == 0 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",0);
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_FireGolemHeart",1);
end
elseif inst == "IceGolem" then
if razdelka == 0 then
GiveItem(killerid,"ItMw_1h_Bau_Mace",0);
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_IceGolemHeart",1);
end
elseif inst == "Icewolf" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITAT_TEETH",1);
GiveItem(killerid,"ITAT_WOLFFUR",1);
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Keiler" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITAT_TEETH",1);
GiveItem(killerid,"ItAt_Addon_KeilerFur",1);
GiveItem(killerid,"ITFOMUTTONRAW",2);
else
end
elseif inst == "Giant_Bug" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_BugMandibles",1);
else
end
elseif inst == "Giant_Rat" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItFOMUTTONRAW",2);
else
end
elseif inst == "Lurker" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 0 then
GiveItem(killerid,"ItAt_LurkerClaw",1);
GiveItem(killerid,"itat_LurkerSkin",1);
end
elseif inst == "Meatbug" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_Meatbugflesh",2);
end
elseif inst == "OrcBiter" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItFOMUTTONRAW",2);
end
elseif inst == "OrcElite_Roam" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITPO_HEALTH_02",1);
GiveItem(killerid,"ItMw_2H_OrcSword_02",0);
end
elseif inst == "OrcWarrior_Roam" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITPO_HEALTH_01",1);
GiveItem(killerid,"ItMw_2H_OrcAxe_02",0);
end
elseif inst == "OrcShaman_Sit" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITPO_HEALTH_02",1);
GiveItem(killerid,"ITPO_MANA_02",1);
GiveItem(killerid,"ItMw_2H_OrcAxe_01",0);
end
elseif inst == "Minecrawler" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_CrawlerMandibles",1);
GiveItem(killerid,"ItAt_CrawlerPlate",1);
end
elseif inst == "MinecrawlerWarrior" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ItAt_CrawlerMandibles",1);
GiveItem(killerid,"ItAt_CrawlerPlate",1);
end
elseif inst == "Molerat" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",3);
end
elseif inst == "Scavenger" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Scavenger_Demon" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
end
elseif inst == "Shadowbeast" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",3);
GiveItem(killerid,"ItAt_ShadowFur",1);
GiveItem(killerid,"ItAt_ShadowHorn",1);
end
elseif inst == "Sheep" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
GiveItem(killerid,"ItAt_SheepFur",1);
end
elseif inst == "Snapper" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
GiveItem(killerid,"ItAt_Teeth",1);
GiveItem(killerid,"ItAt_Claw",1);
end
elseif inst == "Razor" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
GiveItem(killerid,"ItAt_Teeth",1);
GiveItem(killerid,"ItAt_Claw",1);
end
elseif inst == "Swampshark" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",3);
GiveItem(killerid,"ItAt_SharkTeeth",1);
end
elseif inst == "Troll" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",6);
GiveItem(killerid,"ItAt_TrollFur",1);
GiveItem(killerid,"ItAt_TrollTooth",1);
end
elseif inst == "Troll_Black" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",6);
GiveItem(killerid,"ItAt_TrollFur",1);
GiveItem(killerid,"ItAt_TrollTooth",1);
end
elseif inst == "Waran" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",3);
GiveItem(killerid,"ItAt_LurkerSkin",1);
end
elseif inst == "FireWaran" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",3);
GiveItem(killerid,"ItAt_LurkerSkin",1);
end
elseif inst == "Warg" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITFOMUTTONRAW",2);
GiveItem(killerid,"ItAt_WargFur",1);
end
elseif inst == "Zombie01" then
if razdelka == 0 then
local dzmb1 = random(4)
	if dzmb1 == 0 then
	GiveItem(killerid,"ITAT_SKELETONBONE",1);
	elseif dzmb1 == 1 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
	elseif dzmb1 == 2 then
	GiveItem(killerid,"ITPO_HEALTH_01",1);
	elseif dzmb1 == 3 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
end
elseif razdelka == 1 then
local dzmb2 = random(4)
	if dzmb2 == 0 then
	GiveItem(killerid,"ITAT_SKELETONBONE",3);
	elseif dzmb2 == 1 then
	GiveItem(killerid,"ITPO_HEALTH_02",1);
	elseif dzmb2 == 2 then
	GiveItem(killerid,"ITPO_HEALTH_01",1);
	elseif dzmb2 == 3 then
	GiveItem(killerid,"ITPO_HEALTH_02",2);
end
end
elseif inst == "Zombie02" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITMI_ADDON_HEAD_BLOODWYN",1);
end
elseif inst == "Zombie03" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITMI_ADDON_HEAD_BLOODWYN",1);
end
elseif inst == "Zombie04" then
if razdelka == 0 then
SendPlayerMessage(killerid,250,0,0,"Вы ничего не добыли с моба.");
elseif razdelka == 1 then
GiveItem(killerid,"ITMI_ADDON_HEAD_BLOODWYN",1);
end
elseif inst == "BDT_1013_BANDIT_L" then
local oruzhka = random(3)
if oruzhka == 0 then
GiveItem(killerid,"ItPl_Health_Herb_01",2);
elseif oruzhka == 1 then
GiveItem(killerid,"ItPl_Health_Herb_02",1);
elseif oruzhka == 2 then
GiveItem(killerid,"ItPl_Mana_Herb_01",2);
elseif oruzhka == 3 then
GiveItem(killerid,"ItPl_Mana_Herb_02",1);
end
end
end


--Craft menu
function Create_Craft_Draw(playerid)
	PlayPlayerSound(playerid,CreateSound("MOB_BOOK_TURNPAGE.WAV"));
	Player[playerid].craftmenu={};
	Player[playerid].craft_indexline = CreatePlayerDraw(playerid,4000,1300, "КРАФТ","FONT_OLD_20_WHITE_HI.TGA",0,255,255);
	Player[playerid].ingline = CreatePlayerDraw(playerid,5000,1300, "СОСТАВ","FONT_OLD_20_WHITE_HI.TGA",0,255,255);
	for i=0, MAX_CRAFT_MENU-1 do
		Player[playerid].craftmenu[i]={};
		Player[playerid].craftmenu[i].name = CreatePlayerDraw(playerid,4000,1800+300*i,Craft[i].menu_name,"FONT_OLD_10_WHITE_HI.TGA",255,255,0);
		Player[playerid].craftmenu[i].line={};
			for j=0,Craft[i].max_items-1 do
				Player[playerid].craftmenu[i].line[j]={};
				Player[playerid].craftmenu[i].line[j].name = CreatePlayerDraw(playerid,4300,1800+300*j,Craft[i].item[j].name,"FONT_OLD_10_WHITE_HI.TGA",255,255,0);
				Player[playerid].craftmenu[i].line[j].ing={};
					for l=0, Craft[i].item[j].max_ingredients-1 do
						Player[playerid].craftmenu[i].line[j].ing[l]={};
						Player[playerid].craftmenu[i].line[j].ing[l].name = CreatePlayerDraw(playerid,5050,1800+300*l,string.format("%d x %s",Craft[i].item[j].ingredient[l].count,Craft[i].item[j].ingredient[l].name),"FONT_OLD_10_WHITE_HI.TGA",255,255,0);
					end
			end
	end
	
	
		ShowDraw(playerid,returnd);
		Update_Craft_Draw(playerid); 
end

function Update_Craft_Draw(playerid)
	if Player[playerid].SubMenu==-1 then
		for i=0, MAX_CRAFT_MENU-1 do
			if GetPlayerScience(playerid,Craft[Player[playerid].craft_cursor].science)==1 or Craft[Player[playerid].craft_cursor].science==-1 then
				if Player[playerid].craft_cursor==i then
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[i].name,4000,1800+300*i,Craft[i].menu_name,"FONT_OLD_10_WHITE_HI.TGA",0,255,0);
				else
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[i].name,4000,1800+300*i,Craft[i].menu_name,"FONT_OLD_10_WHITE_HI.TGA",255,127,0);
				end
			else
				if Player[playerid].craft_cursor==i then
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[i].name,4000,1800+300*i,Craft[i].menu_name,"FONT_OLD_10_WHITE_HI.TGA",255,0,0);
				else
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[i].name,4000,1800+300*i,Craft[i].menu_name,"FONT_OLD_10_WHITE_HI.TGA",150,0,0);
				end
			end
			ShowPlayerDraw(playerid,Player[playerid].craftmenu[i].name);
		end
	else
		for i=0, MAX_CRAFT_MENU-1 do
			HidePlayerDraw(playerid,Player[playerid].craftmenu[i].name);
		end
	end
	
	if Player[playerid].SubMenu>-1 then
		for i=0, Craft[Player[playerid].SubMenu].max_items-1 do
			
			if Player[playerid].craft_cursor==i then
				for l=0, Craft[Player[playerid].SubMenu].item[i].max_ingredients-1 do
					ShowPlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].ing[l].name);
				end
			elseif Player[playerid].craft_cursor~=i then
				for l=0, Craft[Player[playerid].SubMenu].item[i].max_ingredients-1 do
					HidePlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].ing[l].name);
				end			
			end
			
			
			if Player[playerid].craft_cursor==i then
				if Player[playerid].able_craft[i]==Craft[Player[playerid].SubMenu].item[i].max_ingredients then
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].name,4000,2800+300*(i-Player[playerid].craft_cursor),Craft[Player[playerid].SubMenu].item[i].name,"FONT_OLD_10_WHITE_HI.TGA",0,255,0);
				else
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].name,4000,2800+300*(i-Player[playerid].craft_cursor),Craft[Player[playerid].SubMenu].item[i].name,"FONT_OLD_10_WHITE_HI.TGA",255,0,0);
				end
			else
				if Player[playerid].able_craft[i]==Craft[Player[playerid].SubMenu].item[i].max_ingredients then
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].name,4000,2800+300*(i-Player[playerid].craft_cursor),Craft[Player[playerid].SubMenu].item[i].name,"FONT_OLD_10_WHITE_HI.TGA",255,127,0);
				else
				
					UpdatePlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].name,4000,2800+300*(i-Player[playerid].craft_cursor),Craft[Player[playerid].SubMenu].item[i].name,"FONT_OLD_10_WHITE_HI.TGA",150,0,0);
				end
			end
			if (i-Player[playerid].craft_cursor)>=-3 and (i-Player[playerid].craft_cursor)<=6 then
				ShowPlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].name);
			else
				HidePlayerDraw(playerid,Player[playerid].craftmenu[Player[playerid].SubMenu].line[i].name);
			end
		end
	else
		for i=0, MAX_CRAFT_MENU-1 do
			for j=0, Craft[i].max_items-1 do
				HidePlayerDraw(playerid,Player[playerid].craftmenu[i].line[j].name);
				for l=0, Craft[i].item[j].max_ingredients-1 do
					HidePlayerDraw(playerid,Player[playerid].craftmenu[i].line[j].ing[l].name);
				end	
			end
		end
	end
	
	if Player[playerid].SubMenu==-1 then
		UpdatePlayerDraw(playerid,Player[playerid].craft_indexline, 4000,1300, "КРАФТ","FONT_OLD_20_WHITE_HI.TGA",0,255,255);
		ShowPlayerDraw(playerid,Player[playerid].craft_indexline);
		HidePlayerDraw(playerid,Player[playerid].ingline);
		HideTexture(playerid,bgci);
	elseif Player[playerid].SubMenu>-1 then
		UpdatePlayerDraw(playerid,Player[playerid].craft_indexline, 4000,1300, string.upper(Craft[Player[playerid].SubMenu].menu_name),"FONT_OLD_20_WHITE_HI.TGA",0,255,255);	
		ShowPlayerDraw(playerid,Player[playerid].craft_indexline);
		ShowPlayerDraw(playerid,Player[playerid].ingline);
		ShowTexture(playerid,bgci);
	elseif Player[playerid].SubMenu<-1 then
		HidePlayerDraw(playerid,Player[playerid].craft_indexline);
		HidePlayerDraw(playerid,Player[playerid].ingline);
		HideTexture(playerid,bgci);
	end
end

function Check_Craft(playerid)
	for i=0, Craft[Player[playerid].SubMenu].max_items-1 do
		Player[playerid].able_craft[i]=0;
		for j=0, Craft[Player[playerid].SubMenu].item[i].max_ingredients-1 do
			HasItem(playerid,Craft[Player[playerid].SubMenu].item[i].ingredient[j].instance,10000+100*i+j);
		end
	end
end


--Letter
function Show_Letter(playerid,index)
	if string.len(Player[playerid].lists[index].text)>50 then
		Player[playerid].line1=CreatePlayerDraw(playerid,4300,3000,string.format("%s%s",string.sub(Player[playerid].lists[index].text,1,50),"-"),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
		if string.len(Player[playerid].lists[index].text)>100 then
			Player[playerid].line2=CreatePlayerDraw(playerid,4300,3200,string.format("%s%s",string.sub(Player[playerid].lists[index].text,51,100),"-"),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
			if string.len(Player[playerid].lists[index].text)>150 then
				Player[playerid].line3=CreatePlayerDraw(playerid,4300,3400,string.format("%s%s",string.sub(Player[playerid].lists[index].text,101,150),"-"),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
				Player[playerid].line4=CreatePlayerDraw(playerid,4300,3600,string.sub(Player[playerid].lists[index].text,151,string.len(Player[playerid].lists[index].text)),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
				ShowPlayerDraw(playerid,Player[playerid].line3);
				ShowPlayerDraw(playerid,Player[playerid].line4);
			else
				Player[playerid].line3=CreatePlayerDraw(playerid,4300,3400,string.sub(Player[playerid].lists[index].text,101,string.len(Player[playerid].lists[index].text)),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
				ShowPlayerDraw(playerid,Player[playerid].line3);
			end
		else
			Player[playerid].line2=CreatePlayerDraw(playerid,4300,3200,string.sub(Player[playerid].lists[index].text,51,string.len(Player[playerid].lists[index].text)),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
		end
	ShowPlayerDraw(playerid,Player[playerid].line1);
	ShowPlayerDraw(playerid,Player[playerid].line2);
	else
		Player[playerid].line1=CreatePlayerDraw(playerid,4200,3000,Player[playerid].lists[index].text,"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
	ShowPlayerDraw(playerid,Player[playerid].line1);
	end
	
	Player[playerid].author=CreatePlayerDraw(playerid,6000,4000,Player[playerid].lists[index].author,"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
	ShowPlayerDraw(playerid,Player[playerid].author);
	
	if Player[playerid].lists[index].d_day>0 and Player[playerid].lists[index].d_month>0 and Player[playerid].lists[index].d_year>0 then
		Player[playerid].dated=CreatePlayerDraw(playerid,5900,4200,string.format("%d %s %d",Player[playerid].lists[index].d_day,months[Player[playerid].lists[index].d_month],Player[playerid].lists[index].d_year),"FONT_OLD_10_WHITE_HI.TGA",0,0,0);
		ShowPlayerDraw(playerid,Player[playerid].dated);
	end
	Player[playerid].lists[index].material=1;
	if Player[playerid].lists[index].enabled_mark==1 then
		ShowTexture(playerid,wax);
	end
	ShowTexture(playerid,bgl[Player[playerid].lists[index].material]);
	Player[playerid].current_list=index;
	ShowChat(playerid, 0);
	SetTimerEx("Hide_Letter",6000,0,playerid);
end

function Hide_Letter(playerid)
	DestroyAllPlayerDraws(playerid);
	HideTexture(playerid,bgl[Player[playerid].lists[Player[playerid].current_list].material]);
	HideTexture(playerid,wax);
	ShowChat(playerid, 1);
end
--End letter

function Create_Sedit_Draw(playerid)
	local x,y,z=GetPlayerPos(playerid);
	--UnequipMeleeWeapon(playerid);
	--UnequipRangeWeapon(playerid);
	--UnequipArmor(playerid);
	y=y-40;
	Chairs[playerid]=Vob.Create("DT_CHAINBOX.3DS",GetPlayerWorld(playerid),x,y,z);
	Chairs[playerid]:SetRotation(0,GetPlayerAngle(playerid),0);
	PlayPlayerSound(playerid,CreateSound("MOB_BOOK_TURNPAGE.WAV"));
	Player[playerid].gender = CreatePlayerDraw(playerid,7000,1800,"Пол","FONT_10_BOOK.TGA",145,255,0);
	Player[playerid].body = CreatePlayerDraw(playerid,7000,2000,"Тело","FONT_10_BOOK.TGA",145,255,0);
	Player[playerid].head = CreatePlayerDraw(playerid,7000,2200,"Голова","FONT_10_BOOK.TGA",145,255,0);
	Player[playerid].face = CreatePlayerDraw(playerid,7000,2400,"Лицо","FONT_10_BOOK.TGA",145,255,0);
	Player[playerid].fat = CreatePlayerDraw(playerid,7000,2600,"Вес","FONT_10_BOOK.TGA",145,255,0);
	Player[playerid].scale = CreatePlayerDraw(playerid,7000,2800,"Рост","FONT_10_BOOK.TGA",145,255,0);
	Player[playerid].save = CreatePlayerDraw(playerid,7000,3000,"Сохранить","FONT_10_BOOK.TGA",145,255,0);
	
			Update_Show_Sedit_Draw(playerid);
end

function Update_Show_Sedit_Draw(playerid)
	if Player[playerid].sedit_cursor == 0 then
		UpdatePlayerDraw(playerid,Player[playerid].gender,7000,1800,"< Пол >","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].gender,7000,1800,"Пол","FONT_10_BOOK.TGA",145,255,0);
	end
	
	if Player[playerid].sedit_cursor == 1 then
		UpdatePlayerDraw(playerid,Player[playerid].body,7000,2000,"< Тело >","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].body,7000,2000,"Тело","FONT_10_BOOK.TGA",145,255,0);
	end
	
	if Player[playerid].sedit_cursor == 2 then
		UpdatePlayerDraw(playerid,Player[playerid].head,7000,2200,"< Голова >","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].head,7000,2200,"Голова","FONT_10_BOOK.TGA",145,255,0);
	end
	
	if Player[playerid].sedit_cursor == 3 then
		UpdatePlayerDraw(playerid,Player[playerid].face,7000,2400,"< Лицо >","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].face,7000,2400,"Лицо","FONT_10_BOOK.TGA",145,255,0);
	end
	
	if Player[playerid].sedit_cursor == 4 then
		UpdatePlayerDraw(playerid,Player[playerid].fat,7000,2600,"< Вес >","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].fat,7000,2600,"Вес","FONT_10_BOOK.TGA",145,255,0);
	end
	
	if Player[playerid].sedit_cursor == 5 then
		UpdatePlayerDraw(playerid,Player[playerid].scale,7000,2800,"< Рост >","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].scale,7000,2800,"Рост","FONT_10_BOOK.TGA",145,255,0);
	end
	
	if Player[playerid].sedit_cursor == 6 then
		UpdatePlayerDraw(playerid,Player[playerid].save,7000,3000,"-Сохранить-","FONT_10_BOOK.TGA",255,205,0);
	else
		UpdatePlayerDraw(playerid,Player[playerid].save,7000,3000,"Сохранить","FONT_10_BOOK.TGA",145,255,0);
	end
	
	ShowPlayerDraw(playerid,Player[playerid].gender);
	ShowPlayerDraw(playerid,Player[playerid].body);
	ShowPlayerDraw(playerid,Player[playerid].head);
	ShowPlayerDraw(playerid,Player[playerid].face);
	ShowPlayerDraw(playerid,Player[playerid].fat);
	ShowPlayerDraw(playerid,Player[playerid].scale);
	ShowPlayerDraw(playerid,Player[playerid].save);
	ShowTexture(playerid,bg);
end

function Skin_Edit(playerid)
FreezePlayer(playerid,1);
PlayAnimation(playerid,"S_BENCH_S1");
	--gender marking
	if Player[playerid].sedit_gender == 0 then
		Player[playerid].sedit_gender_texture="HUM_BODY_NAKED0";
	elseif Player[playerid].sedit_gender == 1 then
		Player[playerid].sedit_gender_texture="HUM_BODY_BABE0";
	end
	
	--head marking
	if Player[playerid].sedit_head == 0 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BALD";
	elseif Player[playerid].sedit_head == 1 then
		Player[playerid].sedit_head_texture="HUM_HEAD_FATBALD";
	elseif Player[playerid].sedit_head == 2 then
		Player[playerid].sedit_head_texture="HUM_HEAD_FIGHTER";
	elseif Player[playerid].sedit_head == 3 then
		Player[playerid].sedit_head_texture="HUM_HEAD_PONY";
	elseif Player[playerid].sedit_head == 4 then
		Player[playerid].sedit_head_texture="HUM_HEAD_PSIONIC";
	elseif Player[playerid].sedit_head == 5 then
		Player[playerid].sedit_head_texture="HUM_HEAD_THIEF";
	elseif Player[playerid].sedit_head == 6 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABEHAIR";
	elseif Player[playerid].sedit_head == 7 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE";
	elseif Player[playerid].sedit_head == 8 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE1";
	elseif Player[playerid].sedit_head == 9 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE2";
	elseif Player[playerid].sedit_head == 10 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE4";
	elseif Player[playerid].sedit_head == 11 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE5";
	elseif Player[playerid].sedit_head == 12 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE6";
	elseif Player[playerid].sedit_head == 13 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE7";
	elseif Player[playerid].sedit_head == 14 then
		Player[playerid].sedit_head_texture="HUM_HEAD_BABE8";
	end
	
	
	SetPlayerAdditionalVisual(playerid,Player[playerid].sedit_gender_texture,Player[playerid].sedit_body,Player[playerid].sedit_head_texture,Player[playerid].sedit_face);
	SetPlayerFatness(playerid, Player[playerid].sedit_fatness);
	SetPlayerScale(playerid, 1, Player[playerid].sedit_scale, 1);
end


function OnPlayerCommandText(playerid, cmdtext)
local cmd, params = GetCommand(cmdtext); 

local rsd,dd,dm,dy = sscanf(params,"ddd");

local listresult,emark,edate,eauthor,ltext = sscanf(params, "ddds");
	local listresult1,receiver,index_list= sscanf(params, "dd");
	local listresult2,index_list_destroy= sscanf(params, "d");
	local listresult3,index_list_review= sscanf(params, "d");
	local sresult,string1=sscanf(params,"s");
	
	if cmd == "/вн" then
		if sresult==1 then
			Player[playerid].discribe = string1;
		end
	end
	if cmd == "/спм" and listresult==1 then
		local write_sound=CreateSound("LOGENTRY.WAV");
		if (emark>=0 and emark<=1) and (eauthor>=0 and eauthor<=1) and (edate>=0 and edate<=1) then
			local name=GetPlayerName(playerid);
			PlayAnimation(playerid,"T_1HSINSPECT");
			for i=0, GetMaxPlayers() do
				local x,y,z=GetPlayerPos(playerid);
				PlayPlayerSound3D(i,write_sound,x,y,z,1000);
			end
			CMD_ME(playerid,"записал что-то на куске пергамента");
			Player[playerid].lists[Player[playerid].lists_count].enabled_mark=emark;
			Player[playerid].lists[Player[playerid].lists_count].mark_untouched=emark;
			if emark==1 then
				CMD_ME(playerid,"свернул письмо и поставил восковую печать");
			end
			
			if edate==1 then
				Player[playerid].lists[Player[playerid].lists_count].d_day=day;
				Player[playerid].lists[Player[playerid].lists_count].d_month=month;
				Player[playerid].lists[Player[playerid].lists_count].d_year=year;
			else
				Player[playerid].lists[Player[playerid].lists_count].d_day=0;
				Player[playerid].lists[Player[playerid].lists_count].d_month=0;
				Player[playerid].lists[Player[playerid].lists_count].d_year=0;
			end
			
			if eauthor == 1 then
				Player[playerid].lists[Player[playerid].lists_count].author=GetPlayerName(playerid);
			else
				Player[playerid].lists[Player[playerid].lists_count].author="Аноним";
			end
		Player[playerid].lists[Player[playerid].lists_count].text=string.gsub(ltext,"/",",");
			Player[playerid].lists_count=Player[playerid].lists_count+1;
			
		local playerFile=io.open("account/"..name.."_letters.txt","w");
		for i=0, Player[playerid].lists_count do
			if Player[playerid].lists[i].text~="NULL" then
				playerFile:write(Player[playerid].lists[i].mark_untouched, " ");
				playerFile:write(Player[playerid].lists[i].enabled_mark, " ");
				playerFile:write(Player[playerid].lists[i].d_day," ");
				playerFile:write(Player[playerid].lists[i].d_month," ");
				playerFile:write(Player[playerid].lists[i].d_year," ");
				playerFile:write(Player[playerid].lists[i].author, " ");
				playerFile:write(Player[playerid].lists[i].text, "\n");
			end
		end
		playerFile:close();
	
	
		else
			SendPlayerMessage(playerid,255,10,10,"Аргументы для создания письма некорректны");
		end
	elseif cmd == "/спм" then
			SendPlayerMessage(playerid,255,10,10,"Аргументы для создания письма некорректны");	
	end
	
	if cmd == "/дпм" and listresult1==1 then
		local name=GetPlayerName(playerid);
		if Player[playerid].lists[index_list].text~= "NULL" then
			if IsPlayerConnected(receiver) and GetDistancePlayers(playerid,receiver)<=500 then
				PlayAnimation(playerid,"S_IDROP");
				CMD_ME(playerid,string.format("%s %s","передал письмо",GetPlayerName(receiver)));
				Player[receiver].lists[Player[receiver].lists_count].enabled_mark=Player[playerid].lists[index_list].enabled_mark;
				Player[receiver].lists[Player[receiver].lists_count].mark_untouched=Player[playerid].lists[index_list].mark_untouched;
				Player[receiver].lists[Player[receiver].lists_count].author=Player[playerid].lists[index_list].author;
				Player[receiver].lists[Player[receiver].lists_count].text=Player[playerid].lists[index_list].text;
				Player[receiver].lists[Player[receiver].lists_count].d_day=Player[playerid].lists[index_list].d_day;
				Player[receiver].lists[Player[receiver].lists_count].d_month=Player[playerid].lists[index_list].d_month;
				Player[receiver].lists[Player[receiver].lists_count].d_year=Player[playerid].lists[index_list].d_year;
				Player[receiver].lists_count=Player[receiver].lists_count+1;
				
				if Player[playerid].lists_count~=index_list then
					for i=index_list, Player[playerid].lists_count-1 do
						Player[playerid].lists[i].enabled_mark=Player[playerid].lists[i+1].enabled_mark;
						Player[playerid].lists[i].mark_untouched=Player[playerid].lists[i+1].mark_untouched;
						Player[playerid].lists[i].author=Player[playerid].lists[i+1].author;
						Player[playerid].lists[i].text=Player[playerid].lists[i+1].text;		
						Player[playerid].lists[i].d_day=Player[playerid].lists[i+1].d_day;
						Player[playerid].lists[i].d_month=Player[playerid].lists[i+1].d_month;
						Player[playerid].lists[i].d_year=Player[playerid].lists[i+1].d_year;
					end
				end
				Player[playerid].lists_count=Player[playerid].lists_count-1;
			
			
			local playerFile=io.open("account/"..name.."_letters.txt","w");
			for i=0, Player[playerid].lists_count do
				if Player[playerid].lists[i].text~="NULL" then
					playerFile:write(Player[playerid].lists[i].mark_untouched, " ");
					playerFile:write(Player[playerid].lists[i].enabled_mark, " ");
					playerFile:write(Player[playerid].lists[i].d_day," ");
					playerFile:write(Player[playerid].lists[i].d_month," ");
					playerFile:write(Player[playerid].lists[i].d_year," ");
					playerFile:write(Player[playerid].lists[i].author, " ");
					playerFile:write(Player[playerid].lists[i].text, "\n");
				end
			end
			playerFile:close();
			
			name=GetPlayerName(receiver);
			local playerFile=io.open("account/"..name.."_letters.txt","w");
			for i=0, Player[receiver].lists_count do
				if Player[receiver].lists[i].text~="NULL" then
					playerFile:write(Player[receiver].lists[i].mark_untouched, " ");
					playerFile:write(Player[receiver].lists[i].enabled_mark, " ");
					playerFile:write(Player[receiver].lists[i].d_day," ");
					playerFile:write(Player[receiver].lists[i].d_month," ");
					playerFile:write(Player[receiver].lists[i].d_year," ");
					playerFile:write(Player[receiver].lists[i].author, " ");
					playerFile:write(Player[receiver].lists[i].text, "\n");
				end
			end
			playerFile:close();
			
			else
				SendPlayerMessage(playerid,255,10,10,"Получатель вне сети или же далеко от вас");
			end
		else
			SendPlayerMessage(playerid,255,10,10,"Данное письмо отсутствует");
		end
	end
	
	if cmd == "/упм" and listresult2==1 then
		if Player[playerid].lists_count~=index_list and Player[playerid].lists_count~=0 then
			CMD_ME(playerid,"поджег кусок пергамента и бросил на землю");
			for i=index_list_destroy, Player[playerid].lists_count-1 do
				Player[playerid].lists[i].enabled_mark=Player[playerid].lists[i+1].enabled_mark;
				Player[playerid].lists[i].mark_untouched=Player[playerid].lists[i+1].mark_untouched;
				Player[playerid].lists[i].author=Player[playerid].lists[i+1].author;
				Player[playerid].lists[i].text=Player[playerid].lists[i+1].text;		
			end
			local name=GetPlayerName(playerid);
			local playerFile=io.open("account/"..name.."_letters.txt","w");
			for i=0, Player[playerid].lists_count do
				if Player[playerid].lists[i].text~="NULL" then
					playerFile:write(Player[playerid].lists[i].mark_untouched, " ");
					playerFile:write(Player[playerid].lists[i].enabled_mark, " ");
					playerFile:write(Player[playerid].lists[i].d_day," ");
					playerFile:write(Player[playerid].lists[i].d_month," ");
					playerFile:write(Player[playerid].lists[i].d_year," ");
					playerFile:write(Player[playerid].lists[i].author, " ");
					playerFile:write(Player[playerid].lists[i].text, "\n");
				end
			end
			playerFile:close();
		end
			Player[playerid].lists_count=Player[playerid].lists_count-1;
	end
	
	if cmd == "/опм" and listresult3 == 1 then
		if index_list_review<=Player[playerid].lists_count-1 then
			PlayAnimation(playerid, "T_1HSINSPECT");
			CMD_ME(playerid,"осматривает письмо");
			if Player[playerid].lists[index_list_review].enabled_mark==1 then
				if Player[playerid].lists[index_list_review].mark_untouched==1 then
					SendPlayerMessage(playerid,255,255,0,"На письме стоит восковая печать.");
				else
					SendPlayerMessage(playerid,255,255,0,"Печать на письме содрана. Есть следы воска.");			
				end
			else
				SendPlayerMessage(playerid,255,255,0,"Письмо без восковой печати. Отсутствие восковых следов говорит о том, что печати и не было.");		
			end
		else
			SendPlayerMessage(playerid,255,0,0,"Письмо по этому индексу отсутствует!");
		end
	end
	
	if cmd == "/чпм" and listresult3 == 1 then
		if index_list_review<=Player[playerid].lists_count-1 then
			PlayAnimation(playerid, "T_PERCEPTION");
			if Player[playerid].lists[index_list_review].mark_untouched==1 then
				CMD_ME(playerid, "сорвал печать с письма");
				Player[playerid].lists[index_list_review].mark_untouched=0;
			end
			CMD_ME(playerid, "читает содержимое письма");
			Show_Letter(playerid,index_list_review);		
		else
			SendPlayerMessage(playerid,255,0,0,"Письмо по этому индексу отсутствует!");
		end
		
		local name=GetPlayerName(playerid);
		local playerFile=io.open("account/"..name.."_letters.txt","w");
		for i=0, Player[playerid].lists_count do
			if Player[playerid].lists[i].text~="NULL" then
				playerFile:write(Player[playerid].lists[i].mark_untouched, " ");
				playerFile:write(Player[playerid].lists[i].enabled_mark, " ");
				playerFile:write(Player[playerid].lists[i].d_day," ");
				playerFile:write(Player[playerid].lists[i].d_month," ");
				playerFile:write(Player[playerid].lists[i].d_year," ");
				playerFile:write(Player[playerid].lists[i].author, " ");
				playerFile:write(Player[playerid].lists[i].text, "\n");
			end
		end
		playerFile:close();
	end
	
	if cmd == "/письма" then
		local textl,total_textl;
		total_textl="-";
		SendPlayerMessage(playerid,255,255,0,string.format("%s %d %s","У вас ",Player[playerid].lists_count," писем"));
		if Player[playerid].lists_count~=0 then
			for i=0, Player[playerid].lists_count-1 do
				textl=string.format("%d%s%s",i,":",Player[playerid].lists[i].author);
				total_textl=string.format("%s %s",total_textl,textl);
			end
		SendPlayerMessage(playerid,255,255,0,total_textl);
		end
		
		
	end
	
	if cmd == "/ппомощь" then 
		SendPlayerMessage(playerid,0,255,255,"Чтобы написать письмо, воспользуйтесь командой /спм 0-1(поставить печать) 0-1(дата) 0-1(поставить подпись) текст");
		SendPlayerMessage(playerid,0,255,255,"Чтобы передать письмо, воспользуйтесь командой /дпм ид_игрока №_письма");
		SendPlayerMessage(playerid,0,255,255,"Чтобы уничтожить письмо, воспользуйтесь командой /упм номер");	
		SendPlayerMessage(playerid,0,255,255,"Чтобы прочитать письмо, воспользуйтесь командой /чпм номер");	
		SendPlayerMessage(playerid,0,255,255,"Чтобы посмотреть кол-во писем, воспользуйтесь командой /письма");	
	end
	
if cmdtext == "/админ" --вызов справки
	then
	CMD_AdminHelp(playerid);
elseif cmd == "/кик"
	then
	CMD_kick(playerid,params);
elseif cmd == "/сохранить"
	then
	local health = GetPlayerHealth(playerid);
	if Player[playerid].loggedIn == 1 then
	SaveParams(playerid);
	end

elseif cmd == "/навыкохоты"
	then
	GiveSkill(playerid,params);
elseif cmd == "/гильда"
	then
	SetPlayerGuild(playerid,"WOLF");
elseif cmd == "/лидер"
	then
	CMD_SETPLAYERLEADER(playerid,params);
elseif cmd == "/медяки"
	then
	CMD_GIVEMONEY(playerid,params);
elseif cmd == "/администрация"
	then
	CMD_MAll(playerid,params);
elseif cmd == "/бан"
	then
	CMD_Ban(playerid,params);
elseif cmd == "/килл"
	then
	CMD_Kill(playerid,params);
	elseif cmd == "/тревога"
	then
	CMD_ALARM(playerid);
	elseif cmd == "/стража"
	then
	CMD_GUARDS(playerid);
	elseif cmd == "/напомощь"
	then
	CMD_ALARMHELP(playerid);
	elseif cmd == "/вода"
	then
	WorkWater(playerid);
	elseif cmd == "/виноград"
	then
	WorkWino(playerid);
	elseif cmd == "/дерево"
	then
	WorkDrev(playerid); 
	elseif cmd == "/гриб"
	then
	WorkGrib(playerid);
	elseif cmd == "/хмель"
	then
	WorkHmel(playerid);
	elseif cmd == "/трава"
	then
	WorkTrav(playerid); 
	elseif cmd == "/яблоко"
	then
	WorkApple(playerid); 
	elseif cmd == "/болотник"
	then
	WorkSwamp(playerid); 
	elseif cmd == "/рыба"
	then
	WorkFish(playerid);
	elseif cmd == "/обмен"
	then
	CMD_OBMEN(playerid, params)
elseif cmd == "/тп"
	then
	CMD_Teleport(playerid,params);
elseif cmd == "/тайм"
	then
	CMD_Time(playerid,params);
	elseif cmd == "/give"
	then
		CMD_GiveItem(playerid,params);
	elseif cmd == "/выдать"
	then
		CMD_GiveIt(playerid,params);
	elseif cmd == "/помощь" then
	SendPlayerMessage(playerid,0,213,255,"-----------Меню помощи-----------");
	SendPlayerMessage(playerid,0,213,255,"/о - чат OOC, /ш - шепот, /лс - личные сообщения");
	SendPlayerMessage(playerid,0,213,255,"/я - действие персонажа, /к - крик");
	SendPlayerMessage(playerid,0,213,255,"/скин (тело) (голова) (лицо) - сменить внешность. Пример: /скин 1 2 3");
	SendPlayerMessage(playerid,0,213,255,"/п - показать деньги. /деньги (ID) (количество) - передать деньги игроку.");
	SendPlayerMessage(playerid,0,213,255,"Остальные команды тут /команды 1");
	elseif cmd == "/правила" then
	SendPlayerMessage(playerid,0,213,255,"-----------ПРАВИЛА - ЗАПРЕЩАЕТСЯ:-----------");
	SendPlayerMessage(playerid,0,213,255,"1.Бессмысленно убивать других игроков / ДМ (Kick/Ban)");
	SendPlayerMessage(playerid,0,213,255,"2.Материться, особенно в глобальном или РП чате, флуд. (Kick)");
	SendPlayerMessage(playerid,0,213,255,"3.Читы (BAN)");
	SendPlayerMessage(playerid,0,213,255,"4.Метагейминг (Kick) ");
	SendPlayerMessage(playerid,0,213,255,"5.Флуд в репорт (kick/ban)");
	SendPlayerMessage(playerid,0,213,255,"Остальные правила найдете на форуме.");
elseif cmd == "/команды" then
	CZAT_KOMENDY(playerid, params);
elseif cmd == "/п" or cmd == "/stats" then
	CMD_SHOWSTATS(playerid, params);
	elseif cmd == "/з" then
	CMD_PBANK(playerid, params);
elseif cmd == "/я" or cmd == "/me" then
	CMD_ME(playerid, params);
elseif cmd == "/м" or cmd == "/m" then
	CMD_MYUSLI(playerid, params);
elseif cmd == "/о" or cmd == "/o" then
	CMD_OOC(playerid, params);
elseif cmd == "/до" or cmd == "/do" then
	CMD_DO(playerid, params);
elseif cmd == "/по" or cmd == "/tr" then
	CMD_PO(playerid, params);
	elseif cmd == "/н" or cmd == "/n" then
	CMD_NEWS(playerid, params);
	elseif cmd == "/т" then
	CMD_GM(playerid, params);
	elseif cmd == "/г" then
	CMD_GL(playerid, params);
	elseif cmd == "/ж" then
	CMD_SERVERCHAT(playerid, params);
	elseif cmd == "/никнейм" then
	CMD_FIXNICK(playerid, params);
	elseif cmd == "/ники" then
	CMD_FIXNICK2(playerid);
	elseif cmd == "/скин"then
				CMD_VIS(playerid, params);
	elseif cmd == "/вскин" and Player[playerid].OnSkinEdit~=1  then 
				Create_Sedit_Draw(playerid);
				Player[playerid].OnSkinEdit=1;
				--Player[playerid].skin_edit_timer=SetTimerEx("Skin_Edit",200,1,playerid);
				Skin_Edit(playerid);
				Player[playerid].sedit_gender=0;
				Player[playerid].sedit_gender_texture="";
				Player[playerid].sedit_body=0;
				Player[playerid].sedit_head=0;
				Player[playerid].sedit_head_texture="";
				Player[playerid].sedit_face=0;
	elseif cmd == "/скелет" then
		if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 then
			local rsl,head1 = sscanf(params,"d");
			SetPlayerAdditionalVisual(playerid,"SKE_BODY",head1,"SKE_HEAD",head1);	
			
		end
	elseif cmd == "/хлеб"
	then
	CMD_HLEB(playerid);
	--[[elseif cmd == "/дерево" then
	HasItem(playerid, "ItMw_1H_Vlk_Axe", 333);]]
	elseif cmd == "/склад" then
	CMD_GETSKLAD(playerid, params);
	elseif cmd == "/ковать" then
		local p_x, p_y , p_z = GetPlayerPos(playerid);
			if GetDistance2D(p_x, p_y, 4581.7758789063, 447.35461425781, 213.04716491699) <= 150 then
				if Player[playerid].class == 4 then
					CMD_Craft( playerid, params )
				else
					SendPlayerMessage( playerid, 255, 0, 0, "Вы не кузнец!" )
				end
			end
	elseif cmd == "/тюрьма"
	then
		CMD_Jail(playerid,params);
	elseif cmd == "/освободить"
	then
		CMD_UJail(playerid,params);
elseif cmd == "/рег" or cmd == "/reg" then
	if Player[playerid].loggedIn == 0 then
		CMD_ZAREJESTRUJ(playerid, params);
	else
		SendPlayerMessage(playerid, 255, 0 , 0,"Вы уже зарегистрированы!");
	end
elseif cmd == "/лог" or cmd == "/log" then
	if Player[playerid].loggedIn == 0 then
		CMD_ZALOGUJ(playerid, params);		
	else
		SendPlayerMessage(playerid, 255,0 ,0,"Вы уже вошли!");
	end
elseif cmd == "/сменитьпароль" or cmd == "/changepasswd" then
	if Player[playerid].loggedIn == 1 then
		CMD_ZMIENHASLO(playerid, params);
	else
		SendPlayerMessage(playerid,255,0,0,"Вы должны войти чтобы сменить пароль!");
end	
elseif cmd == "/лс" or cmd == "/pm" then
	CMD_PM(playerid, params);
	elseif cmd == "/а" then
	CMD_AC(playerid, params);
	elseif cmd == "/репорт" or cmd == "/report" then
	CMD_REPORT(playerid, params);
	elseif cmd == "/к" or cmd == "/k" then
	CMD_K(playerid, params);
	elseif cmd == "/ш" or cmd == "/w" then
	CMD_SZ(playerid, params);
	elseif cmd == "/класс" then
	CMD_AWANS(playerid, params);
	elseif cmd == "/хилл" then
	CMD_HEAL(playerid, params);
	elseif cmd == "/должность" then
	CMD_SETRANK(playerid, params);
	elseif cmd == "/ник" then
	CMD_Name(playerid,params);
	elseif cmd == "/выдатьключи" then
	CMD_SETKEYS(playerid, params);
	elseif cmd == "/ключ"
	then
	CMD_GIVEKEYS(playerid,params);
	elseif cmd == "/админка" then
	CMD_ADMINKA(playerid, params);
	elseif cmd == "/д" then
	CMD_DROP(playerid,params);
	elseif cmd == "/инфо" then
		CMD_SHOWBANK(playerid,params);
	elseif cmd == "/посмотретьказну" then
		GETKAZNA(playerid,params);
	elseif cmd == "/казна"	then
		SETKAZNA(playerid,params);
	elseif cmd == "/наблюдение"	then
		CMD_SPEC(playerid, params);
	elseif cmd == "/навык"	then
		CMD_SCIENCE(playerid,params);
		CMD_WEAPONARY(playerid,params);
	elseif cmd == "/продать" then
			CMD_Sell(playerid, params);
	elseif cmd == "/принять" then
			CMD_Accept(playerid);
	elseif cmd == "/отказаться" then
			CMD_Refuse(playerid);
	elseif cmd == "/взять" then
			CMD_GET_SKLAD(playerid, params);
	elseif cmd == "/вернуть" then
	CMD_GIVE_SKLAD(playerid, params);
	elseif cmd == "/вер" then
		GIVESTAL(playerid);
	elseif cmd == "/снаряжение"	then
		CMD_INVEN(playerid);
	elseif cmd == "/кража"	then
		CMD_VOR(playerid,params);
elseif cmd == "/ранг" then
--SendPlayerMessage(playerid,255,0,0,"Не работает. Только команды:")
--SendPlayerMessage(playerid,255,0,0,"/должность | /пропуск")
--SendPlayerMessage(playerid,255,0,0,"Подробности узнавай на форуме")
   if Player[playerid].leader == 0 then
	SendPlayerMessage(playerid,255,0,0,"Вы не лидер!")
	elseif Player[playerid].leader == 1 then
	CMD_LEADER1(playerid,params);
	elseif Player[playerid].leader == 2 then
	CMD_LEADER2(playerid,params);
	elseif Player[playerid].leader == 3 then
	CMD_LEADER3(playerid,params);
	elseif Player[playerid].leader == 4 then
	CMD_LEADER4(playerid,params);
	elseif Player[playerid].leader == 5 then
	CMD_LEADER5(playerid,params);
	end
elseif cmd == "/уволить" then
	if Player[playerid].leader == 0 then
	SendPlayerMessage(playerid,255,0,0,"Вы не лидер!")
	elseif Player[playerid].leader >= 1 then
	CMD_DISMISSAL(playerid,params);
	end
elseif cmd == "/крестьянин" then
	if Player[playerid].leader == 0 then
	SendPlayerMessage(playerid,255,0,0,"Вы не лидер!")
	elseif Player[playerid].leader >= 1 then
	CMD_WORKER(playerid,params);
	end
	elseif cmd == "/вещи" then
	if Player[playerid].leader == 0 then
	SendPlayerMessage(playerid,255,0,0,"Вы не лидер!")
	elseif Player[playerid].leader >= 1 then
	CMD_INV(playerid,params);
	end
	elseif cmd == "/лсблок" then
        CMD_PM_Block(playerid, params);
	elseif cmd == "/крафтлвл" then
	    CMD_Craft_change(playerid, params);
	elseif cmd == "/ид" then
	    CMD_ID_search(playerid, params);
	elseif cmd == "/id" then
	    CMD_ID_search(playerid, params);
	elseif cmdtext == "/время" then
            local hour,minute = GetTime();
            GameTextForPlayer(playerid,2500,4000,string.format("%s %02d:%02d","Игровое время:",hour,minute),"Font_Old_20_White_Hi.TGA",255,255,0,10000);
	elseif cmd == "/выход" or cmd == "/quit" then
	         if Player[playerid].loggedIn == 1 and Player[playerid].logout==0 then
			    --[[if(Player[playerid].skintype[2])then
				SetPlayerFatness(playerid, Player[playerid].skintype[1])
				SetPlayerWalk(playerid,playerid,Player[playerid].skintype[4]);
				end]]
				ExitOut(playerid);
				Player[playerid].loggedIn = 0;
				Player[playerid].logout=1;
			else
			    ExitGame(playerid);
            end
    elseif cmd == "/ролл" then
	    CMD_Roll(playerid, params)
	elseif cmd == "/монетка" then
	    CMD_Monetka(playerid, params)
	elseif cmd == "/удача" then
	    CMD_uda4a(playerid, params)
	elseif cmd == "/мут" then
	    CMD_Mute(playerid, params)
		
	elseif cmd == "/инвиз" then
		CMD_AdminInviz(playerid, params)
		
	elseif cmd == "/вес" then
        CMD_FatSet(playerid, params)
		
	elseif cmd == "/коорд" then
	    local p_x, p_y, p_z = GetPlayerPos(playerid);
        SendPlayerMessage(playerid,255,250,200,"Текущие координаты: "..p_x.."  "..p_y.."  "..p_z);
		CMD_SavePosition(playerid,params);
		
	elseif cmd == "/коордм" then
		local result,id = sscanf(params,"d");
	    local p_x, p_y, p_z = GetPlayerPos(id);
        SendPlayerMessage(playerid,255,250,200,"Текущие координаты: "..p_x.."  "..p_y.."  "..p_z);
		CMD_SavePosition2(id,params);
				
	elseif cmd == "/профиль" then	
        ADM_CreateProfile(playerid, params);
	
	elseif cmd == "/ад" then
	    CMD_Amd_Answ(playerid, params);
	elseif cmd == "/инструменты" then
	    CMD_INV2(playerid);
		elseif cmd == "/рыба" then
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, -41506, 612, 9224) <= 1200 or GetDistance3D(p_x, p_y, p_z, -37563, 36, -3508) <= 1200 or GetDistance3D(p_x, p_y, p_z, -10997, -900, 8978) <= 1200 and Player[playerid].timer == true then
		Player[playerid].timer = false
		Player[playerid].eda = SetTimerEx("AKCJA_RYBY",15000,0,playerid);
		else
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано!"),"Font_Old_20_White_Hi.TGA",255,0,0,2100);
		end
	elseif cmd == "/скилл" then	
	if Player[playerid].leader == 0 then
	SendPlayerMessage(playerid,255,0,0,"Вы не лидер!")
	elseif Player[playerid].leader >= 1 then
	CMD_skill(playerid, params);
	end
	elseif cmd == "/собака" then
if GetPlayerName(playerid) == "Собака" then
SetPlayerInstance(playerid,"WOLF");
SetPlayerHealth(playerid,700);
SetPlayerMaxHealth(playerid,700);
SetPlayerStrength(playerid,80);
else
SendPlayerMessage(playerid,0,255,128,"Вы не собака!");
end
elseif cmd == "/орк" then
if GetPlayerName(playerid) == "Кар-Гор" then
SetPlayerInstance(playerid,"UndeadOrcWarrior");
SetPlayerMana(playerid,0);
SetPlayerMaxMana(playerid,0);
SetPlayerHealth(playerid,400);
SetPlayerMaxHealth(playerid,400);
SetPlayerStrength(playerid,50);
EquipMeleeWeapon(playerid,"ItMw_2h_orcaxe_03");
else
SendPlayerMessage(playerid,0,255,128,"Вы не орк!");
end
elseif cmd == "/кротокрыс" then
if GetPlayerName(playerid) == "Крoтокрыс" then
SetPlayerInstance(playerid,"Molerat");
SetPlayerHealth(playerid,600);
SetPlayerMaxHealth(playerid,600);
SetPlayerStrength(playerid,70);
else
SendPlayerMessage(playerid,0,255,128,"Вы не кротокрыс!");
end
elseif cmd == "/торгаш" then
if GetPlayerName(playerid) == "Алхимик" or GetPlayerName(playerid) == "Охотник" or GetPlayerName(playerid) == "Торговец" then
SetPlayerInstance(playerid,"PC_ROCKFELLER");
SetPlayerHealth(playerid,600);
SetPlayerMaxHealth(playerid,600);
SetPlayerStrength(playerid,70);
EquipArmor(playerid,"ItAr_Tra_02");
EquipMeleeWeapon(playerid,"ItMw_1H_Common_01");
SetPlayerFatness(playerid,0)
else
SendPlayerMessage(playerid,0,255,128,"Вы не торгаш, епта!");
end
elseif cmdtext == "/превращения" then
        SendPlayerMessage(playerid,255,255,255,"Превращения: спящий, призрак(2), дракон(нежить/лед/камень)"); 
        SendPlayerMessage(playerid,255,255,255,"варан, варг, волк, падальщик, кровомуха, овца, жук, (ч/с)гоблин");
		SendPlayerMessage(playerid,255,255,255,"тролль, снеппер(д), гарпия, зомби, демон(лорд), мракорис, огонек");
		SendPlayerMessage(playerid,255,255,255,"орк-(воин/элитник/шаман/нежить), скелет, безголовый, (в)краулер");
		SendPlayerMessage(playerid,255,255,255,"(о/л)голем, ящер");
elseif cmd == "/спящий" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"SLEEPER");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end

elseif cmd == "/дата" then
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 then
		if rsd~=0 then
			if dm>0 and dm<=12 then
				if dd<=days[dm] then
					day=dd;
					month=dm;
					year=dy;
				else
				SendPlayerMessage(playerid,255,0,0,"Некорректный формат даты");
				end	
			else 
			SendPlayerMessage(playerid,255,0,0,"Некорректный формат даты");
			end
		else
			SendPlayerMessage(playerid,255,0,0,"Некорректный формат даты");
		end
	end
elseif cmd == "/голод" then
	local rsl,pid,toggle=sscanf(params,"dd");
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
		if rsl==1 then
			if toggle==1 and Player[pid].ht_able==0 then
				--htt[pid]=SetTimerEx("HT_Counter",1000*4,1,pid);
				Player[pid].ht_able=1;
				HT_Check(pid);
			elseif toggle==0 and Player[pid].ht_able==1 then
				--KillTimer(htt[pid]);
				Player[pid].hunger=0;
				Player[pid].thirst=0;
				Player[pid].ht_able=0;
				HT_Check(pid);
				CompleteHeal(pid);
			end
		end
	end
elseif cmd == "/тпв" then
	local rsl,pid,dest=sscanf(params,"ds");
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222  then
		if rsl~=-1 then
			if dest=="Порт" then
				SetPlayerPos(pid,1526.4566650391,-87.560203552246,-825.57061767578);
			elseif dest=="ВКвартал" then
				SetPlayerPos(pid,11812.045898438,998.21307373047,-3367.8146972656);
			
			elseif dest=="Губерния" then
				SetPlayerPos(pid,15626.447265625,1143.7993164063,8.5215873718262);
			
			elseif dest=="Торг" then
				SetPlayerPos(pid,9689.3125,368.26553344727,4917.6083984375);
			
			elseif dest=="Казармы" then
				SetPlayerPos(pid,4690.625,848.20104980469,7019.3540039063);
			
			elseif dest=="Маяк" then
				SetPlayerPos(pid,-1275.9581298828,2507.7998046875,16396.302734375);
			
			elseif dest=="Пик" then
				SetPlayerPos(pid,16374.737304688,5199.5908203125,8389.017578125);
			
			elseif dest=="Акил" then
				SetPlayerPos(pid,31516.033203125,3590.1645507813,7598.1879882813);
			
			elseif dest=="Гарпия" then
				SetPlayerPos(pid,38039.94140625,3921.3889160156,-2313.0053710938);
			
			elseif dest=="Монастырь" then
				SetPlayerPos(pid,48203.25390625,4990.9384765625,19391.31640625);
			
			elseif dest=="Онар" then
				SetPlayerPos(pid,72003.4609375,3306.7836914063,-11318.81640625);
			
			elseif dest=="Гора" then
				SetPlayerPos(pid,64824.84765625,3967.716796875,-23547.509765625);
			
			elseif dest=="Колония" then
				SetPlayerPos(pid,39693.53125,2983.1467285156,-23316.373046875);
				
			elseif dest=="Пещера" then
				SetPlayerPos(pid,-9147.55078125, -483.73828125, 17957.353515625);
			
			elseif dest=="Пещера2" then
				SetPlayerPos(pid,-8422.8359375, -482.40310668945, 18245.947265625);
			
			elseif dest=="Ферма" then
				SetPlayerPos(pid,14102.770507813,1768.1547851563,-15058.65234375);
				
			elseif dest=="Корабль1" then
				SetPlayerPos(pid,14102.770507813,1768.1547851563,-15058.65234375);
				
			elseif dest=="Корабль2" then
				SetPlayerPos(pid,14102.770507813,1768.1547851563,-15058.65234375);
			end
		end
	end
elseif cmd == "/призрак" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"None_Addon_111_Quarhodron");
SetPlayerFatness(playerid,0)
SetPlayerHealth(playerid,900);
SetPlayerMaxHealth(playerid,900);
SetPlayerStrength(playerid,90);
SetPlayerWalk(playerid,"Humans_Mage.mds");
EquipArmor(playerid,"ItAr_Raven_Addon");
GiveItem(playerid,"ItAr_Pal_Skel",1);
GiveItem(playerid,"ItAr_Pal_h",1);
GiveItem(playerid,"ItAr_MayaZombie_Addon",1);
GiveItem(playerid,"ItAr_Dementor",1);
GiveItem(playerid,"ItAr_Xardas",1);
GiveItem(playerid,"ItMw_BeliarWeapon_1H_20",1);
GiveItem(playerid,"ItMw_FrancisDagger_mis",1);
GiveItem(playerid,"ItRu_WindFist",99);
GiveItem(playerid,"ItRu_ThunderBall",99);
GiveItem(playerid,"ItRu_PalHolyBolt",99);
GiveItem(playerid,"ItPo_Mana_03",99);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/призрак2" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"None_Addon_111_Quarhodron");
SetPlayerFatness(playerid,0)
SetPlayerHealth(playerid,900);
SetPlayerMaxHealth(playerid,900);
SetPlayerStrength(playerid,90);
SetPlayerWalk(playerid,"humans_skeleton_fly.mds");
EquipArmor(playerid,"ItAr_Raven_Addon");
GiveItem(playerid,"ItAr_Pal_Skel",1);
GiveItem(playerid,"ItAr_Pal_h",1);
GiveItem(playerid,"ItAr_MayaZombie_Addon",1);
GiveItem(playerid,"ItAr_Dementor",1);
GiveItem(playerid,"ItAr_Xardas",1);
GiveItem(playerid,"ItMw_BeliarWeapon_1H_20",1);
GiveItem(playerid,"ItMw_FrancisDagger_mis",1);
GiveItem(playerid,"ItRu_FireBolt",99);
GiveItem(playerid,"ItRu_IceBolt",99);
GiveItem(playerid,"ItRu_PalHolyBolt",99);
GiveItem(playerid,"ItPo_Mana_03",99);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/драконнежить" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DRAGON_UNDEAD");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/драконлед" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DRAGON_ICE");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/драконкамень" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DRAGON_ROCK");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/кровомуха" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Bloodfly");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/варг" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Warg");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end	
elseif cmd == "/волк" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Wolf");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/варан" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Waran");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/тролль" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"TROLL");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/овца" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"SHEEP");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/снепперд" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DRAGONSNAPPER");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/снеппер" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"SNAPPER");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/падальщик" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"SCAVENGER");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/гарпия" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"HARPIE");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/зомби" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
local zombak = random(3)
if zombak == 0 then
SetPlayerInstance(playerid,"Zombie01");
elseif zombak == 1 then
SetPlayerInstance(playerid,"Zombie02");
elseif zombak == 2 then
SetPlayerInstance(playerid,"Zombie03");
elseif zombak == 3 then
SetPlayerInstance(playerid,"Zombie04");
end
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/демон" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DEMON");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/демонлорд" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DEMONLORD");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/мракорис" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"SHADOWBEAST");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/голем" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"STONEGOLEM");
SetPlayerHealth(playerid,1000);
SetPlayerMaxHealth(playerid,1000);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/лголем" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"ICEGOLEM");
SetPlayerHealth(playerid,1000);
SetPlayerMaxHealth(playerid,1000);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/оголем" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"FIREGOLEM");
SetPlayerHealth(playerid,1000);
SetPlayerMaxHealth(playerid,1000);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/жук" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Meatbug");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/гоблин" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Gobbo_Green");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/чгоблин" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Gobbo_Black");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/сгоблин" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Gobbo_Skeleton");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/огонек" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Wisp");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/краулер" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Minecrawler");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/вкраулер" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"MinecrawlerWarrior");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/орк-воин" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"OrcWarrior_Roam");
GiveItem(playerid,"ItMw_2h_orcaxe_04",1);
EquipMeleeWeapon(playerid,"ItMw_2h_orcaxe_04");
GiveItem(playerid,"ItPo_health_03",15);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/орк-элитник" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"OrcElite_Roam");
GiveItem(playerid,"ItMw_2h_orcsword_02",1);
EquipMeleeWeapon(playerid,"ItMw_2h_orcsword_02");
GiveItem(playerid,"ItPo_health_03",15);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/орк-шаман" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"OrcShaman_Sit");
SetPlayerMana(playerid,600);
SetPlayerMaxMana(playerid,600);
GiveItem(playerid,"ItRu_chargefireball",99);
GiveItem(playerid,"ItMw_2h_orcaxe_03",1);
EquipItem(playerid,"ItRu_chargefireball");
EquipMeleeWeapon(playerid,"ItMw_2h_orcaxe_03");
GiveItem(playerid,"ItPo_mana_03",15);
GiveItem(playerid,"ItPo_health_03",15);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/ящер" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"DRACONIAN");
SetPlayerMana(playerid,600);
SetPlayerMaxMana(playerid,600);
GiveItem(playerid,"ItRu_chargefireball",99);
GiveItem(playerid,"ItMw_2H_OrcSword_01",1);
EquipItem(playerid,"ItRu_chargefireball");
EquipMeleeWeapon(playerid,"ItMw_2H_OrcSword_01");
GiveItem(playerid,"ItPo_mana_03",15);
GiveItem(playerid,"ItPo_health_03",15);
SetPlayerMagicLevel(playerid,6);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/орк-нежить" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"UndeadOrcWarrior");
GiveItem(playerid,"ItMw_2H_Orcaxe_02",1);
EquipMeleeWeapon(playerid,"ItMw_2H_Orcaxe_02");
GiveItem(playerid,"ItPo_health_03",15);
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/скелет" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Skeleton");
EquipMeleeWeapon(playerid,"ItMw_2h_Sword_M_01");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/безголовый" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerInstance(playerid,"Skeleton");
EquipMeleeWeapon(playerid,"ItMw_2H_Special_01");
EquipArmor(playerid,"Itar_MayaZombie_addon");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/походкаскелет" then
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
SetPlayerWalk(playerid,"humans_skeleton_fly.mds");
else
SendPlayerMessage(playerid,255,0,0,"Вы не имеете доступа к этой команде!")
end
elseif cmd == "/человек" then
SetPlayerInstance(playerid,"PC_HERO");
elseif cmd == "/стойка"
	then
--[[local h1h = GetPlayerSkillWeapon(playerid,SKILL_1H)
local h2h = GetPlayerSkillWeapon(playerid,SKILL_2H)
local h3h = GetPlayerSkillWeapon(playerid,SKILL_BOW)
local h4h = GetPlayerSkillWeapon(playerid,SKILL_CBOW)]]
local huy = Player[playerid].class
local hahs = GetPlayerHealth(playerid)
local hahm = GetPlayerMana(playerid)
	SetPlayerSkillWeapon(playerid,SKILL_1H,1);
	SetPlayerSkillWeapon(playerid,SKILL_2H,1);
	SetPlayerSkillWeapon(playerid,SKILL_BOW,1);
	SetPlayerSkillWeapon(playerid,SKILL_CBOW,1);

	Player[playerid].class = huy;
	JAKAKLASA(playerid);
	SetPlayerHealth(playerid,hahs);
	SetPlayerMana(playerid,hahm);
	--SetTimer("Stoyka",1300,1);
	SendPlayerMessage(playerid,255,255,0,"Стойка исправлена!(если не вышло, то повторите с оружием в ножнах)")
	elseif cmd == "/походка1"
	then
	SetPlayerWalk(playerid,"Humans_Mage.mds");
	SendPlayerMessage(playerid,255,255,0,"Походка мага - пропишите /стойка, если испортился навык оружия!")
	elseif cmd == "/походка2"
	then
		SetPlayerWalk(playerid,"HumanS_Militia.mds");
		SendPlayerMessage(playerid,255,255,0,"Походка стража - пропишите /стойка, если испортился навык оружия!")
	elseif cmd == "/походка3"
	then
		SetPlayerWalk(playerid,"Humans_Tired.mds");
		SendPlayerMessage(playerid,255,255,0,"Походка уставшего - пропишите /стойка, если испортился навык оружия!")
	elseif cmd == "/походка4"
	then
		SetPlayerWalk(playerid,"HumanS_Relaxed.mds");
		SendPlayerMessage(playerid,255,255,0,"Походка расслабленного - пропишите /стойка, если испортился навык оружия!")
	elseif cmd == "/походка5"
	then
		SetPlayerWalk(playerid,"Humans_Arrogance.mds");
		SendPlayerMessage(playerid,255,255,0,"Походка важного(изменена анимация /сесть) - пропишите /стойка, если испортился навык оружия!")
	elseif cmd == "/походка6"
	then
		SetPlayerWalk(playerid,"Humans_Walk_b.mds");
		SendPlayerMessage(playerid,255,255,0,"Походка разбойника - пропишите /стойка, если испортился навык оружия!")
	elseif cmd == "/походка7"
	then
		SetPlayerWalk(playerid,"Humans_Babe.mds");
		SendPlayerMessage(playerid,255,255,0,"Походка женщины2 - пропишите /стойка, если испортился навык оружия!")


	elseif cmdtext == "/анимации" then
        SendPlayerMessage(playerid,255,255,255,"Анимации: /сесть /спать /ссать /танец1-9 /разглядывать"); 
        SendPlayerMessage(playerid,255,255,255,"/страж(2) /смерть(2) /молиться /обыскать");
		SendPlayerMessage(playerid,255,255,255,"/молоток /отогнать /да /нет /тренировка");
		SendPlayerMessage(playerid,255,255,255,"/походка1-6(1-мага,2-стража,3-уставшая,4-расслабленная,5-важная,6-разбойника,7-женская)");
		SendPlayerMessage(playerid,255,255,255,"/ранен /добить /долбить /осмотреть ");
		--[[SendPlayerMessage(playerid,255,255,255,"Анимации лица: /злой1-2 /спокойный /испуганный1-2");
		SendPlayerMessage(playerid,255,255,255,"/смотреть1-2 /жует /закрытыеглаза");]]
 elseif cmdtext == "/молиться" then
    PlayAnimation(playerid,"T_STAND_2_PRAY");
	
 elseif cmdtext == "/ранен" then
    PlayAnimation(playerid,"T_STAND_2_WOUNDED");
	
 elseif cmdtext == "/добить" then
    PlayAnimation(playerid,"T_1HSFINISH");
	
 elseif cmdtext == "/долбить" then
    PlayAnimation(playerid,"S_TREASURE_S2");
	
 elseif cmdtext == "/осмотреть" then
    PlayAnimation(playerid,"T_STAND_2_CHESTBIG_S1");
    
 elseif cmdtext == "/оглядеться" then
    PlayAnimation(playerid,"T_SEARCH");
    
 elseif cmdtext == "/обыскать" then
    PlayAnimation(playerid,"T_PLUNDER");
    
 elseif cmdtext == "/страж1" then
    PlayAnimation(playerid,"S_LGUARD");
    
 elseif cmdtext == "/страж2" then
    PlayAnimation(playerid,"S_HGUARD");
    
 elseif cmdtext == "/смерть" then
    PlayAnimation(playerid,"T_DEAD");
	
 elseif cmdtext == "/смерть2" then
    PlayAnimation(playerid,"T_DEADB");  
 
 elseif cmdtext == "/магия1" then
    PlayAnimation(playerid,"T_PRACTICEMAGIC");    
  
 elseif cmdtext == "/магия2" then
    PlayAnimation(playerid,"T_PRACTICEMAGIC2");    

 elseif cmdtext == "/магия3" then
    PlayAnimation(playerid,"T_PRACTICEMAGIC3");    

 elseif cmdtext == "/магия4" then
    PlayAnimation(playerid,"T_PRACTICEMAGIC4");  
    
 elseif cmdtext == "/сесть" then
    PlayAnimation(playerid,"T_STAND_2_SIT");	

 elseif cmdtext == "/спать" then
    PlayAnimation(playerid,"T_STAND_2_SLEEPGROUND");
  
 elseif cmdtext == "/ссать" then
    PlayAnimation(playerid,"T_STAND_2_PEE");
  
 elseif cmdtext == "/тренировка" then
    PlayAnimation(playerid,"T_1HSFREE");
  
 elseif cmdtext == "/разглядывать" then
    PlayAnimation(playerid,"T_1HSINSPECT");

 elseif cmdtext == "/файршоу" then
	PlayAnimation(playerid,"T_FIRESPIT_S0_2_S1");
	SetTimerEx("FIRE2",2*1000,0,playerid);
	
 elseif cmdtext == "/файршоу1" then
	PlayAnimation(playerid,"T_FIRESPIT_S0_2_S1");
	
 elseif cmdtext == "/файршоу2" then
	PlayAnimation(playerid,"T_FIRESPIT_S1_2_S2");
	
 elseif cmdtext == "/файршоу3" then
	PlayAnimation(playerid,"T_FIRESPIT_S2_2_S3");
	
 elseif cmdtext == "/файршоу4" then
	PlayAnimation(playerid,"T_FIRESPIT_S3_2_S4");
	
 elseif cmdtext == "/файршоу5" then
	PlayAnimation(playerid,"T_FIRESPIT_S0_2_STAND");
    
 elseif cmdtext == "/танец" then
    PlayAnimation(playerid,"T_DANCE_01");
	SetTimerEx("DANCE2",15*1000,0,playerid);

 elseif cmdtext == "/танец1" then
    PlayAnimation(playerid,"T_DANCE_01");
    
 elseif cmdtext == "/танец2" then
    PlayAnimation(playerid,"T_DANCE_02");
    
 elseif cmdtext == "/танец3" then
    PlayAnimation(playerid,"T_DANCE_03");
    
    elseif cmdtext == "/танец4" then
    PlayAnimation(playerid,"T_DANCE_04");
    
 elseif cmdtext == "/танец5" then
    PlayAnimation(playerid,"T_DANCE_05");
    
 elseif cmdtext == "/танец6" then
    PlayAnimation(playerid,"T_DANCE_06");
    
 elseif cmdtext == "/танец7" then
    PlayAnimation(playerid,"T_DANCE_07");
    
    elseif cmdtext == "/танец8" then
    PlayAnimation(playerid,"T_DANCE_08");
    
 elseif cmdtext == "/танец9" then
    PlayAnimation(playerid,"T_DANCE_09");
    
 elseif cmdtext == "/молоток" then
    PlayAnimation(playerid,"S_REPAIR_S1");
    
 elseif cmdtext == "/отогнать" then
    PlayAnimation(playerid,"T_GETLOST2");
    
    elseif cmdtext == "/нет" then
    PlayAnimation(playerid,"T_WATCHFIGHT_OHNO");
    
 elseif cmdtext == "/да" then
    PlayAnimation(playerid,"T_WATCHFIGHT_YEAH");
    
 elseif cmdtext == "/кивок" then
    PlayAnimation(playerid,"T_YES");
    
 elseif cmdtext == "/ненене" then
    PlayAnimation(playerid,"T_NO");
    
 elseif cmdtext == "/злой1" then
    PlayAnimation(playerid,"S_ANGRY");
    
    elseif cmdtext == "/злой2" then
    PlayAnimation(playerid,"S_HOSTILE");
    
 elseif cmdtext == "/спокойный" then
    PlayAnimation(playerid,"S_FRIENDLY");
    
 elseif cmdtext == "/испуганный1" then
    PlayAnimation(playerid,"S_FRIGHTENED");
    
 elseif cmdtext == "/испуганный2" then
    PlayAnimation(playerid,"T_HURT");
    
    elseif cmdtext == "/жует" then
    PlayAnimation(playerid,"T_EAT");
    
 elseif cmdtext == "/закрытыеглаза" then
    PlayAnimation(playerid,"S_EYECLOSED");
end
end

function FIRE2(playerid)
PlayAnimation(playerid,"T_FIRESPIT_S1_2_S2");
SetTimerEx("FIRE3",1*1500,0,playerid);
end

function FIRE3(playerid)
PlayAnimation(playerid,"T_FIRESPIT_S2_2_S3");
SetTimerEx("FIRE4",1*1000,0,playerid);
end

function FIRE4(playerid)
PlayAnimation(playerid,"T_FIRESPIT_S3_2_S4");
SetTimerEx("FIRE5",1*1000,0,playerid);
end

function FIRE5(playerid)
PlayAnimation(playerid,"T_FIRESPIT_S0_2_STAND");
end

function DANCE2(playerid)
PlayAnimation(playerid,"T_DANCE_02");
SetTimerEx("DANCE3",25*1000,0,playerid);
end

function DANCE3(playerid)
PlayAnimation(playerid,"T_DANCE_03");
SetTimerEx("DANCE4",20*1000,0,playerid);
end

function DANCE4(playerid)
PlayAnimation(playerid,"T_DANCE_04");
SetTimerEx("DANCE5",15*1000,0,playerid);
end

function DANCE5(playerid)
PlayAnimation(playerid,"T_DANCE_02");
SetTimerEx("DANCE6",15*1000,0,playerid);
end

function DANCE6(playerid)
PlayAnimation(playerid,"T_DANCE_02");
SetTimerEx("DANCE7",20*1000,0,playerid);
end

function DANCE7(playerid)
PlayAnimation(playerid,"T_DANCE_02");
SetTimerEx("DANCE8",10*1000,0,playerid);
end

function DANCE8(playerid)
PlayAnimation(playerid,"T_DANCE_02");
SetTimerEx("DANCE9",20*1000,0,playerid);
end

function DANCE9(playerid)
PlayAnimation(playerid,"T_DANCE_02");
end

function Stoyka()
	SetPlayerSkillWeapon(playerid,SKILL_1H,h1h+1);
	SetPlayerSkillWeapon(playerid,SKILL_2H,h2h+1);
	SetPlayerSkillWeapon(playerid,SKILL_BOW,h3h+1);
	SetPlayerSkillWeapon(playerid,SKILL_CBOW,h4h+1);
	SendPlayerMessage(playerid,255,0,0,"Боевая стойка исправлена!")
end

function SkillInfo(playerid)
if result == 1 and Player[playerid].admin == 444 then
local result, pid = sscanf(params,"d")
SendPlayerMessage(playerid,0,239,255,"Подкрадывание:"..GetPlayerScience(pid, SCIENCE_SNEAKING)..".");
SendPlayerMessage(playerid,0,239,255,"Работа на верстаке:"..GetPlayerScience(pid, 2)..".");
SendPlayerMessage(playerid,0,239,255,"Карманник:"..GetPlayerScience(pid, 1)..".");
SendPlayerMessage(playerid,0,239,255,"Создание рун:"..GetPlayerScience(pid, 4)..".");
SendPlayerMessage(playerid,0,239,255,"Алхимия:"..GetPlayerScience(pid, 5)..".");
SendPlayerMessage(playerid,0,239,255,"Ковка:"..GetPlayerScience(pid, 3)..".");
SendPlayerMessage(playerid,0,239,255,"Сбор трофеев:"..GetPlayerScience(pid, 6)..".");
end
end

function CMD_ALARM(playerid)
local x, y, z = GetPlayerPos(playerid)
local alarmsound = CreateSound( "SVM_8_ALARM.WAV" ) -- тревога
for i = 0, MAX_PLAYERS - 1 do
if GetDistancePlayers( playerid, i ) <= 3500 then
PlayPlayerSound3D( i, alarmsound, x, y, z, 3500)
SendPlayerMessage( i, 0, 220, 0, "#" .. GetPlayerName(playerid) .. " объявляет тревогу#" )
DestroySound(alarmsound);
end
end
end

function CMD_skill(playerid, params)
local result, pid = sscanf(params,"d")
local collecting = GetPlayerScience(pid,SCIENCE_COLLECTING_TROPHIES);
local alchemy = GetPlayerScience(pid, SCIENCE_ALCHEMY);
local runes = GetPlayerScience(pid, SCIENCE_CREATING_RUNES);
local kovka =  GetPlayerScience(pid, SCIENCE_SLOSH_BLADES);
local verstak = GetPlayerScience(pid, SCIENCE_OPENING_LOCKS);
local vorovstvo = GetPlayerScience(pid, SCIENCE_THIEF);
local podkradivanie = GetPlayerScience(pid, SCIENCE_SNEAKING);
if podkradivanie == 0 then
SendPlayerMessage(playerid,0,239,255,"Подкрадывание: Не обучен");
elseif podkradivanie == 1 then
SendPlayerMessage(playerid,0,239,255,"Подкрадывание: Обучен");
end
if verstak == 0 then
SendPlayerMessage(playerid,0,239,255,"Работа на верстаке: Не обучен");
elseif verstak == 1 then
SendPlayerMessage(playerid,0,239,255,"Работа на верстаке: Обучен");
end
if vorovstvo == 0 then
SendPlayerMessage(playerid,0,239,255,"Карманник: Не обучен");
elseif vorovstvo == 1 then
SendPlayerMessage(playerid,0,239,255,"Карманник: Обучен");
end
if runes == 0 then
SendPlayerMessage(playerid,0,239,255,"Создание рун: Не обучен");
elseif runes == 1 then
SendPlayerMessage(playerid,0,239,255,"Создание рун: Обучен");
end
if alchemy == 0 then
SendPlayerMessage(playerid,0,239,255,"Навык алхимии: Не обучен");
elseif alchemy == 1 then
SendPlayerMessage(playerid,0,239,255,"Навык алхимии: Обучен");
end
if kovka == 0 then
SendPlayerMessage(playerid,0,239,255,"Кузнечное дело: Не обучен");
elseif kovka == 1 then
SendPlayerMessage(playerid,0,239,255,"Кузнечное дело: Обучен");
end
if collecting == 0 then
SendPlayerMessage(playerid,0,239,255,"Сбор трофеев: Не обучен");
elseif collecting == 1 then
SendPlayerMessage(playerid,0,239,255,"Сбор трофеев: Обучен");
end
end

function CMD_GUARDS(playerid)
local x, y, z = GetPlayerPos(playerid)
local guardssound = CreateSound( "SVM_8_GUARDS.WAV" ) -- стража
for i = 0, MAX_PLAYERS - 1 do
if GetDistancePlayers( playerid, i ) <= 3500 then
PlayPlayerSound3D( i, guardssound, x, y, z, 3500)
SendPlayerMessage( i, 0, 220, 0, "#" .. GetPlayerName(playerid) .. " зовет стражу#" )
DestroySound(guardssound);
end
end
end

function CMD_ALARMHELP(playerid)
local x, y, z = GetPlayerPos(playerid)
local helpsound = CreateSound( "SVM_8_HELP.WAV" ) --на помощь
for i = 0, MAX_PLAYERS - 1 do
if GetDistancePlayers( playerid, i ) <= 3500 then
PlayPlayerSound3D( i, helpsound, x, y, z, 3500)
SendPlayerMessage( i, 0, 220, 0, "#" .. GetPlayerName(playerid) .. " зовет на помощь#" )
DestroySound(helpsound);
end
end
end

function CMD_OBMEN(playerid, params)
local result , ob = sscanf(params, "s");
if result == 1 then
if ob == "сталь" then
HasItem(playerid, "ITMI_WHEAT", 51);
print("11")
elseif ob == "древесина" then
HasItem(playerid, "ITMI_WOOD", 52);
elseif ob == "рыба" then
HasItem(playerid, "ITFO_FISH", 53);
elseif ob == "самородок" then
HasItem(playerid, "ITMI_GOLDNUGGET_ADDON", 54);
end
else
		SendPlayerMessage(playerid, 230, 230, 230, "/обмен <сталь/самородок/древесина/рыба>")
	end
end

function CMD_GETSKLAD(playerid, params)
local result , sklad = sscanf(params, "s");
if sklad == "основной" then
local a = GetINI("sklad.cfg", "STAL")
local b = GetINI("sklad.cfg", "FISH")
local c = GetINI("sklad.cfg", "HLEB")
local d = GetINI("sklad.cfg", "PSEN")
local e = GetINI("sklad.cfg", "BEER")
local k = GetINI("sklad.cfg", "WINE")
local l = GetINI("sklad.cfg", "MOTIGA")
SendPlayerMessage(playerid,0,255,255,string.format("%s","== СКЛАД =="));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Сталь:",a,"|","Рыба:",b));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Хлеб:",c,"|","Пшеница:",d));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Пиво:",e,"|","Вино:",k));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Мотыга:",l));
elseif sklad == "Каррон" then --перекупщик
elseif sklad == "Иллион" then --алхимик
elseif sklad == "Оливер" then -- доспехи
elseif sklad == "Хавьер" then -- еда
elseif sklad == "Айрон" then -- кузнец
SendPlayerMessage(playerid,0,255,255,string.format("%s","== Айрон | Кузнец =="));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Сталь:",a,"|","Рыба:",b));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Хлеб:",c,"|","Пшеница:",d));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Пиво:",e,"|","Вино:",k));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Мотыга:",l));
end
end

function CMD_SavePosition( playerid, params )
	local x, y, z = GetPlayerPos( playerid )
	local angle = GetPlayerAngle( playerid )
	local result, name = sscanf( params, "s" )
	if result == 1 then
		local message = string.format( "%s, %s, %s, %s", x, y, z, "ANGLE: " .. angle )
		plik = io.open( name .. ".txt", "w+" )
		plik:write( message )
		plik:close( )
		SendPlayerMessage( playerid, 0, 255, 0, "Сохранено в файл " .. name .. ".txt" )
	else
		SendPlayerMessage( playerid, 230, 230, 230, "/коорд <название>" )
	end
end

function CMD_SavePosition2( playerid, params )
	local x, y, z = GetPlayerPos( id )
	local angle = GetPlayerAngle( id )
	local result, name = sscanf( params, "s" )
	if result == 1 then
		local message = string.format( "%s, %s, %s, %s", x, y, z, "ANGLE: " .. angle )
		plik = io.open( name .. ".txt", "w+" )
		plik:write( message )
		plik:close( )
		SendPlayerMessage( playerid, 0, 255, 0, "Сохранено в файл " .. name .. ".txt" )
	else
		SendPlayerMessage( playerid, 230, 230, 230, "/коорд <название>" )
	end
end

function CMD_Sell(playerid, params)
	local result, slot, cost, amount, id = sscanf(params, "dddd")
	if result == 1 then
		if GetPlayerName(id) then
			if playerid ~= id then
				if Player[id].propozycja ~= true then
					local distance = GetDistancePlayers(playerid, id)
					if distance <= 1200 then
						Player[playerid].gClient = id
						Player[playerid].gSlot = slot
						Player[playerid].gCost = cost
						Player[playerid].gAmount = amount
						Player[id].propozycja = true
						GetPlayerItem(playerid, slot)
					else
						SendPlayerMessage(playerid, 255, 0, 0, "Слишком далеко от " .. GetPlayerName(id) .. "!")
					end
				else
					SendPlayerMessage(playerid, 255, 0, 0, "Попробуйте позже...")
				end
			else
				SendPlayerMessage(playerid, 255, 0, 0, "Нельзя продавать самому себе!")
			end
		else
			SendPlayerMessage(playerid, 230, 230, 230, "Нет такого игрока!")
		end
	else
		SendPlayerMessage(playerid, 230, 230, 230, "/продать <слот> <стоимость> <количество> <id игрока>")
	end
end

function CMD_Accept(playerid)
	if Player[playerid].propozycja == true then
		local vendor = Player[playerid].gVendor
		local cost = Player[vendor].gCost
		local enteredAmount = Player[vendor].gAmount
		local distance = GetDistancePlayers(playerid, vendor)
		local money = Player[playerid].bank
		if distance <= 1200 then
			if money >= cost then
				Player[playerid].propozycja = false
				GiveItem(playerid, Player[vendor].item, enteredAmount)
				RemoveItemBySlot(vendor, Player[vendor].gSlot, enteredAmount)
				if Player[playerid].ReplyTimer ~= -1 then
					KillTimer(Player[playerid].ReplyTimer)
				end
				if cost > 0 then
					Player[vendor].bank = Player[vendor].bank + cost 
					Player[playerid].bank = Player[playerid].bank - cost 
				end
				SendPlayerMessage(vendor, 0, 255, 0, "Вы продали " .. Player[vendor].item ..  " игроку " .. GetPlayerName(playerid) .. " за " .. cost .. " медных монет")
				SendPlayerMessage(playerid, 0, 255, 0, "Вы купили " .. Player[vendor].item ..  " у игрока " .. GetPlayerName(vendor) .. " за " .. cost .. " медных монет")
				local name = GetPlayerName(playerid)
				--====
			else
				Player[playerid].propozycja = false
				SendPlayerMessage(vendor, 255, 0, 0, "Игроку " .. GetPlayerName(playerid) .. " не хватает медных монет для покупки.")
				SendPlayerMessage(playerid, 255, 0, 0, "Не хватает медных монет для покупки " .. Player[vendor].item .. ".")
			end
		else
			SendPlayerMessage(playerid, 230, 230, 230, "Слишком далеко от " .. GetPlayerName(vendor) .. "!")
		end
	else
		SendPlayerMessage(playerid, 230, 230, 230, "Никто ничего не предлагал!")
	end
end

function CMD_Refuse(playerid)
	if Player[playerid].propozycja == true then
		Player[playerid].propozycja = false
		local vendor = Player[playerid].gVendor
		local distance = GetDistancePlayers(playerid, vendor)
		if distance <= 1200 then
			if GetPlayerName(playerid) then
				if Player[playerid].ReplyTimer ~= -1 then
					KillTimer(Player[playerid].ReplyTimer)
				end
				SendPlayerMessage(vendor, 255, 0, 0, GetPlayerName(playerid) .. " отказался от покупки " .. Player[vendor].item .. ".")
				SendPlayerMessage(playerid, 255, 0, 0, "Отказ от покупки " .. Player[vendor].item .. " от игрока " .. GetPlayerName(vendor) .. ".")
			end
		else
			SendPlayerMessage(playerid, 230, 230, 230, "Слишком далеко от " .. GetPlayerName(vendor) .. "!")
		end
	else
		SendPlayerMessage(playerid, 230, 230, 230, "Никто ничего не предлагал!")
	end
end

function RefuseTimed(playerid)
	if Player[playerid].propozycja == true then
		Player[playerid].propozycja = false
		local vendor = Player[playerid].gVendor
		if GetPlayerName(playerid) then
			SendPlayerMessage(vendor, 255, 0, 0, GetPlayerName(playerid) .. " не ответил на предложение.")
			SendPlayerMessage(playerid, 255, 0, 0, "У вас есть минута чтобы ответить.")
		end
	end
end

CZAS_ODPOWIEDZI = 30000

function OnPlayerResponseItem(playerid, slot, item_instance, amount, equipped )
	
	if Player[playerid].Drop==1 then
		if item_instance~="NULL" then
			if Player[playerid].amount_drop<=amount then
				Player[playerid].Drop=0;
				local x,y,z=GetPlayerPos(playerid);
				RemoveItemBySlot(playerid,slot,Player[playerid].amount_drop);
				CreateItem(item_instance, Player[playerid].amount_drop, x, y, z, GetPlayerWorld(playerid));
			else 
				Player[playerid].Drop=0;
				SendPlayerMessage(playerid,255,0,0,"Неверное кол-во предметов для дропа");
			end
		else
			Player[playerid].Drop=0;
			SendPlayerMessage(playerid,255,0,0,"Предмет по заданому слоту отсутствует");
		end
	end
	
if item_instance == "NULL" then
else
local nick = GetPlayerName(playerid);
            local file = io.open(string.format("%s%s%s",PATH_FILE,nick,".txt"), "a+");          
             file:write(item_instance.." "..amount.."".."\n");             
            file:close();
			
local id = Player[playerid].gClient
		if id then
			if Player[id].propozycja == true then
				Player[playerid].item = item_instance
				local item = Player[playerid].item
				if item then
						local cost = Player[playerid].gCost
						local enteredAmount = Player[playerid].gAmount
						if enteredAmount <= amount then
							Player[id].propozycja = true
							Player[id].gVendor = playerid
							Player[id].rAmount = amount
							Player[id].ReplyTimer = SetTimerEx("RefuseTimed", CZAS_ODPOWIEDZI, 0, id)
							SendPlayerMessage(playerid, 255, 255, 0, "Вы предложили игроку " .. GetPlayerName(id) .. " купить " .. item .. " за " .. cost .. " медных монет.")
							SendPlayerMessage(id, 255, 255, 0, "Игрок " .. GetPlayerName(playerid) .. " предлагает " .. item .. " за " .. cost .. " медных монет.")
						else
							SendPlayerMessage(playerid, 255, 255, 0, "У вас нет столько!")
						end
				end
			end
		end
end
end

function CMD_INV2(playerid)
local p_x, p_y, p_z = GetPlayerPos(playerid);
if GetDistance3D(p_x, p_y, p_z, 6077, -570, 786) <= 1000 or GetDistance3D(p_x, p_y, p_z, 56392, -3882, -9528) <= 1000 or GetDistance3D(p_x, p_y, p_z, -46963, 2022, 11666) <= 1000 then
if Player[playerid].class == 1 or Player[playerid].class == 12 or Player[playerid].class == 21 then
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITMI_STOMPER",1);
GiveItem(playerid,"ITMI_PLIERS",1);
GiveItem(playerid,"ITMI_HAMMER",1);
GiveItem(playerid,"ITMI_SCOOP",1);
GiveItem(playerid,"ITMI_PAN",1);
GiveItem(playerid,"ITMI_SAW",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BRUSH",1);
GiveItem(playerid,"ITMI_LUTE",1);
SendPlayerMessage(playerid,0,213,255,"Инструменты получены");
else
SendPlayerMessage(playerid,0,213,255,"Вы не можете получить инструменты");
end
else
SendPlayerMessage(playerid,0,213,255,"Вы не можете получить инструменты тут.");
SendPlayerMessage(playerid,0,213,255,"(только на складе)");
end
end

function CZAT_KOMENDY(playerid, params)
local result , strona = sscanf(params, "d");
if result == 1 then
if strona == 1 then
	SendPlayerMessage(playerid,0,213,255,"======== Команды - страница 1 из 4 ========");
	SendPlayerMessage(playerid,0,213,255,"/медяки (ID) (количество)");
	SendPlayerMessage(playerid,0,213,255,"Передача денег игроку");
	SendPlayerMessage(playerid,0,213,255,"/репорт (текст) - сообщение для администрации");
	SendPlayerMessage(playerid,0,213,255,"Использовать только в крайнем случае.");
	SendPlayerMessage(playerid,0,213,255,"/снаряжение");
	SendPlayerMessage(playerid,0,213,255,"Получить свое снаряжение, если его вам выдали");
	elseif strona == 2 then
	SendPlayerMessage(playerid,0,213,255,"======== Команды - страница 2 из 4 ========");
	SendPlayerMessage(playerid,0,213,255,"/п");
	SendPlayerMessage(playerid,0,213,255,"Получить информацию о вашем классе. гильдии и прочее.");
	SendPlayerMessage(playerid,0,213,255,"/лс (выкл/вкл)");
	SendPlayerMessage(playerid,0,213,255,"Выключение и включение получения личных сообщений");
	SendPlayerMessage(playerid,0,213,255,"/выход");
	SendPlayerMessage(playerid,0,213,255,"Выход из игры.");
	elseif strona == 3 then
	SendPlayerMessage(playerid,0,213,255,"======== Команды - страница 3 из 4 ========");
	SendPlayerMessage(playerid,0,213,255,"/ролл");
	SendPlayerMessage(playerid,0,213,255,"Выброс случайного числа на костях");
	SendPlayerMessage(playerid,0,213,255,"/вес (-1-5.5)");
	SendPlayerMessage(playerid,0,213,255,"Регулировка полноты вашего персонажа");
	SendPlayerMessage(playerid,0,213,255,"/вн %текст%");
	SendPlayerMessage(playerid,0,213,255,"Сохранение информации, описывающей Вашего персонажа. Просматривается клавишей V");
	elseif strona == 4 then
	SendPlayerMessage(playerid,0,213,255,"======== Команды - страница 3 из 4 ========");
	SendPlayerMessage(playerid,0,213,255,"/анимации - для вызова списка анимаций");
	SendPlayerMessage(playerid, 255, 255, 0, "$ - Префикс для #ooc#")
	SendPlayerMessage(playerid, 255, 255, 0, ". - Префикс для #do#")
	SendPlayerMessage(playerid, 255, 255, 0, "! - Префикс для #крик#")
	SendPlayerMessage(playerid, 255, 255, 0, "# - Префикс для #я#")
end
else
			SendPlayerMessage(playerid,255,250,200,"Используй: /команды (номер страницы)");
end
end

protected_items = {"ITPL_DEX_HERB_01","ITPL_STRENGTH_HERB_01","ITPO_PERM_DEX","ITPO_PERM_HEALTH","ITPO_PERM_MANA","ITPO_PERM_STR","ITPO_PERM_LITTLEMANA","ITAM_PROT_FIRE_01","ITAM_PROT_EDGE_01","ITAM_PROT_POINT_01","ITAM_PROT_MAGE_01","ITAM_PROT_TOTAL_01","ITAM_DEX_01","ITAM_STRG_01","ITAM_HP_01","ITAM_MANA_01","ITAM_DEX_STRG_01","ITAM_HP_MANA_01","ITRI_PROT_FIRE_01","ITRI_PROT_FIRE_02","ITRI_PROT_POINT_01","ITRI_PROT_POINT_02","ITRI_PROT_EDGE_01","ITRI_PROT_EDGE_02","ITRI_PROT_MAGE_01","ITRI_PROT_MAGE_02","ITRI_PROT_TOTAL_01","ITRI_PROT_TOTAL_02", "ITRI_DEX_01", "ITRI_DEX_02","ITRI_HP_01", "ITRI_HP_02", "ITRI_STR_01", "ITRI_STR_02", "ITRI_MANA_01", "ITRI_MANA_02", "ITRI_HP_MANA_01", "ITRI_DEX_STRG_01", "ITRW_ADDON_FIREBOW", "HOLY_HAMMER_MIS"};                                  

function CMD_FatSet(playerid, params)
        local result,fat = sscanf(params,"f");
		if result == 1 and fat <= 5.5 and fat >= -1 then
		    SendPlayerMessage(playerid,0,255,0,"Вес вашего персонажа изменен.");
			SetPlayerFatness(playerid, fat);
		else
		    SendPlayerMessage(playerid,0,255,0,"Используйте /вес <-1-5.5>");
		end
end

function Item_takeaway_report(params)
    local result,playerid,rid = sscanf(params,"dd");
	if result == 1 then
	    if Player[rid].takeaway ~= " " and Player[rid].takeaway ~= nil then
            SendPlayerMessage(playerid,255,250,200,"У "..GetPlayerName(rid).." отнято: "..Player[rid].takeaway);
		end
		Player[rid].takeaway = " ";
		Player[rid].takeawaynum = 0;
	end
end

function CMD_GiveItem(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or GetPlayerName(playerid) == "Алхимик" or GetPlayerName(playerid) == "Охотник" or GetPlayerName(playerid) == "Торговец"
	then
		local result,id,item,amount = sscanf(params,"dsd");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SendPlayerMessage(id,255,250,200,string.format("%s %d %s %s %s","Вы получили",amount,item,"от",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s %s %s","Вы выдали",amount,item,"для",GetPlayerName(id)));
				GiveItem(id,item,amount);
				LogString("AdminLog",string.format("%s %s %s %s %s",GetPlayerName(playerid),"give",GetPlayerName(id),item,amount));
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Server): Игрок ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /give (ID игрока) (код предмета) (количество)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"Ты не админ!");
	end
end

function CMD_GiveIt(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111
	then
		local result,id,item,amount = sscanf(params,"dsd");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				if item == "кинжал" then
				GiveItem(id,"ItMw_FrancisDagger_Mis",amount);
				elseif item == "болотник" then
				GiveItem(id,"ItMi_Joint",amount);
				elseif item == "метла" then
				GiveItem(id,"ITMI_BROOM",amount);
				elseif item == "лютня" then
				GiveItem(id,"ITMI_LUTE",amount);
				elseif item == "сковорода" then
				GiveItem(id,"ITMI_PAN",amount);
				elseif item == "мензурка" then
				GiveItem(id,"ITMI_FLASK",amount);
				elseif item == "давилка" then
				GiveItem(id,"ITMI_STOMPER",amount);
				elseif item == "болт" then
				GiveItem(id,"ITRW_BOLT_BOLT",amount);
				elseif item == "стрела" then
				GiveItem(id,"ITRW_ARROW",amount);
				elseif item == "сталь" then
				GiveItem(id,"ITMISWORDRAW",amount);
				elseif item == "мотыга" then
				GiveItem(id,"ITMI_RAKE",amount);
				elseif item == "щетка" then
				GiveItem(id,"ITMI_BRUSH",amount);
				elseif item == "болотник" then
				GiveItem(id,"ItMi_Joint",amount);
				elseif item == "пила" then
				GiveItem(id,"ITMI_SAW",amount);
				elseif item == "щипцы" then
				GiveItem(id,"ITMI_PLIERS",amount);
				elseif item == "молот" then
				GiveItem(id,"ITMI_HAMMER",amount);
				elseif item == "ключ" then
				GiveItem(id,"ItKe_Key_01",amount);
				elseif item == "ложка" then
				GiveItem(id,"ITMI_SCOOP",amount);
				elseif item == "пропуск" then
				GiveItem(id,"ITWR_PASSIERSCHEIN",amount);
				end
				SendPlayerMessage(id,255,250,200,string.format("%s %s %s %d","Вы получили предмет: ",item, " Количество: ",amount));
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Server): Игрок ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /выдать (ID игрока) (имя предмета) (количество)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"Ты не админ!");
	end
end

function CMD_DISMISSAL(playerid, params) --увольнение
local result, pid = sscanf(params,"d")
	class1(pid);
	Player[pid].class = 1;
	SendPlayerMessage(pid,255 , 0 ,94,"Вас уволили из гильдии");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы уволили",GetPlayerName(pid)));
	SaveAccount(pid);
end

function CMD_WORKER(playerid, params) --Крестьянин
local result, pid = sscanf(params,"d")
	class23(pid);
	Player[pid].class = 23;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали крестьянином");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили крестьянином",GetPlayerName(pid)));
	SaveAccount(pid);
end

function CMD_LEADER1(playerid, params) --Воевода
local result, pid, rank = sscanf(params,"dd")
local class = Player[pid].class
if rank == 1 then
	class2(pid);
	Player[pid].class = 2;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Бойцом-новичкем");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Бойцом-новичкем",GetPlayerName(pid)));
elseif rank == 2 then
	class3(pid);
	Player[pid].class = 3;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Бойцом");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Бойцом",GetPlayerName(pid)));
elseif rank == 3 then
	class4(pid);
	Player[pid].class = 4;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Опытным бойцом");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Опытным бойцом",GetPlayerName(pid)));
else
	SendPlayerMessage(playerid,255 ,0 ,0,"Неправильный номер ранга! (1-3)");
end
SaveAccount(pid);
end


function CMD_LEADER2(playerid, params) --Магистр
local result, pid, rank = sscanf(params,"dd")
local class = Player[pid].class
if rank == 1 then
	class6(pid);
	Player[pid].class = 6;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Послушником");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Послушником",GetPlayerName(pid)));
elseif rank == 2 then
	class7(pid);
	Player[pid].class = 7;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Старшим послушником");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Старшим послушником",GetPlayerName(pid)));
elseif rank == 3 then
	class8(pid);
	Player[pid].class = 8;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Магом-учеником");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Магом-учеником",GetPlayerName(pid)));
elseif rank == 4 then
	class9(pid);
	Player[pid].class = 9;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Магом");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Магом",GetPlayerName(pid)));
else
	SendPlayerMessage(playerid,255 ,0 ,0,"Неправильный номер ранга! (1-4)");
end
SaveAccount(pid);
end

function CMD_LEADER3(playerid, params) --Лорд-паладин
local result, pid, rank = sscanf(params,"dd")
local class = Player[pid].class
if rank == 1 then
	class11(pid);
	Player[pid].class = 11;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Оруженосцем");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Оруженосцем",GetPlayerName(pid)));
elseif rank == 2 then
	class12(pid);
	Player[pid].class = 12;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Рыцарем");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Рыцарем",GetPlayerName(pid)));
elseif rank == 3 then
	class13(pid);
	Player[pid].class = 13;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Паладином");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Паладином",GetPlayerName(pid)));
else
	SendPlayerMessage(playerid,255 ,0 ,0,"Неправильный номер ранга! (1-3)");
end
SaveAccount(pid);
end

function CMD_LEADER4(playerid, params) --Губернатор
local result, pid, rank = sscanf(params,"dd")
local class = Player[pid].class
if rank == 1 then
	class18(pid);
	Player[pid].class = 18;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Горожанином");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Горожанином",GetPlayerName(pid)));
elseif rank == 2 then
	class19(pid);
	Player[pid].class = 19;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Ремесленником");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Ремесленником",GetPlayerName(pid)));
elseif rank == 3 then
	class20(pid);
	Player[pid].class = 20;
	SendPlayerMessage(pid,255 , 0 ,94,"Вы стали Подмастерьем");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы назначили Подмастерьем",GetPlayerName(pid)));	
else
	SendPlayerMessage(playerid,255 ,0 ,0,"Неправильный номер ранга! (только 1-3)");
end
SaveAccount(pid);
end

function CMD_SCIENCE(playerid,params)
local result, pid, science = sscanf(params,"ds")
if result == 1 and Player[playerid].leader >= 1 or Player[playerid].admin == 444 or Player[playerid].admin == 333 then
if science == "1" then
SetPlayerScience(pid,0,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили подкрадывание у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили подкрадываться игрока",GetPlayerName(pid)));
elseif science == "2" then
SetPlayerScience(pid,2,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили работу на верстаке у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили работать на верстаке игрока",GetPlayerName(pid)));
elseif science == "3" then
SetPlayerScience(pid,1,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили карманную кражу у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили карманной краже игрока",GetPlayerName(pid)));
elseif science == "4" then
SetPlayerScience(pid,4,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили создание рун у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили созданию рун игрока",GetPlayerName(pid)));
elseif science == "5" then
SetPlayerScience(pid,5,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили алхимию у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили алхимии игрока",GetPlayerName(pid)));
elseif science == "6" then
SetPlayerScience(pid,3,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили ковку у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили ковать игрока",GetPlayerName(pid)));
elseif science == "7" then
SetPlayerScience(pid,6,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили добычу трофеев у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили добыче трофеев игрока",GetPlayerName(pid)));
elseif science == "8" then
SetPlayerAcrobatic(pid,1);
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы изучили акробатику у",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы научили акробатике игрока",GetPlayerName(pid)));
elseif science == "-1" then
SetPlayerScience(pid,0,0);
elseif science == "-2" then
SetPlayerScience(pid,2,0);
elseif science == "-3" then
SetPlayerScience(pid,1,0);
elseif science == "-4" then
SetPlayerScience(pid,4,0);
elseif science == "-5" then
SetPlayerScience(pid,5,0);
elseif science == "-6" then
SetPlayerScience(pid,3,0);
elseif science == "-7" then
SetPlayerScience(pid,6,0);
elseif science == "-8" then
SetPlayerAcrobatic(pid,0);
end
end
end

function CMD_WEAPONARY(playerid,params)
local result, pid, science, skill = sscanf(params,"dsd")
if result == 1 and Player[playerid].leader >= 1 or Player[playerid].admin == 444 then
if science == "одноручное" then
SetPlayerSkillWeapon(pid,SKILL_1H,skill);
elseif science == "двуручное" then
SetPlayerSkillWeapon(pid,SKILL_2H,skill);
elseif science == "лук" then
SetPlayerSkillWeapon(pid,SKILL_BOW,skill);
elseif science == "арбалет" then
SetPlayerSkillWeapon(pid,SKILL_CBOW,skill);
end
end
end


function CMD_SETPLAYERLEADER(playerid,params)
local result, pid, leader = sscanf(params,"dd")
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444
then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s","Вы назначили",GetPlayerName(pid),"лидером гильдии с номером",leader));
Player[pid].leader = leader;
else
		SendPlayerMessage(playerid,230,230,230,"Вы не админ!");
		end
end

function CMD_PBANK(playerid, params)
local result, pid, money = sscanf(params,"dd")
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333
then
Player[pid].bank = Player[pid].bank + money 
SendPlayerMessage(pid,0,255,255,string.format("%s %s %s %s","Вы получили",money,"медных монет от",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s","Вы выдали",money,"медных монет, игроку",GetPlayerName(pid)));
LogString("money",string.format("%s %s %s",GetPlayerName(playerid),money,GetPlayerName(pid)));
else
		SendPlayerMessage(playerid,230,230,230,"Вы не админ!");
		end
end

function CMD_HLEB(playerid)
HasItem(playerid,"ITMI_WHEAT",322);
end

function CMD_ID_search(playerid, params)
local result, nick_cur = sscanf(params,"s")
if result == 1 then
for i = 0,GetMaxSlots() - 1 do
    if Player[i].nick == nick_cur then
	    SendPlayerMessage(playerid,230,230,230,i.." - ID игрока "..nick_cur);
	end  
end
else
		SendPlayerMessage(playerid,230,230,230,"Используйте команду /ид <Никнейм игрока>");
		end
end

function CMD_VOR(playerid, params)
local result, pid = sscanf(params,"d")
local money = random(7);
local alert = random(2);
local vorovstvo = GetPlayerScience(playerid,SCIENCE_THIEF)
if vorovstvo == 1 then
if IsPlayerConnected(pid) == 1 then
if GetDistancePlayers(playerid,pid) <= 200 and money > -1 then
if Player[pid].bank >= 1 and money <= Player[pid].bank then
if alert == 0 then
SendPlayerMessage(pid,0,255,255,string.format("%s %s %s %s","У вас украл",money,"медных монет, игрок",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s","Вы украли",money,"медных монет, у игрока",GetPlayerName(pid)));
SendPlayerMessage(playerid,230,230,230,"(Но вас заметили!)");
Player[pid].bank = Player[pid].bank - money
Player[playerid].bank = Player[playerid].bank + money
elseif alert == 1 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s","Вы украли",money,"медных монет, у игрока",GetPlayerName(pid)));
SendPlayerMessage(playerid,230,230,230,"(Вас не заметили!)");
Player[pid].bank = Player[pid].bank - money
Player[playerid].bank = Player[playerid].bank + money
		end
		else
                        SendPlayerMessage(playerid,0,255,0,"У игрока нет медных монет" );
                end
                else   
                        SendPlayerMessage(playerid,0,255,0,"Слишком далеко!" );
                        end
						 else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","Игрок ID",id,"не на сервере."));
				end
                        else
               SendPlayerMessage(playerid,0,255,0,"Вы не обучены краже!");
end
end

function CMD_GIVEMONEY(playerid, params)
local money = Player[playerid].bank
local result, pid, money = sscanf(params,"dd")
if GetDistancePlayers(playerid,pid) <= 200 then
if money > -1 then
if Player[playerid].bank >= 1 and money <= Player[playerid].bank then
Player[pid].bank = Player[pid].bank + money 
Player[playerid].bank = Player[playerid].bank - money 
SendPlayerMessage(pid,0,255,255,string.format("%s %s %s %s","Вы получили",money,"медных монет от",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s","Вы отдали",money,"медных монет игроку",GetPlayerName(pid)));
SaveAccount(pid);
SaveAccount(playerid);
LogString("money",string.format("%s %s %s",GetPlayerName(playerid),money,GetPlayerName(pid)));
	else	
			SendPlayerMessage(playerid,0,255,0,"Недостаточно медных монет" );
			end
			else	
			SendPlayerMessage(playerid,255,0,0,"Недопустимое значение!" );
		end
		else	
			SendPlayerMessage(playerid,0,255,0,"Слишком далеко!" );
			end
end

function CMD_GIVEKEYS(playerid, params)
local keys = Player[playerid].homekey
local result, pid = sscanf(params,"d")
if keys > -1 then
if GetDistancePlayers(playerid,pid) <= 200 then
if Player[playerid].homekey >= 1 and keys <= Player[playerid].homekey then
Player[pid].homekeys = Player[pid].homekey + 1 
Player[playerid].homekey = Player[playerid].homekey - 1 
SendPlayerMessage(pid,0,255,255,string.format("%s %s","Вы получили ключи от склада | от игрока",GetPlayerName(playerid)));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы отдали ключи от склада, игроку",GetPlayerName(pid)));
SaveAccount(pid);
SaveAccount(playerid);
	else	
			SendPlayerMessage(playerid,0,255,0,"У вас нет ключей" );
			end
		else	
			SendPlayerMessage(playerid,0,255,0,"Слишком далеко!" );
			end
		else	
			SendPlayerMessage(playerid,0,255,0,"Недопустимое значение" );
			end
end

function FileExist(filename)
   local file=io.open(filename,"r")
   if file ~= nil then file:close() return true else return false end
end

function SetINI(filename, key, value)
	
	if IsSetINI(filename, key) == true then
		DeleteKeyINI(filename, key)
	end
	local file = io.open(filename, "a+");
	file:write(key.."="..value.."\n"); 
	file:close();
end

function DeleteKeyINI(filename, key)
	if FileExist(filename) == 0 then return true end
	
    local file = io.open(filename,"r+");
    local value;
	local ftemp = io.open("ini.temp", "w+");
	
    if file then
        while true do
            local temp = file:read("*l")
            if temp == nil then
                break
            elseif string.find(temp, "=") ~= nil then
                local k = split(temp, "=")
                if k[1] ~= key then
					ftemp:write(temp.."\n");
				end
            end
        end
		file:close();
		ftemp:close();
		os.remove(filename);
		os.rename("ini.temp", filename);
    end
end

function IsSetINI(filename, key)
	if FileExist(filename) == 0 then return false end
	
    local file = io.open(filename,"r+")
    local value;
	
    if file then
        while true do
            local temp = file:read("*l")
            if temp == nil then
                break
            elseif string.find(temp, "=") ~= nil then
                local k = split(temp, "=")
                if k[1] == key then
					file:close();
					return true
				end
            end
        end
		file:close();
        return false
    end
end

function GetINI(filename, key)
	if FileExist(filename) == 0 then return nil end
	
    local file = io.open(filename,"r+")
	
    if file then
        while true do
            local temp = file:read("*l")
            if temp == nil then
                break
            elseif string.find(temp, "=") ~= nil then
                local k = split(temp, "=")
                if k[1] == key then
					file:close();
					return k[2]
				end
            end
        end
		file:close();
        return nil
    end
end

function GetArrayINI(filename)
	if FileExist(filename) == 0 then return nil end

	local t = {};
	local file = io.open(filename,"r+");
	
    if file then
        while true do
            local temp = file:read("*l");
            if temp == nil then
                break
            elseif string.find(temp, "=") ~= nil then
				local k = split(temp, "=");
				t[k[1]] = k[2];
			end
        end
		file:close();
        return t
    end	
end

function split(str, pat)
   local t = {} 
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
	 table.insert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end

function CMD_Craft(playerid, params)
	local result, id = sscanf(params, "d")
	if result == 1 then
		if id == 1 then
			HasItem(playerid, "ITMISWORDRAW", 1)
		elseif id == 2 then
			HasItem(playerid, "ITMISWORDRAW", 2)
		elseif id == 3 then
			HasItem(playerid, "ITMISWORDRAW", 3)
		elseif id == 4 then
			HasItem(playerid, "ITMISWORDRAW", 4)
		elseif id == 5 then
			HasItem(playerid, "ITMISWORDRAW", 5)
		elseif id == 6 then
			HasItem(playerid, "ITMISWORDRAW", 6)
		elseif id == 7 then
			HasItem(playerid, "ITMISWORDRAW", 7)
		elseif id == 8 then
			HasItem(playerid, "ITMISWORDRAW", 8)
		elseif id == 9 then
			HasItem(playerid, "ITMISWORDRAW", 9)
		end
	else
		SendPlayerMessage(playerid,255,0,0,"/ковать <id> (от 1 до 9)")
	end
end

local Czas_Robienia_Broni = 10000
local sklad_stal = 100;
local sklad_fish = 101;
local sklad_hleb = 102;
local sklad_psen = 103;
local sklad_beer = 104;
local sklad_wine = 105;
local sklad_motiga = 106;

function OnPlayerHasItem(playerid, item_instance, amount, equipped, checkid)
	
	local check=string.format("%d",checkid);
	local check2=string.sub(check,3,3);
	local itm=tonumber(check2);
	check2=string.sub(check,5,5);
	local ingr=tonumber(check2);
	
	if checkid >=10000 then
		if item_instance ~= "NULL" then
		
		--print(item, " : ",ingr);
			if Craft[Player[playerid].SubMenu].item[itm].ingredient[ingr].count<=amount then
				Player[playerid].able_craft[itm]=Player[playerid].able_craft[itm]+1;
			else
				Player[playerid].able_craft[itm]=0;
			end
		else
			Player[playerid].able_craft[itm]=0;
		end
		Update_Craft_Draw(playerid);
	end
	
	local message = "Вы начали ковку"
	
    if checkid == 1 then -- dlugi miecz
	
         if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
         else
			Player[playerid].tWeap1 = SetTimerEx("StworzBron1", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
         end
    elseif checkid == 2 then -- dobry dlugi miecz
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap2 = SetTimerEx("StworzBron2", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 3 then -- miecz paladyna
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap3 = SetTimerEx("StworzBron3", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 4 then -- miecz dwureczny paladyna
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap4 = SetTimerEx("StworzBron4", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 5 then -- lekki miecz dwureczny
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap5 = SetTimerEx("StworzBron5", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 6 then -- ciezki miecz dwureczny
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap6 = SetTimerEx("StworzBron6", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 7 then -- ciezki miecz dwureczny
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap7 = SetTimerEx("StworzBron7", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 8 then -- ciezki miecz dwureczny
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap8 = SetTimerEx("StworzBron8", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	elseif checkid == 9 then -- ciezki miecz dwureczny
	
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
			Player[playerid].tWeap9 = SetTimerEx("StworzBron9", Czas_Robienia_Broni, 0, playerid)
			RemoveItem(playerid,"ITMISWORDRAW",1);
			FreezePlayer(playerid, 1)
			PlayAnimation(playerid,"S_BSANVIL_S1")
			SendPlayerMessage(playerid,255,255,0,message)
		end
	--[[elseif checkid == 227 then 
	
		if item_instance == "NULL" then
			if Player[playerid].warn < 3 then
			SendPlayerMessage(playerid,255,100,100,"Куда полез без пропуска?");
			Player[playerid].warn = Player[playerid].warn + 1
			SetPlayerPos(playerid,-13.171690940857, -630.19348144531, -3612.6264648438);
			SetPlayerAngle(playerid,0);
			else
			Player[playerid].warn = 0;
			SendPlayerMessage(playerid,255,100,100,"Допрыгался. Посиди тут. И не выходи из игры, это убьет таймер и ты останешься здесь надолго.");
			SetPlayerPos(playerid,10575.858398438, 368.29537963867, 4650.1318359375);
			Player[playerid].jail = SetTimerEx("UNJAI", 120*1000, 0, playerid)
			end
		else
			------------------------------------------------------ХУЙ
		end]]
		--==========================================================================================
		elseif checkid == 51 then
		print("22")
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет стали!");
		else
		if amount >= 10 then
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, -36203.1640625, -1874.5207519531, 16866.49609375) <= 250 then
		RemoveItem(playerid,"ITMISWORDRAW",10);
		--\\\\\\\\
		 
		local oldValue;
local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
if file then
for line in file:lines() do 
		local result, item, value = sscanf(line,"sd");
		if result == 1 then
			if string.upper(item) == item_instance then
				oldValue = value;
			end
		end
	end
	file:close();
end
	
	if oldValue == nil then
		oldValue = 0;
	end
	
	local newValue = oldValue - amount;
	if newValue < 0 then
		newValue = 0;
	end
	
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
	local tempString = file:read("*a");
	file:close();
	local tempString = string.gsub(tempString,string.upper(item_instance).." "..oldValue,string.upper(item_instance).." "..newValue);
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","w+");
	file:write(tempString);
	file:close();
		--\\\\\\\\
		Player[playerid].bank = Player[playerid].bank + 20
		SendPlayerMessage(playerid,255,255,0,"Вы обменяли 10 стали на 20 медных монет");
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком далеко от склада");
		end
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком мало стали (нужно не менее 10)");
		end
		end
		
		elseif checkid == 52 then
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет древесины!");
		else
		if amount >= 10 then
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, -36203.1640625, -1874.5207519531, 16866.49609375) <= 250 then
		RemoveItem(playerid,"ITMI_WOOD",10);
		--\\\\\\\\
		local oldValue;
local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
if file then
for line in file:lines() do 
		local result, item, value = sscanf(line,"sd");
		if result == 1 then
			if string.upper(item) == item_instance then
				oldValue = value;
			end
		end
	end
	file:close();
end
	
	if oldValue == nil then
		oldValue = 0;
	end
	
	local newValue = oldValue - amount;
	if newValue < 0 then
		newValue = 0;
	end
	
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
	local tempString = file:read("*a");
	file:close();
	local tempString = string.gsub(tempString,string.upper(item_instance).." "..oldValue,string.upper(item_instance).." "..newValue);
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","w+");
	file:write(tempString);
	file:close();
		--\\\\\\\\
		Player[playerid].bank = Player[playerid].bank + 7
		SendPlayerMessage(playerid,255,255,0,"Вы обменяли 10 древесины на 7 медных монет");
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком далеко от склада");
		end
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком мало древесины (нужно не менее 10)");
		end
		end
		
		elseif checkid == 53 then
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет рыбы!");
		else
		if amount >= 10 then
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, -36203.1640625, -1874.5207519531, 16866.49609375) <= 250 then
		RemoveItem(playerid,"ITFO_FISH",10);
		Player[playerid].bank = Player[playerid].bank + 7
		SendPlayerMessage(playerid,255,255,0,"Вы обменяли 10 рыб на 7 медных монет");
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком далеко от склада");
		end
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком мало рыбы (нужно не менее 10)");
		end
		end
		
		elseif checkid == 54 then
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет самородков!");
		else
		if amount >= 10 then
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, -18015.37890625, -2445.798828125, 17110.400390625) <= 100 or GetDistance3D(p_x, p_y, p_z, 29815.279296875, -3567.9748535156, 25125.923828125) <= 100 then
		RemoveItem(playerid,"ItMi_GoldNugget_Addon",10);
		--\\\\\\\\
		local oldValue;
local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
if file then
for line in file:lines() do 
		local result, item, value = sscanf(line,"sd");
		if result == 1 then
			if string.upper(item) == item_instance then
				oldValue = value;
			end
		end
	end
	file:close();
end
	
	if oldValue == nil then
		oldValue = 0;
	end
	
	local newValue = oldValue - amount;
	if newValue < 0 then
		newValue = 0;
	end
	
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
	local tempString = file:read("*a");
	file:close();
	local tempString = string.gsub(tempString,string.upper(item_instance).." "..oldValue,string.upper(item_instance).." "..newValue);
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","w+");
	file:write(tempString);
	file:close();
		--\\\\\\\\
		Player[playerid].bank = Player[playerid].bank + 30
		SendPlayerMessage(playerid,255,255,0,"Вы обменяли 10 самородков на 30 медных монет");
		else
		SendPlayerMessage(playerid,255,0,0,"Вы не у плавильни");
		end
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком мало самородков (нужно не менее 10)");
		end
		end
		
		--==========================================================================================
		elseif checkid == 322 then --ТУТ ХЛЕБ
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет пшеницы!");
		else
		if amount >= 10 then
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, 351.40350341797, 100.38871765137, 1342.9484863281) <= 120 then
		PlayAnimation(playerid,"S_STOVE_S1");
		RemoveItem(playerid,"ITMI_WHEAT",10);
		Player[playerid].hleb = SetTimerEx("HLEBGOTOV",15000,0,playerid);
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Подождите немного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком далеко от плиты");
		end
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком мало пшеницы (нужно не менее 10)");
		end
		end
		
		elseif checkid == 333 then
		if item_instance == "NULL" then
			SendPlayerMessage(playerid,255,0,0,"У вас нет топора!");
		else
		local p_x, p_y, p_z = GetPlayerPos(playerid);
		if GetDistance3D(p_x, p_y, p_z, 3700.7058105469, 2092.9663085938, 7267.5791015625) <= 300 then
		if Player[playerid].timer == true then
		Player[playerid].drevo = SetTimerEx("DREVO", 15000, 0, playerid)
		Player[playerid].timer = false
		else
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Подождите немного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		else
		SendPlayerMessage(playerid,255,0,0,"Слишком далеко от дерева");
		end
		end
		--=======================
		
	elseif checkid == sklad_stal then --сталь
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет стали");
         else
			local a = GetINI("sklad.cfg", "STAL")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Стали было:",a));
			SetINI("sklad.cfg", "STAL", a+1 );
			RemoveItem(playerid,"ITMISWORDRAW",1);
			for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил сталь на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "STAL")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Стали стало:",a));
         end
		 
	elseif checkid == sklad_fish then --рыба
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет рыбы");
         else
			local a = GetINI("sklad.cfg", "FISH")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы было:",a));
			SetINI("sklad.cfg", "FISH", a+1 );
			RemoveItem(playerid,"ItFo_Fish",1);
						for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил рыбу на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "FISH")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы стало:",a));
         end
	elseif checkid == sklad_hleb then --хлеб
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет хлеба");
         else
			local a = GetINI("sklad.cfg", "HLEB")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Хлеба было:",a));
			SetINI("sklad.cfg", "HLEB", a+1 );
			RemoveItem(playerid,"ItFo_Bread",1);
						for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил хлеб на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "HLEB")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Хлеба стало:",a));
         end
	elseif checkid == sklad_psen then --пшеница
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет пшеницы");
         else
			local a = GetINI("sklad.cfg", "PSEN")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пшеницы было:",a));
			SetINI("sklad.cfg", "PSEN", a+1 );
			RemoveItem(playerid,"ITMI_WHEAT",1);
						for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил пшеницу на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "PSEN")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пшеницы стало:",a));
         end
	elseif checkid == sklad_beer then --пиво
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет пива");
         else
			local a = GetINI("sklad.cfg", "BEER")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива было:",a));
			SetINI("sklad.cfg", "BEER", a+1 );
			RemoveItem(playerid,"ItFo_Beer",1);
						for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил пиво на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "BEER")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива стало:",a));
         end
	elseif checkid == sklad_wine then --вино
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет вина");
         else
			local a = GetINI("sklad.cfg", "WINE")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Вина было:",a));
			SetINI("sklad.cfg", "WINE", a+1 );
			RemoveItem(playerid,"ItFo_Wine",1);
						for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил вино на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "WINE")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Вина стало:",a));
         end		 
	elseif checkid == sklad_motiga then --мотыга
         if item_instance == "NULL" then
             SendPlayerMessage(playerid,255,255,0,"У тебя нет мотыги");
         else
			local a = GetINI("sklad.cfg", "MOTIGA")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Мотыг было:",a));
			SetINI("sklad.cfg", "MOTIGA", a+1 );
			RemoveItem(playerid,"ITMI_RAKE",1);
						for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"положил мотыгу на склад"));		
	end
end
			local a = GetINI("sklad.cfg", "MOTIGA")
			SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Мотыг стало:",a));
         end		 
	
    end
end

function UNJAI(playerid)
SetPlayerPos(playerid,4222.9711914063, 848.19738769531, 6904.71875);
GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы освобождены"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron1(playerid)
	GiveItem(playerid,"ItMw_NagelKnueppel",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Дубина с Шипами"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron2(playerid)
	GiveItem(playerid,"ItMw_1H_Misc_Sword",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Ржавый Меч"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron3(playerid)
	GiveItem(playerid,"ItMw_Hellebarde",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Короткий Меч Ополчения"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron4(playerid)
	GiveItem(playerid,"ItMw_1H_Mil_Sword",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Грубый Широкий Меч"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron5(playerid)
	GiveItem(playerid,"ItMw_ShortSword3",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Короткий Меч"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron6(playerid)
	GiveItem(playerid,"ItMw_ShortSword4",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Волчий Зуб"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron7(playerid)
	GiveItem(playerid,"ItMw_ShortSword5",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Благородный Короткий Меч"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron8(playerid)
	GiveItem(playerid,"ItMw_Schwert5",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Рунический Меч"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function StworzBron9(playerid)
	GiveItem(playerid,"ItMw_1H_Vlk_Sword",1);
	FreezePlayer(playerid, 0)
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Выковал: Шпага"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
end

function CMD_GET_SKLAD(playerid, params) --взять со склада
local p_x, p_y, p_z = GetPlayerPos(playerid);
local message = "Вы не на складе"
local result , item = sscanf(params, "s");
if Player[playerid].homekey == 0 then
SendPlayerMessage(playerid,0,255,255,string.format("%s","У тебя нет ключа"));
else
	if item == "сталь" then
	if GetDistance3D(p_x, p_y, p_z, 4502.5361328125, 447.65307617188, 308.11911010742) <= 130 then
GETSTAL(playerid,params);
	else
SendPlayerMessage(playerid,255,255,0,message);
end
	elseif item == "рыбу" then
	if GetDistance3D(p_x, p_y, p_z, 710.46624755859, 98.192100524902, 484.416015625) <= 130 then
GETFISH(playerid,params);
	else
SendPlayerMessage(playerid,255,255,0,message);
end
	elseif item == "хлеб" then
	if GetDistance3D(p_x, p_y, p_z, 778.75628662109, 498.20401000977, 338.10684204102) <= 130 then
GETHLEB(playerid,params);
else
SendPlayerMessage(playerid,255,255,0,message);
end
	elseif item == "пшеницу" then
	if GetDistance3D(p_x, p_y, p_z, -2095.6750488281, 1340.9587402344, -3532.5883789062) <= 130 then
GETPSEN(playerid,params);
else
SendPlayerMessage(playerid,255,255,0,message);
end
	elseif item == "пиво" then
	if GetDistance3D(p_x, p_y, p_z, 4552.8471679688, 462.07818603516, -4086.4958496094) <= 130 then
GETBEER(playerid,params);
else
SendPlayerMessage(playerid,255,255,0,message);
end
	elseif item == "вино" then
	if GetDistance3D(p_x, p_y, p_z, 4552.8471679688, 462.07818603516, -4086.4958496094) <= 130 then
GETWINE(playerid,params);
else
SendPlayerMessage(playerid,255,255,0,message);
end
	elseif item == "мотыгу" then
	if GetDistance3D(p_x, p_y, p_z, 2384.8913574219, 498.18997192383, 1372.3801269531) <= 130 then
GETMOTIGA(playerid,params);
else
SendPlayerMessage(playerid,255,255,0,message);
end
end
end
end

function CMD_GIVE_SKLAD(playerid, params) --вернуть на склад
local p_x, p_y, p_z = GetPlayerPos(playerid);
local message = "Вы не на складе"
local result , item = sscanf(params, "s");
if Player[playerid].homekey == 0 then
SendPlayerMessage(playerid,0,255,255,string.format("%s","У тебя нет ключа"));
else
	if item == "сталь" then
	if GetDistance3D(p_x, p_y, p_z, 4502.5361328125, 447.65307617188, 308.11911010742) <= 130 then
GIVESTAL(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end

	elseif item == "рыбу" then
	if GetDistance3D(p_x, p_y, p_z, 710.46624755859, 98.192100524902, 484.416015625) <= 130 then
GIVEFISH(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end

	elseif item == "хлеб" then
	if GetDistance3D(p_x, p_y, p_z, 778.75628662109, 498.20401000977, 338.10684204102) <= 130 then
GIVEHLEB(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end

	elseif item == "пшеницу" then
	if GetDistance3D(p_x, p_y, p_z, -2095.6750488281, 1340.9587402344, -3532.5883789062) <= 130 then
GIVEPSEN(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end

	elseif item == "пиво" then
	if GetDistance3D(p_x, p_y, p_z, 4552.8471679688, 462.07818603516, -4086.4958496094) <= 130 then
GIVEBEER(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end

	elseif item == "вино" then
	if GetDistance3D(p_x, p_y, p_z, 4552.8471679688, 462.07818603516, -4086.4958496094) <= 130 then
GIVEWINE(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end

	elseif item == "мотыгу" then
	if GetDistance3D(p_x, p_y, p_z, 2384.8913574219, 498.18997192383, 1372.3801269531) <= 130 then
GIVEMOTIGA(playerid);
else
SendPlayerMessage(playerid,255,255,0,message);
end
end
end
end

function DREVO(playerid)
GiveItem(playerid,"ITMI_WOOD",1);
GameTextForPlayer(playerid,3000,3000,string.format("%s","Древесина получена"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
Player[playerid].timer = true
end

function HLEBGOTOV(playeid)
GiveItem(playerid,"ItFo_Bread",1);
SendPlayerMessage(playerid,0,255,255,string.format("%s","Хлеб готов"));
end

function GETSTAL(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "STAL")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Стали было:",a));
SetINI("sklad.cfg", "STAL", a-1 );
local a = GetINI("sklad.cfg", "STAL")
GiveItem(playerid,"ITMISWORDRAW",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял сталь со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Стали осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет стали"));
end
end

function GIVESTAL(playerid)
local a = GetINI("sklad.cfg", "STAL")
HasItem(playerid,"ITMISWORDRAW",sklad_stal);
end

function GETFISH(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "FISH")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы было:",a));
SetINI("sklad.cfg", "FISH", a-1 );
local a = GetINI("sklad.cfg", "FISH")
GiveItem(playerid,"ItFo_Fish",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял рыбу со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет рыбы"));
end
end

function GIVEFISH(playerid)
local a = GetINI("sklad.cfg", "FISH")
HasItem(playerid,"ItFo_Fish",sklad_fish);
end

function GETHLEB(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "HLEB")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Хлеба было:",a));
SetINI("sklad.cfg", "HLEB", a-1 );
local a = GetINI("sklad.cfg", "HLEB")
GiveItem(playerid,"ItFo_Bread",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял хлеб со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Хлеба осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет хлеба"));
end
end
function GIVEHLEB(playerid)
local a = GetINI("sklad.cfg", "HLEB")
HasItem(playerid,"ItFo_Bread",sklad_hleb);
end

function GETPSEN(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "PSEN")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пшеницы было:",a));
SetINI("sklad.cfg", "PSEN", a-1 );
local a = GetINI("sklad.cfg", "PSEN")
GiveItem(playerid,"ITMI_WHEAT",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял пшеницу со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пшеницы осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет пшеницы"));
end
end
function GIVEPSEN(playerid)
local a = GetINI("sklad.cfg", "PSEN")
HasItem(playerid,"ITMI_WHEAT",sklad_psen);
end

function GETBEER(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "BEER")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива было:",a));
SetINI("sklad.cfg", "BEER", a-1 );
local a = GetINI("sklad.cfg", "BEER")
GiveItem(playerid,"ItFo_Beer",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял пиво со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет пива :("));
end
end
function GIVEBEER(playerid)
local a = GetINI("sklad.cfg", "BEER")
HasItem(playerid,"ItFo_Beer",sklad_beer);
end

function GETWINE(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "WINE")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Вина было:",a));
SetINI("sklad.cfg", "WINE", a-1 );
local a = GetINI("sklad.cfg", "WINE")
GiveItem(playerid,"ItFo_Wine",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял вино со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Вина осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет вина"));
end
end
function GIVEWINE(playerid)
local a = GetINI("sklad.cfg", "WINE")
HasItem(playerid,"ItFo_Wine",sklad_wine);
end

function GETMOTIGA(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "MOTIGA")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Мотыг было:",a));
SetINI("sklad.cfg", "MOTIGA", a-1 );
local a = GetINI("sklad.cfg", "MOTIGA")
GiveItem(playerid,"ITMI_RAKE",1);
SaveAccount(playerid);
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 800 then	
		SendPlayerMessage(i,0,213,255,string.format("%s %s",GetPlayerName(playerid),"взял мотыгу со склада"));		
	end
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Мотыг осталось:",a));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","На складе нет мотыг"));
end
end

function GIVEMOTIGA(playerid)
local a = GetINI("sklad.cfg", "MOTIGA")
HasItem(playerid,"ITMI_RAKE",sklad_motiga);
end

function GETKAZNA(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("kazna.cfg", "GOLD")
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Медных монет в казне:",a));
end

function SETKAZNA(playerid,params)
if Player[playerid].leader ~= 1 then
	SendPlayerMessage(playerid,255,0,0,"Вы не Комендант!")
else
	local result,b = sscanf(params,"d");
local a = GetINI("kazna.cfg", "GOLD")
local money = Player[playerid].bank
if money > -1 then
if a > "0" then
SendMessageToAll(0,255,255,string.format("%s %d","Медных монет было:",a));
SetINI("kazna.cfg", "GOLD", a+b );
local a = GetINI("kazna.cfg", "GOLD")
Player[playerid].bank = Player[playerid].bank - b 
SendMessageToAll(0,255,255,string.format("%s %d","Медных монет стало:",a));
else
SendMessageToAll(0,255,255,string.format("%s","В казне нет медных монет"));
end
else
SendMessageToAll(0,255,255,string.format("%s","У вас нет медных монет"));
end
end
end

local MIN_BANDIT_DISTANCE  = 400;
local MAX_BANDIT_DISTANCE = 1500;

---------------------------------
local bandit_timer;
local bandit;
--
local banditx_timer;
local banditx;
--
local banditx2_timer;
local banditx2;
--
local banditx3_timer;
local banditx3;
--
local banditx4_timer;
local banditx4;
--
local banditx5_timer;
local banditx5;
--
local bandit_tid = -1; --target
local bandit_stop = true;
local bandit_hittimer;
local bandit_instancehit = false;
--
local banditx_tid = -1; --target
local banditx_stop = true;
local banditx_hittimer;
local banditx_instancehit = false;
--
local banditx2_tid = -1; --target
local banditx2_stop = true;
local banditx2_hittimer;
local banditx2_instancehit = false;
--
local banditx3_tid = -1; --target
local banditx3_stop = true;
local banditx3_hittimer;
local banditx3_instancehit = false;
--
local banditx4_tid = -1; --target
local banditx4_stop = true;
local banditx4_hittimer;
local banditx4_instancehit = false;
--
local banditx5_tid = -1; --target
local banditx5_stop = true;
local banditx5_hittimer;
local banditx5_instancehit = false;

function NPC_Bandit()

	bandit = CreateNPC("Бандит");
	SpawnPlayer(bandit);
	SetPlayerAdditionalVisual(bandit,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	SetPlayerWalk(bandit, "HumanS_Relaxed.mds");
	SetPlayerInstance(bandit,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(bandit,500);
	SetPlayerHealth(bandit,500);
	SetPlayerStrength(bandit,100);
	SetPlayerPos(bandit,51335.53,8000.31,36147.78);
	SetPlayerAngle(bandit,160);
	SetPlayerFatness(bandit, -1);
	SetPlayerStrength(bandit, 50);
	SetPlayerSkillWeapon(bandit,SKILL_1H,30);
	PlayAnimation(bandit,"S_LGUARD");
	--Items:
	EquipArmor(bandit,"ITAR_DRU_L");
	EquipMeleeWeapon(bandit,"ItMw_Schwert1");
	
	bandit_timer = SetTimer("Bandit_AI",500,1);
end

function NPC_BanditXard()

	banditx = CreateNPC("Бандит");
	SpawnPlayer(banditx);
	SetPlayerAdditionalVisual(banditx,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	SetPlayerWalk(banditx, "HumanS_Relaxed.mds");
	SetPlayerInstance(banditx,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(banditx,500);
	SetPlayerHealth(banditx,500);
	SetPlayerStrength(banditx,100);
	SetPlayerPos(banditx,31417.64453125, 4674.8603515625, -13365.0078125);
	SetPlayerAngle(banditx,212);
	SetPlayerFatness(banditx, -1);
	SetPlayerStrength(banditx, 50);
	SetPlayerSkillWeapon(banditx,SKILL_1H,30);
	PlayAnimation(banditx,"S_LGUARD");
	--Items:
	EquipArmor(banditx,"ITAR_SLED_L");
	EquipMeleeWeapon(banditx,"ItMw_Kriegshammer1");
	
	banditx_timer = SetTimer("Banditx_AI",500,1);
end

function NPC_BanditXard2()

	banditx2 = CreateNPC("Бандит");
	SpawnPlayer(banditx2);
	SetPlayerAdditionalVisual(banditx2,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	SetPlayerWalk(banditx2, "HumanS_Relaxed.mds");
	SetPlayerInstance(banditx2,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(banditx2,500);
	SetPlayerHealth(banditx2,500);
	SetPlayerStrength(banditx2,100);
	SetPlayerPos(banditx2,31016.68359375, 4617.013671875, -13161.565429688);
	SetPlayerAngle(banditx2,193);
	SetPlayerFatness(banditx2, -1);
	SetPlayerStrength(banditx2, 50);
	SetPlayerSkillWeapon(banditx2,SKILL_1H,30);
	PlayAnimation(banditx2,"S_LGUARD");
	--Items:
	EquipArmor(banditx2,"ITAR_SLED_L");
	EquipMeleeWeapon(banditx2,"ItMw_Kriegshammer1");
	
	banditx2_timer = SetTimer("Banditx2_AI",500,1);
end

function NPC_BanditMost()

	banditx3 = CreateNPC("Бандит");
	SpawnPlayer(banditx3);
	SetPlayerAdditionalVisual(banditx3,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	SetPlayerWalk(banditx3, "HumanS_Relaxed.mds");
	SetPlayerInstance(banditx3,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(banditx3,500);
	SetPlayerHealth(banditx3,500);
	SetPlayerStrength(banditx3,100);
	SetPlayerPos(banditx3,30472.3125, 4296.2504882813, -961.53985595703);
	SetPlayerAngle(banditx3,196);
	SetPlayerFatness(banditx3, -1);
	SetPlayerStrength(banditx3, 50);
	SetPlayerSkillWeapon(banditx3,SKILL_1H,30);
	PlayAnimation(banditx3,"S_SIT");
	--Items:
	EquipArmor(banditx3,"ITAR_BDT_M");
	EquipMeleeWeapon(banditx3,"ItMw_NagelKnueppel");
	
	banditx3_timer = SetTimer("Banditx3_AI",500,1);
end

function NPC_BanditMost2()

	banditx4 = CreateNPC("Бандит");
	SpawnPlayer(banditx4);
	SetPlayerAdditionalVisual(banditx4,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	SetPlayerWalk(banditx4, "HumanS_Relaxed.mds");
	SetPlayerInstance(banditx4,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(banditx4,500);
	SetPlayerHealth(banditx4,500);
	SetPlayerStrength(banditx4,100);
	SetPlayerPos(banditx4,30293.732421875, 4298.4047851563, -1231.4588623047);
	SetPlayerAngle(banditx4,64);
	SetPlayerFatness(banditx4, -1);
	SetPlayerStrength(banditx4, 50);
	SetPlayerSkillWeapon(banditx4,SKILL_1H,30);
	PlayAnimation(banditx4,"S_SIT");
	--Items:
	EquipArmor(banditx4,"ITAR_BDT_M");
	EquipMeleeWeapon(banditx4,"ItMw_1H_Sld_Axe");
	
	banditx4_timer = SetTimer("Banditx4_AI",500,1);
end

function NPC_BanditMost3()

	banditx5 = CreateNPC("Бандит");
	SpawnPlayer(banditx5);
	SetPlayerAdditionalVisual(banditx5,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	SetPlayerWalk(banditx5, "HumanS_Relaxed.mds");
	SetPlayerInstance(banditx5,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(banditx5,500);
	SetPlayerHealth(banditx5,500);
	SetPlayerStrength(banditx5,100);
	SetPlayerPos(banditx5,30430.13671875, 4286.5727539063, -1353.9954833984);
	SetPlayerAngle(banditx5,6);
	SetPlayerFatness(banditx5, -1);
	SetPlayerStrength(banditx5, 50);
	SetPlayerSkillWeapon(banditx5,SKILL_1H,30);
	PlayAnimation(banditx5,"S_HGUARD");
	--Items:
	EquipArmor(banditx5,"ITAR_BDT_H");
	EquipMeleeWeapon(banditx5,"ItMw_NagelKeule");
	
	banditx5_timer = SetTimer("Banditx5_AI",500,1);
end

function Bandit_AI()
	
	if bandit_tid == -1 then
	
		for i = 0, GetMaxSlots() - 1 do
		
			if IsPlayerConnected(i) == 1 and IsNPC(i) == 0 and GetPlayerHealth(i) > 0 and GetPlayerHealth(bandit) > 0 then
			
				if GetDistancePlayers(bandit,i) <= MAX_BANDIT_DISTANCE then
				
					bandit_tid = i;
					bandit_stop = false;
					PlayPlayerSound(bandit_tid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
					SendPlayerMessage(bandit_tid,0,255,0,"Бандит крикнул: Эй, я думал ты мертв!#атакует#(моб)");
					SetPlayerWeaponMode(bandit,3);
					PlayAnimation(bandit,"S_FISTRUNL");
					break;
				end
			end
		end
	else
		
		if IsPlayerConnected(bandit_tid) == 1 then
		
			local angle = GetAngleToPlayer(bandit,bandit_tid);
			
			if angle ~= GetPlayerAngle(bandit) then
				SetPlayerAngle(bandit,angle);
			end
			
			local distance = GetDistancePlayers(bandit,bandit_tid);
			
			if distance <= MAX_BANDIT_DISTANCE then --если цель в досягаемости бандита
		
				if bandit_stop == false then --если бежит
			
					if distance <= MIN_BANDIT_DISTANCE then --если бандит близко, то останавливается
				
						bandit_stop = true; --стоп
						SetPlayerWeaponMode(bandit,3);
						PlayAnimation(bandit,"S_FISTRUN");
					end
				
				else --если стоит
				
					if distance > MIN_BANDIT_DISTANCE then --если цель опять удаляется
				
						bandit_stop = false; --бежит
						SetPlayerWeaponMode(bandit,3);
						PlayAnimation(bandit,"S_FISTRUNL");
					end
				end
				
				--Парамметры атаки
				if bandit_stop == true and bandit_instancehit == false then --если бандит рядом и начинает атаковать
					SetPlayerWeaponMode(bandit,3);
					bandit_instancehit = true;
					SetTimer("Bandit_Hit",1000,0);
					PlayAnimation(bandit,"S_1HATTACK");
				end
				
			else --если цель далеко от бандита, сбросить цель
				
				bandit_tid = -1;
				bandit_stop = true; --stop
				SetPlayerWeaponMode(bandit,0);
				PlayAnimation(bandit,"S_FISTRUN");
			end
			
		else --сброс если игрок или бандит мертв
		
			if bandit_stop == false then --если бежит
			
				bandit_tid = -1;
				bandit_stop = true;
				SetPlayerWeaponMode(bandit,0);
				PlayAnimation(bandit,"S_FISTRUN");
			end
		end
	end
end

function Bandit_Hit()

	if bandit_tid ~= -1 then --если существует цель
	
		if IsPlayerConnected(bandit_tid) == 1 then --если цель присоединена к серверу
		
			local distance = GetDistancePlayers(bandit,bandit_tid);
			
			if distance <= MIN_BANDIT_DISTANCE then --если бандит находится рядом с целью
				SetPlayerWeaponMode(bandit,3);
				HitPlayer(bandit,bandit_tid);
				PlayAnimation(bandit,"S_FISTRUN");
			end
		end
	end
	
	bandit_instancehit = false
end
--
function Banditx_AI()
	
	if banditx_tid == -1 then
	
		for i = 0, GetMaxSlots() - 1 do
		
			if IsPlayerConnected(i) == 1 and IsNPC(i) == 0 and GetPlayerHealth(i) > 0 and GetPlayerHealth(banditx) > 0 then
			
				if GetDistancePlayers(banditx,i) <= MAX_BANDIT_DISTANCE then
				
					banditx_tid = i;
					banditx_stop = false;
					PlayPlayerSound(banditx_tid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
					SendPlayerMessage(banditx_tid,0,255,0,"Бандит крикнул: Эй, я думал ты мертв!#атакует#(моб)");
					SetPlayerWeaponMode(banditx,3);
					PlayAnimation(banditx,"S_FISTRUNL");
					break;
				end
			end
		end
	else
		
		if IsPlayerConnected(banditx_tid) == 1 then
		
			local angle = GetAngleToPlayer(banditx,banditx_tid);
			
			if angle ~= GetPlayerAngle(banditx) then
				SetPlayerAngle(banditx,angle);
			end
			
			local distance = GetDistancePlayers(banditx,banditx_tid);
			
			if distance <= MAX_BANDIT_DISTANCE then --если цель в досягаемости бандита
		
				if banditx_stop == false then --если бежит
			
					if distance <= MIN_BANDIT_DISTANCE then --если бандит близко, то останавливается
				
						banditx_stop = true; --стоп
						SetPlayerWeaponMode(banditx,3);
						PlayAnimation(banditx,"S_FISTRUN");
					end
				
				else --если стоит
				
					if distance > MIN_BANDIT_DISTANCE then --если цель опять удаляется
				
						banditx_stop = false; --бежит
						SetPlayerWeaponMode(banditx,3);
						PlayAnimation(banditx,"S_FISTRUNL");
					end
				end
				
				--Парамметры атаки
				if banditx_stop == true and banditx_instancehit == false then --если бандит рядом и начинает атаковать
					SetPlayerWeaponMode(banditx,3);
					banditx_instancehit = true;
					SetTimer("Banditx_Hit",1000,0);
					PlayAnimation(banditx,"S_1HATTACK");
				end
				
			else --если цель далеко от бандита, сбросить цель
				
				banditx_tid = -1;
				banditx_stop = true; --stop
				SetPlayerWeaponMode(banditx,0);
				PlayAnimation(banditx,"S_FISTRUN");
			end
			
		else --сброс если игрок или бандит мертв
		
			if banditx_stop == false then --если бежит
			
				banditx_tid = -1;
				banditx_stop = true;
				SetPlayerWeaponMode(banditx,0);
				PlayAnimation(banditx,"S_FISTRUN");
			end
		end
	end
end

function Banditx_Hit()

	if banditx_tid ~= -1 then --если существует цель
	
		if IsPlayerConnected(banditx_tid) == 1 then --если цель присоединена к серверу
		
			local distance = GetDistancePlayers(banditx,banditx_tid);
			
			if distance <= MIN_BANDIT_DISTANCE then --если бандит находится рядом с целью
				SetPlayerWeaponMode(banditx,3);
				HitPlayer(banditx,banditx_tid);
				PlayAnimation(banditx,"S_FISTRUN");
			end
		end
	end
	
	banditx_instancehit = false
end
--
function Banditx2_AI()
	
	if banditx2_tid == -1 then
	
		for i = 0, GetMaxSlots() - 1 do
		
			if IsPlayerConnected(i) == 1 and IsNPC(i) == 0 and GetPlayerHealth(i) > 0 and GetPlayerHealth(banditx2) > 0 then
			
				if GetDistancePlayers(banditx2,i) <= MAX_BANDIT_DISTANCE then
				
					banditx2_tid = i;
					banditx2_stop = false;
					PlayPlayerSound(banditx2_tid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
					SendPlayerMessage(banditx2_tid,0,255,0,"Бандит крикнул: Эй, я думал ты мертв!#атакует#(моб)");
					SetPlayerWeaponMode(banditx2,3);
					PlayAnimation(banditx2,"S_FISTRUNL");
					break;
				end
			end
		end
	else
		
		if IsPlayerConnected(banditx2_tid) == 1 then
		
			local angle = GetAngleToPlayer(banditx2,banditx2_tid);
			
			if angle ~= GetPlayerAngle(banditx2) then
				SetPlayerAngle(banditx2,angle);
			end
			
			local distance = GetDistancePlayers(banditx2,banditx2_tid);
			
			if distance <= MAX_BANDIT_DISTANCE then --если цель в досягаемости бандита
		
				if banditx2_stop == false then --если бежит
			
					if distance <= MIN_BANDIT_DISTANCE then --если бандит близко, то останавливается
				
						banditx2_stop = true; --стоп
						SetPlayerWeaponMode(banditx2,3);
						PlayAnimation(banditx2,"S_FISTRUN");
					end
				
				else --если стоит
				
					if distance > MIN_BANDIT_DISTANCE then --если цель опять удаляется
				
						banditx2_stop = false; --бежит
						SetPlayerWeaponMode(banditx2,3);
						PlayAnimation(banditx2,"S_FISTRUNL");
					end
				end
				
				--Парамметры атаки
				if banditx2_stop == true and banditx2_instancehit == false then --если бандит рядом и начинает атаковать
					SetPlayerWeaponMode(banditx2,3);
					banditx2_instancehit = true;
					SetTimer("Banditx2_Hit",1000,0);
					PlayAnimation(banditx2,"S_1HATTACK");
				end
				
			else --если цель далеко от бандита, сбросить цель
				
				banditx2_tid = -1;
				banditx2_stop = true; --stop
				SetPlayerWeaponMode(banditx2,0);
				PlayAnimation(banditx2,"S_FISTRUN");
			end
			
		else --сброс если игрок или бандит мертв
		
			if banditx2_stop == false then --если бежит
			
				banditx2_tid = -1;
				banditx2_stop = true;
				SetPlayerWeaponMode(banditx2,0);
				PlayAnimation(banditx2,"S_FISTRUN");
			end
		end
	end
end

function Banditx2_Hit()

	if banditx2_tid ~= -1 then --если существует цель
	
		if IsPlayerConnected(banditx2_tid) == 1 then --если цель присоединена к серверу
		
			local distance = GetDistancePlayers(banditx2,banditx2_tid);
			
			if distance <= MIN_BANDIT_DISTANCE then --если бандит находится рядом с целью
				SetPlayerWeaponMode(banditx2,3);
				HitPlayer(banditx2,banditx2_tid);
				PlayAnimation(banditx2,"S_FISTRUN");
			end
		end
	end
	
	banditx2_instancehit = false
end
--
function Banditx3_AI()
	
	if banditx3_tid == -1 then
	
		for i = 0, GetMaxSlots() - 1 do
		
			if IsPlayerConnected(i) == 1 and IsNPC(i) == 0 and GetPlayerHealth(i) > 0 and GetPlayerHealth(banditx3) > 0 then
			
				if GetDistancePlayers(banditx3,i) <= MAX_BANDIT_DISTANCE then
				
					banditx3_tid = i;
					banditx3_stop = false;
					PlayPlayerSound(banditx3_tid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
					SendPlayerMessage(banditx3_tid,0,255,0,"Бандит крикнул: Эй, я думал ты мертв!#атакует#(моб)");
					SetPlayerWeaponMode(banditx3,3);
					PlayAnimation(banditx3,"S_FISTRUNL");
					break;
				end
			end
		end
	else
		
		if IsPlayerConnected(banditx3_tid) == 1 then
		
			local angle = GetAngleToPlayer(banditx3,banditx3_tid);
			
			if angle ~= GetPlayerAngle(banditx3) then
				SetPlayerAngle(banditx3,angle);
			end
			
			local distance = GetDistancePlayers(banditx3,banditx3_tid);
			
			if distance <= MAX_BANDIT_DISTANCE then --если цель в досягаемости бандита
		
				if banditx3_stop == false then --если бежит
			
					if distance <= MIN_BANDIT_DISTANCE then --если бандит близко, то останавливается
				
						banditx3_stop = true; --стоп
						SetPlayerWeaponMode(banditx3,3);
						PlayAnimation(banditx3,"S_FISTRUN");
					end
				
				else --если стоит
				
					if distance > MIN_BANDIT_DISTANCE then --если цель опять удаляется
				
						banditx3_stop = false; --бежит
						SetPlayerWeaponMode(banditx3,3);
						PlayAnimation(banditx3,"S_FISTRUNL");
					end
				end
				
				--Парамметры атаки
				if banditx3_stop == true and banditx3_instancehit == false then --если бандит рядом и начинает атаковать
					SetPlayerWeaponMode(banditx3,3);
					banditx3_instancehit = true;
					SetTimer("banditx3_Hit",1000,0);
					PlayAnimation(banditx3,"S_1HATTACK");
				end
				
			else --если цель далеко от бандита, сбросить цель
				
				banditx3_tid = -1;
				banditx3_stop = true; --stop
				SetPlayerWeaponMode(banditx3,0);
				PlayAnimation(banditx3,"S_FISTRUN");
			end
			
		else --сброс если игрок или бандит мертв
		
			if banditx3_stop == false then --если бежит
			
				banditx3_tid = -1;
				banditx3_stop = true;
				SetPlayerWeaponMode(banditx3,0);
				PlayAnimation(banditx3,"S_FISTRUN");
			end
		end
	end
end

function banditx3_Hit()

	if banditx3_tid ~= -1 then --если существует цель
	
		if IsPlayerConnected(banditx3_tid) == 1 then --если цель присоединена к серверу
		
			local distance = GetDistancePlayers(banditx3,banditx3_tid);
			
			if distance <= MIN_BANDIT_DISTANCE then --если бандит находится рядом с целью
				SetPlayerWeaponMode(banditx3,3);
				HitPlayer(banditx3,banditx3_tid);
				PlayAnimation(banditx3,"S_FISTRUN");
			end
		end
	end
	
	banditx3_instancehit = false
end
--
function Banditx4_AI()
	
	if banditx4_tid == -1 then
	
		for i = 0, GetMaxSlots() - 1 do
		
			if IsPlayerConnected(i) == 1 and IsNPC(i) == 0 and GetPlayerHealth(i) > 0 and GetPlayerHealth(banditx4) > 0 then
			
				if GetDistancePlayers(banditx4,i) <= MAX_BANDIT_DISTANCE then
				
					banditx4_tid = i;
					banditx4_stop = false;
					PlayPlayerSound(banditx4_tid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
					SendPlayerMessage(banditx4_tid,0,255,0,"Бандит крикнул: Эй, я думал ты мертв!#атакует#(моб)");
					SetPlayerWeaponMode(banditx4,3);
					PlayAnimation(banditx4,"S_FISTRUNL");
					break;
				end
			end
		end
	else
		
		if IsPlayerConnected(banditx4_tid) == 1 then
		
			local angle = GetAngleToPlayer(banditx4,banditx4_tid);
			
			if angle ~= GetPlayerAngle(banditx4) then
				SetPlayerAngle(banditx4,angle);
			end
			
			local distance = GetDistancePlayers(banditx4,banditx4_tid);
			
			if distance <= MAX_BANDIT_DISTANCE then --если цель в досягаемости бандита
		
				if banditx4_stop == false then --если бежит
			
					if distance <= MIN_BANDIT_DISTANCE then --если бандит близко, то останавливается
				
						banditx4_stop = true; --стоп
						SetPlayerWeaponMode(banditx4,3);
						PlayAnimation(banditx4,"S_FISTRUN");
					end
				
				else --если стоит
				
					if distance > MIN_BANDIT_DISTANCE then --если цель опять удаляется
				
						banditx4_stop = false; --бежит
						SetPlayerWeaponMode(banditx4,3);
						PlayAnimation(banditx4,"S_FISTRUNL");
					end
				end
				
				--Парамметры атаки
				if banditx4_stop == true and banditx4_instancehit == false then --если бандит рядом и начинает атаковать
					SetPlayerWeaponMode(banditx4,3);
					banditx4_instancehit = true;
					SetTimer("banditx4_Hit",1000,0);
					PlayAnimation(banditx4,"S_1HATTACK");
				end
				
			else --если цель далеко от бандита, сбросить цель
				
				banditx4_tid = -1;
				banditx4_stop = true; --stop
				SetPlayerWeaponMode(banditx4,0);
				PlayAnimation(banditx4,"S_FISTRUN");
			end
			
		else --сброс если игрок или бандит мертв
		
			if banditx4_stop == false then --если бежит
			
				banditx4_tid = -1;
				banditx4_stop = true;
				SetPlayerWeaponMode(banditx4,0);
				PlayAnimation(banditx4,"S_FISTRUN");
			end
		end
	end
end

function banditx4_Hit()

	if banditx4_tid ~= -1 then --если существует цель
	
		if IsPlayerConnected(banditx4_tid) == 1 then --если цель присоединена к серверу
		
			local distance = GetDistancePlayers(banditx4,banditx4_tid);
			
			if distance <= MIN_BANDIT_DISTANCE then --если бандит находится рядом с целью
				SetPlayerWeaponMode(banditx4,3);
				HitPlayer(banditx4,banditx4_tid);
				PlayAnimation(banditx4,"S_FISTRUN");
			end
		end
	end
	
	banditx4_instancehit = false
end
--
function Banditx5_AI()
	
	if banditx5_tid == -1 then
	
		for i = 0, GetMaxSlots() - 1 do
		
			if IsPlayerConnected(i) == 1 and IsNPC(i) == 0 and GetPlayerHealth(i) > 0 and GetPlayerHealth(banditx5) > 0 then
			
				if GetDistancePlayers(banditx5,i) <= MAX_BANDIT_DISTANCE then
				
					banditx5_tid = i;
					banditx5_stop = false;
					PlayPlayerSound(banditx5_tid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
					SendPlayerMessage(banditx5_tid,0,255,0,"Бандит крикнул: Эй, я думал ты мертв!#атакует#(моб)");
					SetPlayerWeaponMode(banditx5,3);
					PlayAnimation(banditx5,"S_FISTRUNL");
					break;
				end
			end
		end
	else
		
		if IsPlayerConnected(banditx5_tid) == 1 then
		
			local angle = GetAngleToPlayer(banditx5,banditx5_tid);
			
			if angle ~= GetPlayerAngle(banditx5) then
				SetPlayerAngle(banditx5,angle);
			end
			
			local distance = GetDistancePlayers(banditx5,banditx5_tid);
			
			if distance <= MAX_BANDIT_DISTANCE then --если цель в досягаемости бандита
		
				if banditx5_stop == false then --если бежит
			
					if distance <= MIN_BANDIT_DISTANCE then --если бандит близко, то останавливается
				
						banditx5_stop = true; --стоп
						SetPlayerWeaponMode(banditx5,3);
						PlayAnimation(banditx5,"S_FISTRUN");
					end
				
				else --если стоит
				
					if distance > MIN_BANDIT_DISTANCE then --если цель опять удаляется
				
						banditx5_stop = false; --бежит
						SetPlayerWeaponMode(banditx5,3);
						PlayAnimation(banditx5,"S_FISTRUNL");
					end
				end
				
				--Парамметры атаки
				if banditx5_stop == true and banditx5_instancehit == false then --если бандит рядом и начинает атаковать
					SetPlayerWeaponMode(banditx5,3);
					banditx5_instancehit = true;
					SetTimer("banditx5_Hit",1000,0);
					PlayAnimation(banditx5,"S_1HATTACK");
				end
				
			else --если цель далеко от бандита, сбросить цель
				
				banditx5_tid = -1;
				banditx5_stop = true; --stop
				SetPlayerWeaponMode(banditx5,0);
				PlayAnimation(banditx5,"S_FISTRUN");
			end
			
		else --сброс если игрок или бандит мертв
		
			if banditx5_stop == false then --если бежит
			
				banditx5_tid = -1;
				banditx5_stop = true;
				SetPlayerWeaponMode(banditx5,0);
				PlayAnimation(banditx5,"S_FISTRUN");
			end
		end
	end
end

function banditx5_Hit()

	if banditx5_tid ~= -1 then --если существует цель
	
		if IsPlayerConnected(banditx5_tid) == 1 then --если цель присоединена к серверу
		
			local distance = GetDistancePlayers(banditx5,banditx5_tid);
			
			if distance <= MIN_BANDIT_DISTANCE then --если бандит находится рядом с целью
				SetPlayerWeaponMode(banditx5,3);
				HitPlayer(banditx5,banditx5_tid);
				PlayAnimation(banditx5,"S_FISTRUN");
			end
		end
	end
	
	banditx5_instancehit = false
end

local Mob_Kuznec = -1;

function BOT_Mob_Kuznec()
local BOT_Mob_Kuznec = CreateNPC("Айрон");
           if BOT_Mob_Kuznec >= 0 then
 
               Mob_Kuznec = BOT_Mob_Kuznec;
 
               SpawnPlayer(Mob_Kuznec);
			   --SetPlayerWorld(Mob_Kuznec,"STADT.ZEN","START");
			   SetPlayerInstance(Mob_Kuznec,"PC_HERO");
               SetPlayerPos(Mob_Kuznec,2007.4078369141, 246.65571594238, 847.49792480469);
               SetPlayerAngle(Mob_Kuznec,188);
			   SetPlayerMaxHealth(Mob_Kuznec,1000);
			   SetPlayerHealth(Mob_Kuznec, 1000);
			   SetPlayerColor(Mob_Kuznec,0,255,0);
			   SetPlayerAdditionalVisual(Mob_Kuznec,"Hum_Body_Naked0",1,"Hum_Head_Pony",105);
			   EquipArmor(Mob_Kuznec,"itar_smith");
			   EquipMeleeWeapon(Mob_Kuznec,"ItMw_1H_Mil_Sword");
			   SetPlayerWeaponMode(Mob_Kuznec,3);
               --PlayAnimation(Mob_Kuznec,"S_BSANVIL_S1");
			   PlayAnimation(Mob_Kuznec,"S_BSSHARP_S1");
			   EnablePlayerNicknameID(Mob_Kuznec,0);
			   --SetTimer("Mob_KuznecFix",60000,1);
end
end

function Mob_KuznecFix()
SetPlayerPos(Mob_Kuznec,5683.1904296875, 366.05856323242, -1592.9877929688);
SetPlayerHealth(Mob_Kuznec, 1000);
SetPlayerAngle(Mob_Kuznec,213);
PlayAnimation(Mob_Kuznec,"S_BSSHARP_S1");
end

function DayTime()
		local hour,minute = GetTime();
		if hour >= 7 and hour <= 12 then 
		--print("1")
		--Айрончек
		PlayAnimation(Mob_Kuznec,"S_BSSHARP_S1");
		--Джеки
		SetPlayerPos(Bot_Citizen10,-1540.9549560547, 4399.8579101563, 16186.513671875);
        SetPlayerAngle(Bot_Citizen10,323);
		PlayAnimation(Bot_Citizen10,"S_CHAIR_S1");
		elseif hour >= 12 and hour <= 20 then
		--print("2")
		--Айрончек
		PlayAnimation(Mob_Kuznec,"S_LGUARD");
		--Джеки
		SetPlayerPos(Bot_Citizen10,-1554.7271728516, 2507.8149414063, 16352.026367188);
        SetPlayerAngle(Bot_Citizen10,28);
		PlayAnimation(Bot_Citizen10,"T_1HSINSPECT");
		else
		--print("3")
		--Айрон
		PlayAnimation(Mob_Kuznec,"S_BEDHIGH_FRONT_S1");
		--Джеки
		SetPlayerPos(Bot_Citizen10,-1492.7622070313, 2476.1420898438, 16748.576171875);
        SetPlayerAngle(Bot_Citizen10,57);
		PlayAnimation(Bot_Citizen10,"S_BEDHIGH_FRONT_S1");
		end
	end

local Bot_Trader = -2;

function BOT_Bot_Trader()
local BOT_Bot_Trader = CreateNPC("Хавьер");
           if BOT_Bot_Trader >= 0 then
 
               Bot_Trader = BOT_Bot_Trader;
 
               SpawnPlayer(Bot_Trader);
			   --SetPlayerWorld(Bot_Trader,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Trader,"PC_HERO");
			   EquipArmor(Bot_Trader,"ITAR_Barkeeper");
               SetPlayerPos(Bot_Trader,482.2776184082, 347.72592163086, 2314.2922363281);
               SetPlayerAngle(Bot_Trader,215);
			   SetPlayerColor(Bot_Trader,0,255,0);
			   SetPlayerAdditionalVisual(Bot_Trader,"Hum_Body_Naked0",2,"Hum_Head_FatBald",23);
			   SetPlayerMaxHealth(Bot_Trader,1000);
			   SetPlayerHealth(Bot_Trader, 1000);
               PlayAnimation(Bot_Trader,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Trader,0);
			   --SetTimer("Bot_TraderFix",60000,1);
end
end

function Bot_TraderFix()
SetPlayerPos(Bot_Trader,1789.4014892578, -87.592376708984, -1216.5958251953);
SetPlayerHealth(Bot_Trader, 1000);
SetPlayerAngle(Bot_Trader,353);
PlayAnimation(Bot_Trader,"S_LGUARD");
end

local Bot_Hunter = -3;

function BOT_Bot_Hunter()
local BOT_Bot_Hunter = CreateNPC("Оливер");
           if BOT_Bot_Hunter >= 0 then
 
               Bot_Hunter = BOT_Bot_Hunter;
 
               SpawnPlayer(Bot_Hunter);
			   --SetPlayerWorld(Bot_Hunter,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Hunter,"PC_HERO");
			   EquipArmor(Bot_Hunter,"ITAR_leather_l");
               SetPlayerPos(Bot_Hunter,8164.302734375, 367.01889038086, -3386.7902832031);
               SetPlayerAngle(Bot_Hunter,242);
			   SetPlayerColor(Bot_Hunter,0,255,0);
			   SetPlayerAdditionalVisual(Bot_Hunter,"Hum_Body_Naked0",0,"Hum_Head_Pony",43);
			   SetPlayerMaxHealth(Bot_Hunter,1000);
			   SetPlayerHealth(Bot_Hunter, 1000);
               PlayAnimation(Bot_Hunter,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Hunter,0);
			   --SetTimer("Bot_HunterFix",60000,1);
end
end

function Bot_HunterFix()
SetPlayerPos(Bot_Hunter,8164.302734375, 367.01889038086, -3386.7902832031);
SetPlayerHealth(Bot_Hunter, 1000);
SetPlayerAngle(Bot_Hunter,242);
PlayAnimation(Bot_Hunter,"S_LGUARD");
end

local Bot_Alchemy = -4;

function BOT_Bot_Alchemy()
local BOT_Bot_Alchemy = CreateNPC("Иллион");
           if BOT_Bot_Alchemy >= 0 then
 
               Bot_Alchemy = BOT_Bot_Alchemy;
 
               SpawnPlayer(Bot_Alchemy);
			   --SetPlayerWorld(Bot_Alchemy,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Alchemy,"PC_HERO");
			   EquipArmor(Bot_Alchemy,"ITAR_Koza_l");
               SetPlayerPos(Bot_Alchemy,-19315.02734375, -2884.61328125, -12568.586914063);
               SetPlayerAngle(Bot_Alchemy,200);
			   SetPlayerColor(Bot_Alchemy,0,255,0);
			   SetPlayerAdditionalVisual(Bot_Alchemy,"Hum_Body_Naked0",1,"Hum_Head_Pony",86);
			   SetPlayerMaxHealth(Bot_Alchemy,1000);
			   SetPlayerHealth(Bot_Alchemy, 1000);
               PlayAnimation(Bot_Alchemy,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Alchemy,0);
			   --SetTimer("Bot_AlchemyFix",60000,1);
end
end

function Bot_AlchemyFix()
SetPlayerPos(Bot_Alchemy,-19315.02734375, -2884.61328125, -12568.586914063);
SetPlayerMaxHealth(Bot_Alchemy,1000);
SetPlayerHealth(Bot_Alchemy, 1000);
SetPlayerAngle(Bot_Alchemy,200);
PlayAnimation(Bot_Alchemy,"S_LGUARD");
end

local BOT_Reseller = -5;

function BOT_Bot_Reseller()
local BOT_Bot_Reseller = CreateNPC("Каррон");
           if BOT_Bot_Reseller >= 0 then
 
               Bot_Reseller = BOT_Bot_Reseller;
 
               SpawnPlayer(Bot_Reseller);
			   --SetPlayerWorld(Bot_Reseller,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Reseller,"PC_HERO");
			   EquipArmor(Bot_Reseller,"ITAR_VLK_M");
			   EquipMeleeWeapon(Bot_Reseller,"ITMW_schwert");
               SetPlayerPos(Bot_Reseller,2343.58984375, 248.20956420898, 1633.5676269531);
               SetPlayerAngle(Bot_Reseller,198);
			   SetPlayerColor(Bot_Reseller,0,255,0);
			   SetPlayerAdditionalVisual(Bot_Reseller,"Hum_Body_Naked0",2,"Hum_Head_Fighter",123);
			   SetPlayerMaxHealth(Bot_Reseller,1000);
			   SetPlayerHealth(Bot_Reseller, 1000);
               PlayAnimation(Bot_Reseller,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Reseller,0);
			   --SetTimer("Bot_ResellerFix",60000,1);
end
end

function Bot_ResellerFix()
SetPlayerPos(Bot_Reseller,-36124.859375, -1873.9371337891, 16948.11328125);
SetPlayerHealth(Bot_Reseller, 1000);
SetPlayerAngle(Bot_Reseller,74);
PlayAnimation(Bot_Reseller,"S_LGUARD");
end

local BOT_Tanis = -6;

function BOT_Bot_Tanis()
local BOT_Bot_Tanis = CreateNPC("Танис");
           if BOT_Bot_Tanis >= 0 then
 
               Bot_Tanis = BOT_Bot_Tanis;
 
               SpawnPlayer(Bot_Tanis);
			   --SetPlayerWorld(Bot_Tanis,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Tanis,"PC_HERO");
			   SetPlayerAdditionalVisual(Bot_Tanis,"Hum_Body_Naked0",1,"Hum_Head_FatBald",2);
			   SetPlayerStrength(Bot_Tanis,100);
			   EquipArmor(Bot_Tanis,"ITAR_BDT_M");
			   EquipRangedWeapon(Bot_Tanis,"ITRW_BOW_M_01");
			   EquipMeleeWeapon(Bot_Tanis,"ITMW_1H_PAL_SWORD");
               SetPlayerPos(Bot_Tanis,3690.4875488281, 648.17669677734, -1686.1842041016);
               SetPlayerAngle(Bot_Tanis,96);
			   SetPlayerColor(Bot_Tanis,0,255,0);
			   SetPlayerMaxHealth(Bot_Tanis,1000);
			   SetPlayerHealth(Bot_Tanis, 1000);
               PlayAnimation(Bot_Tanis,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Tanis,0);
			   --SetTimer("Bot_TanisFix",60000,1);
end
end

function Bot_TanisFix()
SetPlayerPos(Bot_Tanis,26937.767578125, -3936.8325195313, 13181.920898438);
SetPlayerHealth(Bot_Tanis, 1000);
SetPlayerAngle(Bot_Tanis,241);
PlayAnimation(Bot_Tanis,"S_LGUARD");
end

local BOT_Vor = -7;

function BOT_Bot_Vor()
local BOT_Bot_Vor = CreateNPC("Ималин");
           if BOT_Bot_Vor >= 0 then
 
               Bot_Vor = BOT_Bot_Vor;
 
               SpawnPlayer(Bot_Vor);
			   --SetPlayerWorld(Bot_Vor,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Vor,"PC_HERO");
			   SetPlayerAdditionalVisual(Bot_Vor,"Hum_Body_Naked0",1,"Hum_Head_Fighter",33);
			   SetPlayerStrength(Bot_Vor,100);
			   EquipArmor(Bot_Vor,"ITAR_Bomz_L");
			   --EquipMeleeWeapon(Bot_Vor,"ItMw_1H_Nov_Mace");
               SetPlayerPos(Bot_Vor,-5349.28125, -252.04780578613, -1204.6232910156);
               SetPlayerAngle(Bot_Vor,26);
			   SetPlayerColor(Bot_Vor,255,255,255);
			   SetPlayerMaxHealth(Bot_Vor,1000);
			   SetPlayerHealth(Bot_Vor, 1000);
               PlayAnimation(Bot_Vor,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Vor,0);
			   --SetTimer("Bot_VorFix",60000,1);
end
end

function Bot_VorFix()
SetPlayerPos(Bot_Vor,28992.662109375, -3324.7973632813, 15973.525390625);
SetPlayerMaxHealth(Bot_Vor,1000);
SetPlayerAngle(Bot_Vor,280);
PlayAnimation(Bot_Vor,"S_LGUARD");
end

local BOT_Guard = -8;

function BOT_Bot_Guard()
local BOT_Bot_Guard = CreateNPC("Королевский cтражник");
           if BOT_Bot_Guard >= 0 then
 
               Bot_Guard = BOT_Bot_Guard;
 
               SpawnPlayer(Bot_Guard);
			   --SetPlayerWorld(Bot_Guard,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Guard,"PC_HERO");
			   EquipArmor(Bot_Guard,"ItAr_PAL_H");
			   EquipMeleeWeapon(Bot_Guard,"ITMW_2H_PAL_SWORD");
			   SetPlayerAdditionalVisual(Bot_Guard,"Hum_Body_Naked0",2,"Hum_Head_Fighter",34);
			   SetPlayerStrength(Bot_Guard,100);
               SetPlayerPos(Bot_Guard,-16472.267578125, -1800.0665283203, 16654.8515625);
               SetPlayerAngle(Bot_Guard,303);
			   SetPlayerColor(Bot_Guard,0,255,0);
			   SetPlayerMaxHealth(Bot_Guard,1000);
			   SetPlayerHealth(Bot_Guard, 1000);
               PlayAnimation(Bot_Guard,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Guard,0);
			   --SetTimer("Bot_GuardFix",60000,1);
end
end

function Bot_GuardFix()
SetPlayerPos(Bot_Guard,-16472.267578125, -1800.0665283203, 16654.8515625);
SetPlayerHealth(Bot_Guard, 1000);
SetPlayerAngle(Bot_Guard,303);
PlayAnimation(Bot_Guard,"S_LGUARD");
end

local BOT_Guard2 = -9;

function BOT_Bot_Guard2()
local BOT_Bot_Guard2 = CreateNPC("Королевский cтражник");
           if BOT_Bot_Guard2 >= 0 then
 
               Bot_Guard2 = BOT_Bot_Guard2;
 
               SpawnPlayer(Bot_Guard2);
			   --SetPlayerWorld(Bot_Guard2,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Guard2,"PC_HERO");
			   EquipArmor(Bot_Guard2,"ItAr_PAL_H");
			   EquipMeleeWeapon(Bot_Guard2,"ITMW_1H_PAL_SWORD");
			   SetPlayerAdditionalVisual(Bot_Guard2,"Hum_Body_Naked0",2,"Hum_Head_Fighter",35);
			   SetPlayerStrength(Bot_Guard2,100);
               SetPlayerPos(Bot_Guard2,-16346.248046875, -1794.3413085938, 16878.892578125);
               SetPlayerAngle(Bot_Guard2,283);
			   SetPlayerColor(Bot_Guard2,0,255,0);
			   SetPlayerMaxHealth(Bot_Guard2,1000);
			   SetPlayerHealth(Bot_Guard2, 1000);
               PlayAnimation(Bot_Guard2,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Guard2,0);
			   --SetTimer("Bot_Guard2Fix",60000,1);
end
end

function Bot_Guard2Fix()
SetPlayerPos(Bot_Guard2,-16346.248046875, -1794.3413085938, 16878.892578125);
SetPlayerHealth(Bot_Guard2, 1000);
SetPlayerAngle(Bot_Guard2,283);
PlayAnimation(Bot_Guard2,"S_LGUARD");
end

local BOT_Guard3 = -13;

function BOT_Bot_Guard3()
local BOT_Bot_Guard3 = CreateNPC("Мятежник-смотритель");
           if BOT_Bot_Guard3 >= 0 then
 
               Bot_Guard3 = BOT_Bot_Guard3;
 
               SpawnPlayer(Bot_Guard3);
			   --SetPlayerWorld(Bot_Guard3,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Guard3,"PC_HERO");
			   EquipArmor(Bot_Guard3,"ITAR_MTZ_l");
			   EquipMeleeWeapon(Bot_Guard3,"ITMW_1H_PAL_SWORD");
			   SetPlayerAdditionalVisual(Bot_Guard3,"Hum_Body_Naked0",2,"Hum_Head_Fighter",72);
			   SetPlayerStrength(Bot_Guard3,100);
               SetPlayerPos(Bot_Guard3,29759.78515625, -3533.3522949219, 21785.404296875);
               SetPlayerAngle(Bot_Guard3,198);
			   SetPlayerColor(Bot_Guard3,0,255,0);
			   SetPlayerMaxHealth(Bot_Guard3,1000);
			   SetPlayerHealth(Bot_Guard3, 1000);
               PlayAnimation(Bot_Guard3,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Guard3,0);
			   --SetTimer("Bot_Guard3Fix",60000,1);
end
end

function Bot_Guard3Fix()
SetPlayerPos(Bot_Guard3,29759.78515625, -3533.3522949219, 21785.404296875);
SetPlayerHealth(Bot_Guard3, 1000);
SetPlayerAngle(Bot_Guard3,198);
PlayAnimation(Bot_Guard3,"S_LGUARD");
end

local BOT_Guard4 = -12;

function BOT_Bot_Guard4()
local BOT_Bot_Guard4 = CreateNPC("Мятежник-смотритель");
           if BOT_Bot_Guard4 >= 0 then
 
               Bot_Guard4 = BOT_Bot_Guard4;
 
               SpawnPlayer(Bot_Guard4);
			   --SetPlayerWorld(Bot_Guard4,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Guard4,"PC_HERO");
			   EquipArmor(Bot_Guard4,"ITAR_MTZ_l");
			   EquipMeleeWeapon(Bot_Guard4,"ITMW_1H_PAL_SWORD");
			   SetPlayerAdditionalVisual(Bot_Guard4,"Hum_Body_Naked0",2,"Hum_Head_Fighter",73);
			   SetPlayerStrength(Bot_Guard4,100);
               SetPlayerPos(Bot_Guard4,29992.8984375, -3536.541015625, 21701.033203125);
               SetPlayerAngle(Bot_Guard4,204);
			   SetPlayerColor(Bot_Guard4,0,255,0);
			   SetPlayerMaxHealth(Bot_Guard4,1000);
			   SetPlayerHealth(Bot_Guard4, 1000);
               PlayAnimation(Bot_Guard4,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Guard4,0);
			   --SetTimer("Bot_Guard4Fix",60000,1);
end
end

function Bot_Guard4Fix()
SetPlayerPos(Bot_Guard4,29992.8984375, -3536.541015625, 21701.033203125);
SetPlayerHealth(Bot_Guard4, 1000);
SetPlayerAngle(Bot_Guard4,204);
PlayAnimation(Bot_Guard4,"S_LGUARD");
end

local BOT_Povar = -10;

function BOT_Bot_Povar()
local BOT_Bot_Povar = CreateNPC("Карлос");
           if BOT_Bot_Povar >= 0 then
 
               Bot_Povar = BOT_Bot_Povar;
 
               SpawnPlayer(Bot_Povar);
			   --SetPlayerWorld(Bot_Povar,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Povar,"PC_HERO");
			   EquipArmor(Bot_Povar,"ITAR_Barkeeper");
			   SetPlayerAdditionalVisual(Bot_Povar,"Hum_Body_Naked0",2,"Hum_Head_FatBald",38);
			   SetPlayerStrength(Bot_Povar,100);
               SetPlayerPos(Bot_Povar,5786.2104492188, 399.84710693359, 2649.6599121094);
               SetPlayerAngle(Bot_Povar,65);
			   SetPlayerColor(Bot_Povar,0,255,0);
			   SetPlayerMaxHealth(Bot_Povar,1000);
			   SetPlayerHealth(Bot_Povar, 1000);
               PlayAnimation(Bot_Povar,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Povar,0);
			   --SetTimer("Bot_PovarFix",60000,1);
end
end

function Bot_PovarFix()
SetPlayerPos(Bot_Povar,5786.2104492188, 399.84710693359, 2649.6599121094);
SetPlayerHealth(Bot_Povar, 1000);
SetPlayerAngle(Bot_Povar,65);
PlayAnimation(Bot_Povar,"S_LGUARD");
end

local BOT_Mudak = -111;

function BOT_Bot_Mudak()
local BOT_Bot_Mudak = CreateNPC("Мад");
           if BOT_Bot_Mudak >= 0 then
 
               Bot_Mudak = BOT_Bot_Mudak;
 
               SpawnPlayer(Bot_Mudak);
			   --SetPlayerWorld(Bot_Mudak,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Mudak,"PC_HERO");
			   EquipArmor(Bot_Mudak,"ITAR_VLK_L");
			   SetPlayerAdditionalVisual(Bot_Mudak,"Hum_Body_Naked0",1,"Hum_Head_Pony",22);
			   SetPlayerStrength(Bot_Mudak,100);
               SetPlayerPos(Bot_Mudak,1210.3660888672, -122.28173065186, -469.95404052734);
               SetPlayerAngle(Bot_Mudak,107);
			   SetPlayerColor(Bot_Mudak,255,255,255);
			   SetPlayerMaxHealth(Bot_Mudak,1000);
			   SetPlayerHealth(Bot_Mudak, 1000);
               PlayAnimation(Bot_Mudak,"S_CHAIR_S1");
			   EnablePlayerNicknameID(Bot_Mudak,0);
			   --SetTimer("Bot_MudakFix",60000,1);
end
end

function Bot_MudakFix()
SetPlayerPos(Bot_Mudak,1210.3660888672, -122.28173065186, -469.95404052734);
SetPlayerHealth(Bot_Mudak, 1000);
SetPlayerAngle(Bot_Mudak,107);
PlayAnimation(Bot_Mudak,"S_CHAIR_S1");
end

local BOT_Citizen = -112;

function BOT_Bot_Citizen()
local BOT_Bot_Citizen = CreateNPC("Рудокоп");
           if BOT_Bot_Citizen >= 0 then
 
               Bot_Citizen = BOT_Bot_Citizen;
 
               SpawnPlayer(Bot_Citizen);
			   --SetPlayerWorld(Bot_Citizen,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen,"PC_HERO");
			   EquipArmor(Bot_Citizen,"VLK_ARMOR_L");
			   EquipMeleeWeapon(Bot_Citizen,"ItMwPickaxe");
			   SetPlayerAdditionalVisual(Bot_Citizen,"Hum_Body_Naked0",1,"Hum_Head_Pony",24);
			   SetPlayerStrength(Bot_Citizen,100);
			   SetPlayerWalk(Bot_Citizen,"HumanS_Relaxed.mds");
               SetPlayerPos(Bot_Citizen,2823.4519042969, 247.91310119629, -1752.5988769531);
               SetPlayerAngle(Bot_Citizen,340);
			   SetPlayerColor(Bot_Citizen,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen,1000);
			   SetPlayerHealth(Bot_Citizen, 1000);
               PlayAnimation(Bot_Citizen,"S_SIT");
			   EnablePlayerNicknameID(Bot_Citizen,0);
			   --SetTimer("Bot_CitizenFix",60000,1);
end
end

function Bot_CitizenFix()
SetPlayerPos(Bot_Citizen,2573.6159667969, -121.59561157227, -4752.0068359375);
SetPlayerHealth(Bot_Citizen, 1000);
SetPlayerAngle(Bot_Citizen,30);
PlayAnimation(Bot_Citizen,"S_CHAIR_S1");
end

local BOT_Citizen2 = -113;

function BOT_Bot_Citizen2()
local BOT_Bot_Citizen2 = CreateNPC("Горожанин");
           if BOT_Bot_Citizen2 >= 0 then
 
               Bot_Citizen2 = BOT_Bot_Citizen2;
 
               SpawnPlayer(Bot_Citizen2);
			   --SetPlayerWorld(Bot_Citizen2,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen2,"PC_HERO");
			   EquipArmor(Bot_Citizen2,"ITAR_VLK_L");
			   EquipMeleeWeapon(Bot_Citizen2,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Citizen2,"Hum_Body_Naked0",1,"Hum_Head_Pony",25);
			   SetPlayerStrength(Bot_Citizen2,100);
               SetPlayerPos(Bot_Citizen2,8823.650390625, 226.24617004395, -783.57995605469);
               SetPlayerAngle(Bot_Citizen2,87);
			   SetPlayerColor(Bot_Citizen2,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen2,1000);
			   SetPlayerHealth(Bot_Citizen2, 1000);
               PlayAnimation(Bot_Citizen2,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Citizen2,0);
			   --SetTimer("Bot_Citizen2Fix",60000,1);
end
end

function Bot_Citizen2Fix()
SetPlayerPos(Bot_Citizen2,8823.650390625, 226.24617004395, -783.57995605469);
SetPlayerHealth(Bot_Citizen2, 1000);
SetPlayerAngle(Bot_Citizen2,87);
PlayAnimation(Bot_Citizen2,"S_LGUARD");
end

local BOT_Citizen3 = -114;

function BOT_Bot_Citizen3()
local BOT_Bot_Citizen3 = CreateNPC("Горожанин");
           if BOT_Bot_Citizen3 >= 0 then
 
               Bot_Citizen3 = BOT_Bot_Citizen3;
 
               SpawnPlayer(Bot_Citizen3);
			   --SetPlayerWorld(Bot_Citizen3,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen3,"PC_HERO");
			   EquipArmor(Bot_Citizen3,"ITAR_VLK_L");
			   EquipMeleeWeapon(Bot_Citizen3,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Citizen3,"Hum_Body_Naked0",1,"Hum_Head_FatBald",21);
			   SetPlayerStrength(Bot_Citizen3,100);
               SetPlayerPos(Bot_Citizen3,8840.4658203125, 226.44680786133, -508.16387939453);
               SetPlayerAngle(Bot_Citizen3,103);
			   SetPlayerColor(Bot_Citizen3,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen3,1000);
			   SetPlayerHealth(Bot_Citizen3, 1000);
               PlayAnimation(Bot_Citizen3,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Citizen3,0);
			   --SetTimer("Bot_Citizen3Fix",60000,1);
end
end

function Bot_Citizen3Fix()
SetPlayerPos(Bot_Citizen3,8840.4658203125, 226.44680786133, -508.16387939453);
SetPlayerHealth(Bot_Citizen3, 1000);
SetPlayerAngle(Bot_Citizen3,103);
PlayAnimation(Bot_Citizen3,"S_LGUARD");
end

local BOT_Citizen4 = -115;

function BOT_Bot_Citizen4()
local BOT_Bot_Citizen4 = CreateNPC("Горожанин");
           if BOT_Bot_Citizen4 >= 0 then
 
               Bot_Citizen4 = BOT_Bot_Citizen4;
 
               SpawnPlayer(Bot_Citizen4);
			   --SetPlayerWorld(Bot_Citizen4,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen4,"PC_HERO");
			   EquipArmor(Bot_Citizen4,"ITAR_VLK_H");
			   EquipMeleeWeapon(Bot_Citizen4,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Citizen4,"Hum_Body_Naked0",1,"Hum_Head_Pony",20);
			   SetPlayerStrength(Bot_Citizen4,100);
               SetPlayerPos(Bot_Citizen4,8859.9091796875, 226.43067932129, -1044.3913574219);
               SetPlayerAngle(Bot_Citizen4,63);
			   SetPlayerColor(Bot_Citizen4,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen4,1000);
			   SetPlayerHealth(Bot_Citizen4, 1000);
               PlayAnimation(Bot_Citizen4,"S_HGUARD");
			   EnablePlayerNicknameID(Bot_Citizen4,0);
			   --SetTimer("Bot_Citizen4Fix",60000,1);
end
end

function Bot_Citizen4Fix()
SetPlayerPos(Bot_Citizen4,8859.9091796875, 226.43067932129, -1044.3913574219);
SetPlayerHealth(Bot_Citizen4, 1000);
SetPlayerAngle(Bot_Citizen4,63);
PlayAnimation(Bot_Citizen4,"S_HGUARD");
end

local BOT_Citizen5 = -116;

function BOT_Bot_Citizen5()
local BOT_Bot_Citizen5 = CreateNPC("Беженец");
           if BOT_Bot_Citizen5 >= 0 then
 
               Bot_Citizen5 = BOT_Bot_Citizen5;
 
               SpawnPlayer(Bot_Citizen5);
			   --SetPlayerWorld(Bot_Citizen5,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen5,"PC_HERO");
			   EquipArmor(Bot_Citizen5,"ITAR_NOV_L");
			   EquipMeleeWeapon(Bot_Citizen5,"ItMw_1H_Nov_Mace");
			   SetPlayerAdditionalVisual(Bot_Citizen5,"Hum_Body_Naked0",0,"Hum_Head_FatBald",19);
			   SetPlayerStrength(Bot_Citizen5,100);
			   SetPlayerWalk(Bot_Citizen5,"HumanS_Relaxed.mds");
               SetPlayerPos(Bot_Citizen5,47649.80078125, 4990.9614257813, 18207.421875);
               SetPlayerAngle(Bot_Citizen5,327);
			   SetPlayerColor(Bot_Citizen5,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen5,1000);
			   SetPlayerHealth(Bot_Citizen5, 1000);
               PlayAnimation(Bot_Citizen5,"S_SIT");
			   EnablePlayerNicknameID(Bot_Citizen5,0);
			   --SetTimer("Bot_Citizen5Fix",60000,1);
end
end

function Bot_Citizen5Fix()
SetPlayerPos(Bot_Citizen5,8609.646484375, 226.46827697754, -590.16845703125);
SetPlayerHealth(Bot_Citizen5, 1000);
SetPlayerAngle(Bot_Citizen5,93);
PlayAnimation(Bot_Citizen5,"S_SIT");
end

local BOT_Citizen6 = -117;

function BOT_Bot_Citizen6()
local BOT_Bot_Citizen6 = CreateNPC("Горожанин");
           if BOT_Bot_Citizen6 >= 0 then
 
               Bot_Citizen6 = BOT_Bot_Citizen6;
 
               SpawnPlayer(Bot_Citizen6);
			   --SetPlayerWorld(Bot_Citizen6,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen6,"PC_HERO");
			   EquipArmor(Bot_Citizen6,"ITAR_VLK_M");
			   EquipMeleeWeapon(Bot_Citizen6,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Citizen6,"Hum_Body_Naked0",1,"Hum_Head_Pony",18);
			   SetPlayerStrength(Bot_Citizen6,100);
               SetPlayerPos(Bot_Citizen6,8596.23046875, 226.47326660156, -865.16186523438);
               SetPlayerAngle(Bot_Citizen6,80);
			   SetPlayerColor(Bot_Citizen6,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen6,1000);
			   SetPlayerHealth(Bot_Citizen6, 1000);
               PlayAnimation(Bot_Citizen6,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Citizen6,0);
			   --SetTimer("Bot_Citizen6Fix",60000,1);
end
end

function Bot_Citizen6Fix()
SetPlayerPos(Bot_Citizen6,8596.23046875, 226.47326660156, -865.16186523438);
SetPlayerHealth(Bot_Citizen6, 1000);
SetPlayerAngle(Bot_Citizen6,80);
PlayAnimation(Bot_Citizen6,"S_LGUARD");
end

local BOT_Citizen7 = -118;

function BOT_Bot_Citizen7()
local BOT_Bot_Citizen7 = CreateNPC("Абуин");
           if BOT_Bot_Citizen7 >= 0 then
 
               Bot_Citizen7 = BOT_Bot_Citizen7;
 
               SpawnPlayer(Bot_Citizen7);
			   --SetPlayerWorld(Bot_Citizen7,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen7,"PC_HERO");
			   EquipArmor(Bot_Citizen7,"VLK_ARMOR_M");
			   EquipMeleeWeapon(Bot_Citizen7,"ItMwPickaxe");
			   SetPlayerAdditionalVisual(Bot_Citizen7,"Hum_Body_Naked0",3,"Hum_Head_FatBald",134);
			   SetPlayerStrength(Bot_Citizen7,100);
               SetPlayerPos(Bot_Citizen7,2490.0148925781, 247.93199157715, -1720.6246337891);
               SetPlayerAngle(Bot_Citizen7,20);
			   SetPlayerColor(Bot_Citizen7,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen7,1000);
			   SetPlayerHealth(Bot_Citizen7, 1000);
               PlayAnimation(Bot_Citizen7,"S_SIT");
			   EnablePlayerNicknameID(Bot_Citizen7,0);
			   --SetTimer("Bot_Citizen7Fix",60000,1);
end
end

function Bot_Citizen7Fix()
SetPlayerPos(Bot_Citizen7,6815.3237304688, 299.59732055664, 3236.3825683594);
SetPlayerHealth(Bot_Citizen7, 1000);
SetPlayerAngle(Bot_Citizen7,201);
PlayAnimation(Bot_Citizen7,"S_SMOKE_S1");
end

local BOT_Citizen8 = -119;

function BOT_Bot_Citizen8()
local BOT_Bot_Citizen8 = CreateNPC("Алкаш");
           if BOT_Bot_Citizen8 >= 0 then
 
               Bot_Citizen8 = BOT_Bot_Citizen8;
 
               SpawnPlayer(Bot_Citizen8);
			   --SetPlayerWorld(Bot_Citizen8,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen8,"PC_HERO");
			   EquipArmor(Bot_Citizen8,"ITAR_VLK_M");
			   SetPlayerAdditionalVisual(Bot_Citizen8,"Hum_Body_Naked0",1,"Hum_Head_Pony",59);
			   SetPlayerStrength(Bot_Citizen8,100);
               SetPlayerPos(Bot_Citizen8,8305.1904296875, 193.28552246094, 1549.8048095703);
               SetPlayerAngle(Bot_Citizen8,187);
			   SetPlayerColor(Bot_Citizen8,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen8,1000);
			   SetPlayerHealth(Bot_Citizen8, 1000);
               PlayAnimation(Bot_Citizen8,"T_POTION_RANDOM_1");
			   EnablePlayerNicknameID(Bot_Citizen8,0);
			   --SetTimer("Bot_Citizen8Fix",60000,1);
end
end

function Bot_Citizen8Fix()
SetPlayerPos(Bot_Citizen8,8305.1904296875, 193.28552246094, 1549.8048095703);
SetPlayerHealth(Bot_Citizen8, 1000);
SetPlayerAngle(Bot_Citizen8,187);
PlayAnimation(Bot_Citizen8,"T_POTION_RANDOM_1");
end

local BOT_Citizen9 = -120;

function BOT_Bot_Citizen9()
local BOT_Bot_Citizen9 = CreateNPC("Ватрас");
           if BOT_Bot_Citizen9 >= 0 then
 
               Bot_Citizen9 = BOT_Bot_Citizen9;
 
               SpawnPlayer(Bot_Citizen9);
			   --SetPlayerWorld(Bot_Citizen9,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen9,"PC_HERO");
			   EquipArmor(Bot_Citizen9,"ITAR_KDW_H");
			   EquipMeleeWeapon(Bot_Citizen9,"ItMw_Addon_Stab02");
			   SetPlayerAdditionalVisual(Bot_Citizen9,"Hum_Body_Naked0",1,"Hum_Head_Pony",63);
			   SetPlayerStrength(Bot_Citizen9,100);
               SetPlayerPos(Bot_Citizen9,9410.48046875, 368.34957885742, -735.64147949219);
               SetPlayerAngle(Bot_Citizen9,264);
			   SetPlayerColor(Bot_Citizen9,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen9,1000);
			   SetPlayerHealth(Bot_Citizen9, 1000);
               PlayAnimation(Bot_Citizen9,"T_DIALOGGESTURE_19");
			   EnablePlayerNicknameID(Bot_Citizen9,0);
			   --SetTimer("Bot_Citizen9Fix",60000,1);
end
end

function Bot_Citizen9Fix()
SetPlayerPos(Bot_Citizen9,9410.48046875, 368.34957885742, -735.64147949219);
SetPlayerHealth(Bot_Citizen9, 1000);
SetPlayerAngle(Bot_Citizen9,264);
PlayAnimation(Bot_Citizen9,"T_DIALOGGESTURE_19");
end

local BOT_Citizen10 = -121;

function BOT_Bot_Citizen10()
local BOT_Bot_Citizen10 = CreateNPC("Джек");
           if BOT_Bot_Citizen10 >= 0 then
 
               Bot_Citizen10 = BOT_Bot_Citizen10;
 
               SpawnPlayer(Bot_Citizen10);
			   --SetPlayerWorld(Bot_Citizen10,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Citizen10,"PC_HERO");
			   EquipArmor(Bot_Citizen10,"ITAR_VLK_L");
			   EquipMeleeWeapon(Bot_Citizen10,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Citizen10,"Hum_Body_Naked0",1,"Hum_Head_Pony",60);
			   SetPlayerStrength(Bot_Citizen10,100);
               SetPlayerPos(Bot_Citizen10,-1554.7271728516, 2507.8149414063, 16352.026367188);
               SetPlayerAngle(Bot_Citizen10,28);
			   SetPlayerColor(Bot_Citizen10,255,255,255);
			   SetPlayerMaxHealth(Bot_Citizen10,1000);
			   SetPlayerHealth(Bot_Citizen10, 1000);
               PlayAnimation(Bot_Citizen10,"S_CHAIR_S1");
			   EnablePlayerNicknameID(Bot_Citizen10,0);
			   --SetTimer("Bot_Citizen10Fix",60000,1);
end
end

--[[function Bot_Citizen10Fix()
SetPlayerPos(Bot_Citizen10,-1554.7271728516, 2507.8149414063, 16352.026367188);
SetPlayerHealth(Bot_Citizen10, 1000);
SetPlayerAngle(Bot_Citizen10,28);
PlayAnimation(Bot_Citizen10,"S_CHAIR_S1");
end]]

local BOT_Traktir = -122;

function BOT_Bot_Traktir()
local BOT_Bot_Traktir = CreateNPC("Трактирщик");
           if BOT_Bot_Traktir >= 0 then
 
               Bot_Traktir = BOT_Bot_Traktir;
 
               SpawnPlayer(Bot_Traktir);
			   --SetPlayerWorld(Bot_Traktir,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Traktir,"PC_HERO");
			   EquipArmor(Bot_Traktir,"ITAR_Barkeeper");
			   SetPlayerAdditionalVisual(Bot_Traktir,"Hum_Body_Naked0",2,"Hum_Head_FatBald",37);
			   SetPlayerStrength(Bot_Traktir,100);
               SetPlayerPos(Bot_Traktir,7844.0615234375, 224.90780639648, 1323.0083007813);
               SetPlayerAngle(Bot_Traktir,122);
			   SetPlayerColor(Bot_Traktir,0,255,0);
			   SetPlayerMaxHealth(Bot_Traktir,1000);
			   SetPlayerHealth(Bot_Traktir, 1000);
               PlayAnimation(Bot_Traktir,"S_LGUARD");
			   EnablePlayerNicknameID(Bot_Traktir,0);
			   --SetTimer("Bot_TraktirFix",60000,1);
end
end

function Bot_TraktirFix()
SetPlayerPos(Bot_Traktir,7844.0615234375, 224.90780639648, 1323.0083007813);
SetPlayerHealth(Bot_Traktir, 1000);
SetPlayerAngle(Bot_Traktir,122);
PlayAnimation(Bot_Traktir,"S_LGUARD");
end

local BOT_Baba = -123;

function BOT_Bot_Baba()
local BOT_Bot_Baba = CreateNPC("Шлюха портовая");
           if BOT_Bot_Baba >= 0 then
 
               Bot_Baba = BOT_Bot_Baba;

               SpawnPlayer(Bot_Baba);
			   --SetPlayerWorld(Bot_Baba,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Baba,"PC_HERO");
			   EquipArmor(Bot_Baba,"ITAR_VLKBABE_L");
			   EquipMeleeWeapon(Bot_Baba,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Baba,"HUM_BODY_BABE0",5,"HUM_HEAD_BABE4",146);
			   SetPlayerStrength(Bot_Baba,100);
               SetPlayerPos(Bot_Baba,2300.3129882813, 191.76493835449, -3511.2722167969);
               SetPlayerAngle(Bot_Baba,272);
			   SetPlayerColor(Bot_Baba,255,255,255);
			   SetPlayerMaxHealth(Bot_Baba,1000);
			   SetPlayerHealth(Bot_Baba, 1000);
               PlayAnimation(Bot_Baba,"S_PRAY");
			   EnablePlayerNicknameID(Bot_Baba,0);
			   --SetTimer("Bot_BabaFix",60000,1);
end
end

function Bot_BabaFix()
SetPlayerPos(Bot_Baba,2573.6159667969, -121.59561157227, -4752.0068359375);
SetPlayerHealth(Bot_Baba, 1000);
SetPlayerAngle(Bot_Baba,30);
PlayAnimation(Bot_Baba,"S_CHAIR_S1");
end

local BOT_Anakronoloh = -124;

function BOT_Bot_Anakronoloh()
local BOT_Bot_Anakronoloh = CreateNPC("Анасрон");
           if BOT_Bot_Anakronoloh >= 0 then
 
               Bot_Anakronoloh = BOT_Bot_Anakronoloh;
 
               SpawnPlayer(Bot_Anakronoloh);
			   --SetPlayerWorld(Bot_Anakronoloh,"STADT.ZEN","START");
			   SetPlayerInstance(Bot_Anakronoloh,"PC_HERO");
			   EquipArmor(Bot_Anakronoloh,"ITAR_VLK_L");
			   EquipMeleeWeapon(Bot_Anakronoloh,"ItMw_FrancisDagger_Mis");
			   SetPlayerAdditionalVisual(Bot_Anakronoloh,"Hum_Body_Naked0",1,"HUM_HEAD_PONY",24);
			   SetPlayerStrength(Bot_Anakronoloh,100);
               SetPlayerPos(Bot_Anakronoloh,2250.7282714844, 245.71640014648, -3512.3129882813);
               SetPlayerAngle(Bot_Anakronoloh,90);
			   SetPlayerColor(Bot_Anakronoloh,255,255,255);
			   SetPlayerMaxHealth(Bot_Anakronoloh,1000);
			   SetPlayerHealth(Bot_Anakronoloh, 1000);
               PlayAnimation(Bot_Anakronoloh,"S_PEE");
			   EnablePlayerNicknameID(Bot_Anakronoloh,0);
			   --SetTimer("Bot_AnakronolohFix",60000,1);
end
end

function Bot_AnakronolohFix()
SetPlayerPos(Bot_Anakronoloh,2573.6159667969, -121.59561157227, -4752.0068359375);
SetPlayerHealth(Bot_Anakronoloh, 1000);
SetPlayerAngle(Bot_Anakronoloh,30);
PlayAnimation(Bot_Anakronoloh,"S_CHAIR_S1");
end

function BOT_Bot_Quest1()
	local BOT_Bot_Quest1 = CreateNPC("Слепой алхимик");
	if BOT_Bot_Quest1 >= 0 then
		Bot_Quest1 = BOT_Bot_Quest1;
	SpawnPlayer(Bot_Quest1);
	SetPlayerAdditionalVisual(Bot_Quest1,"Hum_Body_Naked0",0,"Hum_Head_Pony",43);
	SetPlayerWalk(Bot_Quest1, "HumanS_Relaxed.mds");
	SetPlayerInstance(Bot_Quest1,"PC_HERO");
	SetPlayerMaxHealth(Bot_Quest1,1000);
	SetPlayerHealth(Bot_Quest1,1000);
	SetPlayerStrength(Bot_Quest1,100);
	SetPlayerPos(Bot_Quest1,47502.63671875, 4340.96875, 17198.947265625);
	SetPlayerAngle(Bot_Quest1,239);
	SetPlayerFatness(Bot_Quest1, -1);
	SetPlayerStrength(Bot_Quest1, 50);
	SetPlayerSkillWeapon(Bot_Quest1,SKILL_1H,30);
	PlayAnimation(Bot_Quest1,"T_1HSINSPECT");
	--Items:
	EquipArmor(Bot_Quest1,"ITAR_KDF_L");
	EquipMeleeWeapon(Bot_Quest1,"ItMw_1H_Nov_Mace");
	
	--Bot_Quest1_timer = SetTimer("Bot_Quest1_AI",500,1);
end
end

function BOT_Bot_Quest2()
	local BOT_Bot_Quest2 = CreateNPC("Отшельник");
	if BOT_Bot_Quest2 >= 0 then
		Bot_Quest2 = BOT_Bot_Quest2;
	SpawnPlayer(Bot_Quest2);
	SetPlayerAdditionalVisual(Bot_Quest2,"Hum_Body_Naked0",0,"Hum_Head_Pony",43);
	SetPlayerWalk(Bot_Quest2, "HumanS_Relaxed.mds");
	SetPlayerInstance(Bot_Quest2,"PC_HERO");
	SetPlayerMaxHealth(Bot_Quest2,1000);
	SetPlayerHealth(Bot_Quest2,1000);
	SetPlayerStrength(Bot_Quest2,100);
	SetPlayerPos(Bot_Quest2,36555.58203125, 3889.4501953125, -2185.3725585938);
	SetPlayerAngle(Bot_Quest2,95);
	SetPlayerFatness(Bot_Quest2, -1);
	SetPlayerStrength(Bot_Quest2, 50);
	SetPlayerSkillWeapon(Bot_Quest2,SKILL_1H,30);
	PlayAnimation(Bot_Quest2,"S_LGUARD");
	--Items:
	EquipArmor(Bot_Quest2,"ITAR_DRU_H");
	EquipMeleeWeapon(Bot_Quest2,"ItMw_1H_Nov_Mace");
	
	--Bot_Quest2_timer = SetTimer("Bot_Quest2_AI",500,1);
end
end



function CreateGlobalView()
	AFK_Draw = CreateDraw(800,4000,"Игрок AFK","Font_Old_20_White_Hi.TGA",255,255,255);
	g_draw = CreateDraw(2700,6500,"Нажми F11 чтобы открыть меню","Font_Old_10_White_Hi.TGA",255,100,0);
	g_texture = CreateTexture(2500,6300,5800,7000,"DLG_CONVERSATION.TGA");
end

function OnPlayerFocus(playerid, focusid)

	if focusid == Mob_Kuznec or focusid == Bot_Trader or focusid == Bot_Hunter or focusid == Bot_Alchemy or focusid == Bot_Reseller or focusid == Bot_Tanis or focusid == Bot_Quest1 or focusid == Bot_Quest2 or focusid == Bot_Vor or focusid == Bot_Povar or focusid == Bot_Traktir or focusid == Bot_Citizen or focusid == Bot_Citizen2 or focusid == Bot_Citizen3 or focusid == Bot_Citizen4 or focusid == Bot_Citizen5 or focusid == Bot_Citizen6 or focusid == Bot_Citizen7 then
		ShowTexture(playerid,g_texture);
		ShowDraw(playerid,g_draw);
	
	elseif focusid == Bot_Guard or focusid == Bot_Guard2 or focusid == Bot_Guard3 or focusid == Bot_Guard4 then
	HasItem(playerid,"ITWR_PASSIERSCHEIN",227);
	
	elseif focusid >= 0 and Player[focusid].AFK == true then
        ShowDraw(playerid,AFK_Draw)
     else -- (focusid == -1)
		HideDraw(playerid,g_draw);
		HideTexture(playerid,g_texture);
		
		HideDraw(playerid,g_draw);
		HideTexture(playerid,g_texture);
		
        HideDraw(playerid,AFK_Draw);
	end
end

function CMD_INVIS(playerid)
SetPlayerAdditionalVisual(playerid,-1,-1,44);
end

function CMD_VIS(playerid,params)
                local result, skin1, skin2, skin3, skin4 = sscanf(params,"dddd");
                if result == 1
                then
                        local pol;
                        local mg;
                        if skin1 == 1
                        then
                                pol = "Hum_Body_Naked0";
                        elseif skin1 == 2
                        then
                                pol = "Hum_Body_Babe0";
                        else
                                SendPlayerMessage(playerid,255,255,0,"Неверный пол(1 мужчина, 2 - женщина)");
                        end
                        if skin3 == 1
                        then
                                mg = "Hum_Head_FatBald";
                        elseif skin3 == 2
                        then
                                mg = "Hum_Head_Fighter";
                        elseif skin3 == 3
                        then
                                mg = "Hum_Head_Pony";
                        elseif skin3 == 4
                        then
                                mg = "Hum_Head_Bald";
                        elseif skin3 == 5
                        then
                                mg = "Hum_Head_Thief";
                        elseif skin3 == 6
                        then
                                mg = "Hum_Head_Psionic";
                        elseif skin3 == 7
                        then
                                mg = "Hum_Head_Babe";
                        else
                                SendPlayerMessage(playerid,255,255,0,"Неверный номер(1-7)");
                        end
                        SendPlayerMessage(playerid,255,255,0,"Ты сменил скин");
                        SetPlayerAdditionalVisual(playerid,pol,skin2,mg,skin4);
                else
                                SendPlayerMessage(playerid,255,255,0,"Введите /скин (пол) (текстура тела) (модель головы) (текстура головы)");
                                SendPlayerMessage(playerid,255,255,0,"Пол - 1 мужчина, 2 - женщина");
                                SendPlayerMessage(playerid,255,255,0,"Модель головы от 1 до 7");
                end
end

function UnMute(playerid)
Player[playerid].Mute = false;
end

function CMD_FIXNICK(playerid, params)
local result, id = sscanf(params,"d");
if result == 1 then
EnablePlayerNickname(id,1);
		else 
			SendPlayerMessage(playerid,255,0,0,"Используй: /никнейм (ID игрока)");
end
end

function CMD_FIXNICK2(playerid)
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 444 or Player[playerid].admin == 222 then
		for i = 0, MAX_PLAYERS - 1 do
		if IsNPC(playerid) == 0 and Player[playerid].loggedIn == 1 and Player[playerid].invis == false then
		EnablePlayerNickname(playerid,1);
		elseif IsNPC(playerid) == 0 and Player[playerid].loggedIn == 1 and Player[playerid].invis == true then
		EnablePlayerNickname(playerid,0);
		end
		SendPlayerMessage(playerid,0,255,0,"Никнеймы обновлены!");
		end
	else
	SendPlayerMessage(playerid,255,0,0,"Вы не админ!");
	end
end

function CMD_ZMIENHASLO(playerid, params)
local result, oldpw, newpw = sscanf(params,"ss");
	if result == 1 then
		if oldpw == Player[playerid].password then
				Player[playerid].password = newpw;
				SaveAccount(playerid);
				SendPlayerMessage(playerid,0,255,60,"Пароль сменен!");
			else 
				SendPlayerMessage(playerid,255,0,0,"Неправильный пароль!");
				
			end
		else 
			SendPlayerMessage(playerid,255,0,0,"Используй: /сменитьпароль (старый пароль) (новый пароль)");
		end
end

--[[function OnPlayerUseItem(playerid, item_instance, amount)
 
     if item_instance ~= "NULL" then
 
         local message = string.format("%s %s %s %d","I'm using item: Item instance:",item_instance,"amount:",amount);
         SendPlayerMessage(playerid,0,255,0,message);
     else
 
         SendPlayerMessage(playerid,255,255,0,"I have finished using item.");
     end
end]]

local PoleTimer = 15000

function OnPlayerUseItem(playerid, item_instance, amount)
     if item_instance == "ITMI_RAKE" then
	 if Player[playerid].class == 23 or Player[playerid].class == 24 then
	 local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, 12011.209960938, 1508.7928466797, -11656.076171875) <= 1000 or GetDistance3D(p_x, p_y, p_z, 11328.213867188, 1495.1145019531, -11227.301757813) <= 1000 or GetDistance3D(p_x, p_y, p_z, 10973.962890625, 1499.5594482422, -14290.72265625) <= 1000 or GetDistance3D(p_x, p_y, p_z, 10089.809570313, 1413.5454101563, -13619.758789063) <= 1000 or GetDistance3D(p_x, p_y, p_z, 13768.4921875, 1824.5325927734, -17501.48046875) <= 1000 or GetDistance3D(p_x, p_y, p_z, 28953.349609375, 3262.5239257813, 7785.9858398438) <= 1000 or GetDistance3D(p_x, p_y, p_z, 28997.587890625, 3221.0576171875, 8915.0029296875) <= 1000 or GetDistance3D(p_x, p_y, p_z, 59297.53515625, 2152.3657226563, -5245.0834960938) <= 1000 or GetDistance3D(p_x, p_y, p_z, 57677.87109375, 2047.1789550781, -5613.9638671875) <= 1000 or GetDistance3D(p_x, p_y, p_z, 57436.2890625, 2041.2838134766, -6320.11328125) <= 1000 then
	 if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("WorkPole", PoleTimer, 0, playerid)
	Player[playerid].timer = false
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Начал работу"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	  else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не на поле"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	 GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не умеете собирать урожай"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	 end
	 elseif item_instance == "ITMI_SCDOP" then
	 if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("WorkYxa", 20000, 0, playerid)
	Player[playerid].timer = false
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Начал варить уху"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 
	  elseif item_instance == "ITMI_SSW" then
	 if Player[playerid].timer == true then
	Player[playerid].saw = SetTimerEx("WorkSaw", 20000, 0, playerid)
	Player[playerid].timer = false
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Начал пилить"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 
elseif item_instance == "ITMI_ADDON_SHELL_01" then
	 if Player[playerid].timer == true then
	Player[playerid].saw = SetTimerEx("WorkUstr", 1000, 0, playerid)
	Player[playerid].timer = false
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Открываю"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Открываю"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 
elseif item_instance == "ITMW_2H_AXE_L_01" then
	 if Player[playerid].class == 21 or Player[playerid].class == 1 then
		if Player[playerid].timer == true then
	Player[playerid].saw = SetTimerEx("WorkRuda", 25000, 0, playerid)
	Player[playerid].timer = false
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Начал добывать руду"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
		else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
	else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не рудокоп"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	end

if item_instance == "ITRU_LIGHTHEAL" then
for i = 0, MAX_PLAYERS - 1 do
			if GetDistancePlayers(playerid,i) < 1000 then
				GameTextForPlayer(playerid,3000,3000,string.format("%s","Исцеление окружающих!"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
				SetPlayerHealth(i, GetPlayerHealth(i) + 100);
			end
		end
		
elseif item_instance == "ITRU_MEDIUMHEAL" then
			if GetDistancePlayers(playerid,i) < 1000 then 
				GameTextForPlayer(playerid,3000,3000,string.format("%s","Исцеление окружающих!"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
				SetPlayerHealth(i, GetPlayerHealth(i) + 150);
			end
end
		
	  elseif item_instance == "ITMI_BDOOM" then
	 if Player[playerid].timer == true then
	Player[playerid].metla = SetTimerEx("WorkMetla", 20000, 0, playerid)
	Player[playerid].timer = false
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Начал подметать"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 
	 end
	 
	local c_item_subclass=string.sub(item_instance,1,4);
	
	--print(c_item_subclass);
	if c_item_subclass=="ITFO" or c_item_subclass=="ITPL" then
		for i=0, MAX_FD-1 do
			if string.upper(FD[i].instance)==item_instance then
					if FD[i].food==1 then
						Player[playerid].hunger=0;
					end
					if FD[i].drink==1 then
						Player[playerid].thirst=0;
					end
				HT_Check(playerid);
			end
		end
	elseif c_item_subclass=="ITPO" then
		Player[playerid].thirst=0;
		HT_Check(playerid);
		GiveItem(playerid,"ITMI_FLASK",1);
	end
	
end


--[[function OnPlayerWeaponMode(playerid, weaponmode)
if IsNPC(playerid) == 0 then
		if Player[playerid].class == 0 then
			if weaponmode ~= WEAPON_NONE then
				SendPlayerMessage(playerid, 255, 0, 0, "Ты слишком слаб, чтобы поднять это.")
				SetPlayerWeaponMode(playerid, WEAPON_NONE)
			end
		else
			local h1, h2, bow, cbow = GetPlayerSkillWeapon(playerid, 0), GetPlayerSkillWeapon(playerid, 1), GetPlayerSkillWeapon(playerid, 2), GetPlayerSkillWeapon(playerid, 3);
		if weaponmode == WEAPON_NONE then
				SetPlayerWalk(playerid, Player[playerid].Overlay); -- или "NULL" для стандарта
		elseif weaponmode == WEAPON_1H then
		Player[playerid].Overlay = GetPlayerWalk(playerid)
		if h1 >= 30 and h1 < 60 then -- 30 = новичок // 60 = мастер
			SetPlayerWalk(playerid, "Humans_1hST1.mds");
		elseif h1 >= 60 then
			SetPlayerWalk(playerid, "Humans_1hST2.mds");
		end
	elseif weaponmode == WEAPON_2H then
	Player[playerid].Overlay = GetPlayerWalk(playerid)
		if h2 >= 30 and h2 < 60 then 
			SetPlayerWalk(playerid, "Humans_2hST1.mds");
		elseif h2 >= 60 then
			SetPlayerWalk(playerid, "Humans_2hST2.mds");
		end
	elseif weaponmode == WEAPON_BOW then
	Player[playerid].Overlay = GetPlayerWalk(playerid)
		if bow >= 30 and bow < 60 then 
			SetPlayerWalk(playerid, "Humans_BowT1.mds");
		elseif bow >= 60 then
			SetPlayerWalk(playerid, "Humans_BowT2.mds");
		end
	elseif weaponmode == WEAPON_CBOW then
	Player[playerid].Overlay = GetPlayerWalk(playerid)
		if bow >= 30 and bow < 60 then 
			SetPlayerWalk(playerid, "Humans_CBowT1.mds");
		elseif bow >= 60 then
			SetPlayerWalk(playerid, "Humans_CBowT2.mds");
		end
	end
		end
	end
end
]]

function OnPlayerWeaponMode(playerid, weaponmode)
if IsNPC(playerid) == 0 then
		if Player[playerid].class == 0 then
			if weaponmode ~= WEAPON_NONE then
				SendPlayerMessage(playerid, 255, 0, 0, "Ты слишком слаб, чтобы поднять это.")
				SetPlayerWeaponMode(playerid, WEAPON_NONE)
			end
		else
			local h1, h2, bow, cbow = GetPlayerSkillWeapon(playerid, 0), GetPlayerSkillWeapon(playerid, 1), GetPlayerSkillWeapon(playerid, 2), GetPlayerSkillWeapon(playerid, 3);
		if weaponmode == WEAPON_BOW then
	Player[playerid].Overlay = GetPlayerWalk(playerid)
		if bow >= 30 and bow < 60 then 
			GiveItem(playerid,"ITRW_ARROW",1);
		elseif bow >= 60 then
			GiveItem(playerid,"ITRW_ARROW",1);
		elseif bow < 30 then
			GiveItem(playerid,"ITRW_ARROW",1);
		end
	elseif weaponmode == WEAPON_CBOW then
	Player[playerid].Overlay = GetPlayerWalk(playerid)
		if bow >= 30 and bow < 60 then 
	GiveItem(playerid,"ITRW_BOLT",1);
		elseif bow >= 60 then
	GiveItem(playerid,"ITRW_BOLT",1);
		elseif bow < 30 then
	GiveItem(playerid,"ITRW_BOLT",1);
		end
	end
		end
	end
end

--[[function WorkSaw(playerid)
	if Player[playerid].timer == false then
	Player[playerid].saw = SetTimerEx("GiveSaw", 1000, 0, playerid)
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 20);
    else
     end
end

function GiveSaw(playerid)
print("7")
	Player[playerid].bank = Player[playerid].bank + 2
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Медные монеты получены (+2)"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
	Player[playerid].timer = true
end]]

--[[function WorkMetla(playerid)
	if Player[playerid].timer == false then
	Player[playerid].metla = SetTimerEx("GiveMetla", 1000, 0, playerid)
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 20);
    else
     end
end

function GiveMetla(playerid)
	Player[playerid].bank = Player[playerid].bank + 2
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Медные монеты получены (+2)"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
	Player[playerid].timer = true
end]]

function WorkRuda(playerid) --колотушка)0))0)
local Ruda = random(12);
	if Ruda == 0 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Один кусок магической руды!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMINUGGET",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif Ruda == 1 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Один кусок магической руды!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMINUGGET",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif Ruda == 2 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Мимо жилы! Потратил силу на размах!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif Ruda == 3 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Мимо жилы! Потратил силу на размах!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
	elseif Ruda == 4 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Один кусок руды!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMI_IRON",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif Ruda == 5 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Мимо жилы! Потратил силу на размах!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
	elseif Ruda == 6 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Два куска магической руды!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
		GiveItem(playerid,"ITMINUGGET",2);
	elseif Ruda == 7 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Кусок угля!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		
	elseif Ruda == 8 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Один кусок магической руды!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMINUGGET",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif Ruda == 9 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Кусок угля!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMI_COAL",3);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif Ruda == 10 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Мимо жилы! Потратил силу на размах!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
	elseif Ruda == 11 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Мимо жилы! Потратил силу на размах!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
	end
Player[playerid].timer = true
end

function WorkUstr(playerid)
local SHELL = random(10);
	if SHELL == 0 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 1 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 2 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 3 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 4 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 5 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Жемчужина!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_whitepearl",1);
	elseif SHELL == 6 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 7 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 8 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 9 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего полезного"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
	elseif SHELL == 10 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вас укусил рак"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"itmi_addon_shellflesh",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
	end
	Player[playerid].timer = true
end
	
function WorkPole(playerid)
local POLE = random(4);
	if POLE == 0 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Сорняк"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITPL_WEED",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif POLE == 1 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Сорняк"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITPL_WEED",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif POLE == 2 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Получена пшеница"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMI_WHEAT",1);
		--GiveItem(playerid,"ITMI_WHEAT",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif POLE == 3 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Сорняк"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITPL_WEED",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif POLE == 4 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Получена пшеница"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITMI_WHEAT",1);
		--GiveItem(playerid,"ITMI_WHEAT",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	end
	Player[playerid].timer = true
end

function WorkYxa(playerid)
	RemoveItem(playerid,"ITFO_FISH",1);
	GiveItem(playerid,"ITMI_WHEAT",1);
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 3);
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Уха сварилась"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		--\\\\\\\\
		local oldValue;
local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
if file then
for line in file:lines() do 
		local result, item, value = sscanf(line,"sd");
		if result == 1 then
			if string.upper(item) == item_instance then
				oldValue = value;
			end
		end
	end
	file:close();
end
	
	if oldValue == nil then
		oldValue = 0;
	end
	
	local newValue = oldValue - amount;
	if newValue < 0 then
		newValue = 0;
	end
	
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
	local tempString = file:read("*a");
	file:close();
	local tempString = string.gsub(tempString,string.upper(item_instance).." "..oldValue,string.upper(item_instance).." "..newValue);
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","w+");
	file:write(tempString);
	file:close();
	Player[playerid].timer = true
end

local WaterTimer = 10000

function WorkWater(playerid)
if Player[playerid].class == 1 then
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, -28752.970703125, -4637.0942382813, 8316.7109375, 140) <= 1000 or GetDistance3D(p_x, p_y, p_z, -29119.95703125, -4626.0141601563, 7884.669921875, 215) <= 700 then
		if Player[playerid].timer == true then
			Player[playerid].pole = SetTimerEx("GiveWater", WaterTimer, 0, playerid)
			Player[playerid].timer = false
			SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
			PlayAnimation(playerid,"T_1HSINSPECT");
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Набираю воду"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
		else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
	elseif  GetDistance3D(p_x, p_y, p_z, 47684.6484375, 1352.5126953125, -12479.811523438, 142) <= 700 or GetDistance3D(p_x, p_y, p_z, 31013.4921875, 3932.8500976563, -23118.333984375, 142) <= 700 then
		if Player[playerid].timer == true then
			Player[playerid].pole = SetTimerEx("GiveWater", WaterTimer, 0, playerid)
			Player[playerid].timer = false
			SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
			PlayAnimation(playerid,"T_1HSINSPECT");
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Набираю воду"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
		else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
	elseif  GetDistance3D(p_x, p_y, p_z, 42259.8046875, 2805.1303710938, -27036.634765625, 187) <= 700 then
		if Player[playerid].timer == true then
			Player[playerid].pole = SetTimerEx("GiveWater", WaterTimer, 0, playerid)
			Player[playerid].timer = false
			SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
			PlayAnimation(playerid,"T_1HSINSPECT");
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Набираю воду"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
		else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
	elseif  GetDistance3D(p_x, p_y, p_z, 40691.90625, 2805.2897949219, -26711.939453125, 192) <= 700 then
		if Player[playerid].timer == true then
			Player[playerid].pole = SetTimerEx("GiveWater", WaterTimer, 0, playerid)
			Player[playerid].timer = false
			SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
			PlayAnimation(playerid,"T_1HSINSPECT");
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Набираю воду"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
		else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
	else 
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не у водоема"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	end
	else
GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не можете собирать ресурсы, найдите рабочего"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	end
end

function GiveWater(playerid)
	GiveItem(playerid,"ITFO_WATER",1);
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Набрал полную бутылку воды"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
	Player[playerid].timer = true
end

local WinoTimer = 10000

function WorkWino(playerid)
if Player[playerid].class == 6 or Player[playerid].class == 7 then
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if  GetDistance3D(p_x, p_y, p_z, 48151.20703125, 4990.96484375, 18434.30859375, 192) <= 700 then
		if Player[playerid].timer == true then
			Player[playerid].pole = SetTimerEx("GiveWino", WinoTimer, 0, playerid)
			Player[playerid].timer = false
			SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
			PlayAnimation(playerid,"T_1HSINSPECT");
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Срезаю виноградную лозу"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
		else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
		end
	else 
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не у виноградника"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	end
else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не послушник"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	end
end

function GiveWino(playerid)
	local Wino = random(5);
	if Wino == 0 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Срезал виноградную лозу!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItMi_Vinograd",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif Wino == 1 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Срезал виноградную лозу!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItMi_Vinograd",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif Wino == 2 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Недозревший виноград!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif Wino == 3 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Тухлый виноград!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 10);
	elseif Wino == 4 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Недозревший виноград!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif Wino == 5 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Недозревший виноград!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	end
Player[playerid].timer = true
end

local DrevTimer = 5000

function WorkGrib(playerid)
if Player[playerid].class == 1 then
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, 17638.771484375, 2612.3317871094, -8389.82421875, 103) <= 250 or GetDistance3D(p_x, p_y, p_z, 17965.07421875, 2465.9838867188, -7445.4995117188, 135) <= 250 or GetDistance3D(p_x, p_y, p_z, 17651.1640625, 2477.087890625, -6814.1796875, 7) <= 250 or GetDistance3D(p_x, p_y, p_z, 19520.517578125, 1873.5262451172, -7149.5444335938, 357) <= 250 or GetDistance3D(p_x, p_y, p_z, 19944.04296875, 1774.1015625, -6961.123046875, 149) <= 250 or GetDistance3D(p_x, p_y, p_z, 17762.69140625, -4964.0234375, 8762.1708984375, 339) <= 250 or GetDistance3D(p_x, p_y, p_z, 17988.6953125, -4965.9575195313, 9039.48828125, 230) <= 250 or GetDistance3D(p_x, p_y, p_z, 18430.5859375, -4966.5493164063, 9339.9111328125, 332) <= 250 or GetDistance3D(p_x, p_y, p_z, 18084.87890625, -4965.5981445313, 9711.681640625, 78) <= 250 or GetDistance3D(p_x, p_y, p_z, 18033.578125, -4966.6572265625, 10012.370117188, 143) <= 250 or GetDistance3D(p_x, p_y, p_z, 29800.8046875, 2240.2307128906, 13943.14453125, 143) <= 250 or GetDistance3D(p_x, p_y, p_z, 29269.607421875, 2203.1999511719, 13795.086914063, 143) <= 250 or GetDistance3D(p_x, p_y, p_z, 28934.58984375, 2182.4655761719, 14239.67578125, 143) <= 250 then
	if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("GiveGrib", DrevTimer, 0, playerid)
	Player[playerid].timer = false
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	PlayAnimation(playerid,"T_PLUNDER");
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Ищу грибы"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Поблизости нет съедобных грибов"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
else
GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не можете собирать ресурсы, найдите рабочего"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
end
end

function GiveGrib(playerid) --грибник, епта
local JakaGrib = random(5);
	if JakaGrib == 0 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли темный гриб!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItPl_Mushroom_01",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif JakaGrib == 1 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли темный гриб!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItPl_Mushroom_01",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif JakaGrib == 2 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли мясной гриб!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItPl_Mushroom_02",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaGrib == 3 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли темный гриб!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItPl_Mushroom_01",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaGrib == 4 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли мясной гриб!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItPl_Mushroom_02",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaGrib == 5 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли темный гриб!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ItPl_Mushroom_01",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	end
Player[playerid].timer = true
end

function WorkHmel(playerid)
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, -2261.7993164063, 788.734375, 282.27600097656, 31) <= 250 or GetDistance3D(p_x, p_y, p_z, -1969.7135009766, 773.55456542969, 116.68381500244, 358) <= 250 or GetDistance3D(p_x, p_y, p_z, -1455.236328125, 936.66754150391, 250.74859619141, 336) <= 250 or GetDistance3D(p_x, p_y, p_z, -1118.2139892578, 1090.2229003906, 583.60137939453, 24) <= 250 or GetDistance3D(p_x, p_y, p_z, -833.51843261719, 979.60260009766, 551.18719482422, 0) <= 250 or GetDistance3D(p_x, p_y, p_z, -2338.6772460938, 1893.5526123047, 2893.4396972656, 318) <= 250 or GetDistance3D(p_x, p_y, p_z, -2697.8247070313, 1759.2668457031, 2538.55078125, 300) <= 250 or GetDistance3D(p_x, p_y, p_z, -3105.3542480469, 1643.1895751953, 2442.9248046875, 309) <= 250 or GetDistance3D(p_x, p_y, p_z, -3131.4411621094, 1550.3481445313, 2110.330078125, 300) <= 250 or GetDistance3D(p_x, p_y, p_z, -3394.5300292969, 1461.4840087891, 1852.1384277344, 343) <= 250 or GetDistance3D(p_x, p_y, p_z, -3933.5185546875, 1372.5, 1726.4057617188, 349) <= 250 or GetDistance3D(p_x, p_y, p_z, -4312.484375, 1365.0314941406, 1627.4562988281, 340) <= 250 then
	if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("GiveHmel", DrevTimer, 0, playerid)
	Player[playerid].timer = false
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	PlayAnimation(playerid,"T_PLUNDER");
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Ищу хмель"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не рядом с вьющимся хмелем"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
end

function GiveHmel(playerid)
	GiveItem(playerid,"ItMi_Hop",1);
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы нашли хмель!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
	Player[playerid].timer = true
end

local TravTimer = 10000

function WorkTrav(playerid)
if Player[playerid].class == 6 or Player[playerid].class == 7 or Player[playerid].class == 8 or Player[playerid].class == 9 then
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, 14785.431640625, 1802.4124755859, -12390.252929688, 165) <= 250 or GetDistance3D(p_x, p_y, p_z, 14801.477539063, 1868.822265625, -11441.015625, 46) <= 250 or GetDistance3D(p_x, p_y, p_z, 15277.234375, 1946.5079345703, -11802.34765625, 358) <= 250 or GetDistance3D(p_x, p_y, p_z, 16620.990234375, 2028.1566162109, -12689.205078125, 125) <= 250 or GetDistance3D(p_x, p_y, p_z, 17095.236328125, 2072.591796875, -13036.1640625, 358) <= 250 or GetDistance3D(p_x, p_y, p_z, 16606.240234375, 2059.5378417969, -13569.916992188, 336) <= 250 or GetDistance3D(p_x, p_y, p_z, 17519.927734375, 2584.1108398438, -9986.244140625, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 31008.2265625, 3248.5900878906, 11021.103515625, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 30875.505859375, 3023.2534179688, 11689.149414063, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 30375.3359375, 3151.50390625, 11558.711914063, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 30967.42578125, 2699.8505859375, 12942.631835938, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 30404.89453125, 2529.2526855469, 13412.580078125, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 30108.748046875, 2464.0610351563, 12906.359375, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 29969.76953125, 2438.2258300781, 13189.803710938, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 29450.3203125, 2450.3913574219, 12923.967773438, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 29241.53515625, 2527.8984375, 12190.9140625, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 58784.625, 6863.2094726563, 29972.83984375, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 59520.28515625, 6884.6513671875, 29769.59375, 278) <= 250 or GetDistance3D(p_x, p_y, p_z, 59595.984375, 6794.5708007813, 30308.259765625, 278) <= 250 then
	if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("GiveTrav", DrevTimer, 0, playerid)
	Player[playerid].timer = false
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	PlayAnimation(playerid,"T_PLUNDER");
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Ищу траву"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Поблизости нет кустарников!"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
else
GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не разбираетесь в травах"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
	 end
end

function GiveTrav(playerid)
	local num = random(9);
 if num == 0 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли лечебное растение!");
 GiveItem(playerid,"ItPl_Health_Herb_01",1);
 elseif num == 1 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли лечебное растение!");
 GiveItem(playerid,"ItPl_Health_Herb_01",1);
 elseif num == 2 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли огненную крапиву!");
 GiveItem(playerid,"ItPl_Mana_Herb_01",1);
 elseif num == 3 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли огненную траву!");
 GiveItem(playerid,"ItPl_Mana_Herb_02",1);
 elseif num == 4 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли огненный корень!");
 GiveItem(playerid,"ItPl_Mana_Herb_03",1);
 elseif num == 5 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли лечебное растение!");
 GiveItem(playerid,"ItPl_Health_Herb_01",1);
 elseif num == 6 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли лечебную траву!");
 GiveItem(playerid,"ItPl_Health_Herb_02",1);
 elseif num == 7 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли лечебный корень!");
 GiveItem(playerid,"ItPl_Health_Herb_03",1);
 elseif num == 8 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли лечебный корень!");
 GiveItem(playerid,"ItPl_Health_Herb_03",1);
 elseif num == 9 then
 SendPlayerMessage(playerid,0,250,0,"Вы нашли хмель!");
 GiveItem(playerid,"ItMi_Hop",1);
 end
 Player[playerid].timer = true;
end

local AppleTimer = 10000

function WorkApple(playerid)
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, 3857.6096191406, -1311.7149658203, -9059.693359375, 255) <= 250 or GetDistance3D(p_x, p_y, p_z, 3812.8659667969, -1315.7487792969, -9034.0458984375, 196
) <= 250 or GetDistance3D(p_x, p_y, p_z, 4392.2270507813, -1293.8526611328, -8804.4306640625, 179) <= 250 or GetDistance3D(p_x, p_y, p_z, 4478.400390625, -1255.0573730469, -8257.1396484375, 84) <= 250
    or GetDistance3D(p_x, p_y, p_z, 3907.9895019531, -1324.8225097656, -8325.95703125, 206) <= 250 or GetDistance3D(p_x, p_y, p_z, 4209.330078125, -1297.9757080078, -7605.6469726563, 122) 
	<= 250 or GetDistance3D(p_x, p_y, p_z, 3791.1687011719, -1312.9166259766, -7248.5327148438, 19) <= 250 or GetDistance3D(p_x, p_y, p_z, 3695.6496582031, -1330.5251464844, -7708.55078125, 237) <= 250
    or GetDistance3D(p_x, p_y, p_z, 4130.4868164063, -1291.0695800781, -8061.3168945313, 175) <= 250 or GetDistance3D(p_x, p_y, p_z, -30022.8125, -892.09271240234, 15298.268554688, 59) 
	<= 250 or GetDistance3D(p_x, p_y, p_z, -30516.884765625, -896.228515625, 15081.607421875, 204) <= 250 or GetDistance3D(p_x, p_y, p_z, -30577.025390625, -943.32867431641, 15681.3671875, 131) <= 250
    or GetDistance3D(p_x, p_y, p_z, -31244.728515625, -954.72784423828, 15623.142578125, 115) <= 250 or GetDistance3D(p_x, p_y, p_z, -31775.279296875, -990.62628173828, 15789.455078125, 338) <= 250
    or GetDistance3D(p_x, p_y, p_z, -31766.859375, -956.60369873047, 15278.294921875, 175) <= 250 or GetDistance3D(p_x, p_y, p_z, -31118.0234375, -944.00128173828, 14863.197265625, 300) <= 250 then
	if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("GiveApple", DrevTimer, 0, playerid)
	Player[playerid].timer = false
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	PlayAnimation(playerid,"T_PLUNDER");
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Ищу яблоки"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не в яблочной роще"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
end

function GiveApple(playerid)
	GiveItem(playerid,"ITFO_APPLE",1);
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Нашел яблоко"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
	Player[playerid].timer = true
end

local SwampTimer = 10000

function WorkSwamp(playerid)
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, 23776.826171875, -5062.8271484375, -916.35137939453, 172) <= 1200 then
	if Player[playerid].timer == true then
	Player[playerid].pole = SetTimerEx("GiveSwamp", DrevTimer, 0, playerid)
	Player[playerid].timer = false
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	PlayAnimation(playerid,"T_PLUNDER");
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Собираю болотник"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не на поле с болотником"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
end

function GiveSwamp(playerid)
	GiveItem(playerid,"ItPl_SwampHerb",1);
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Добыл болотник"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
	Player[playerid].timer = true
end

local FishTimer = 10000

function WorkFish(playerid)
local p_x, p_y, p_z = GetPlayerPos(playerid);
	if GetDistance3D(p_x, p_y, p_z, -1199.5653076172, -750.26745605469, 364.64443969727, 255) <= 1000 or GetDistance3D(p_x, p_y, p_z, -38580.953125, -2029.0179443359, 17584.01953125, 255
) <= 600 then
	if Player[playerid].timer == true then
	Player[playerid].fish = SetTimerEx("GiveFi", FishTimer, 0, playerid)
	Player[playerid].timer = false
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	PlayAnimation(playerid,"T_WATCHFIGHT_YEAH");
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Закинул сеть в воду"),"Font_Old_20_White_Hi.TGA",0,255,0,1000);
    else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Слишком рано"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
	 else
	GameTextForPlayer(playerid,3000,3000,string.format("%s","Вы не у берега"),"Font_Old_20_White_Hi.TGA",0,255,0,2000);
     end
end

function GiveFi(playerid) --рыбалка
local JakaRyba = random(12);
	if JakaRyba == 0 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif JakaRyba == 1 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2); --минус 2 хп
	elseif JakaRyba == 2 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 3 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего не поймал!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 4 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего не поймал!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 5 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего не поймал!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 6 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Устрица!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
		GiveItem(playerid,"itmi_addon_shell_01",1);
	elseif JakaRyba == 7 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего не поймал!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 8 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 9 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 10 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 11 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Рыба поймана!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		GiveItem(playerid,"ITFO_FISH",1);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	elseif JakaRyba == 12 then
		GameTextForPlayer(playerid,3000,3000,string.format("%s","Ничего не поймал!"),"Font_Old_20_White_Hi.TGA",0,255,0,2100);
		SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 2);
	end
Player[playerid].timer = true
end

function CMD_ALCHEMY(playerid)
if Player[playerid].AlchemyMenu == nil then
   Player[playerid].AlchemyMenu = 1;

   if Player[playerid].selectedOptionAl == nil then -- otherwise your selected option will be overwritten everytime you press F3
        Player[playerid].selectedOptionAl = 0;
   end

   ShowAlchemynList(playerid);
                else
                        Player[playerid].AlchemyMenu = nil;
                        HideAlchemyList(playerid);
                end
Player[playerid].timer = true
end

function CMD_RUNECRAFT(playerid)
if Player[playerid].RuneMenu == nil then
   Player[playerid].RuneMenu = 1;

   if Player[playerid].selectedOptionRune == nil then -- otherwise your selected option will be overwritten everytime you press F3
        Player[playerid].selectedOptionRune = 0;
   end

   ShowRuneList(playerid);
                else
                        Player[playerid].RuneMenu = nil;
                        HideRuneList(playerid);
                end
Player[playerid].timer = true
end

function CMD_KUZNEC(playerid)
 if Player[playerid].KuznicaMenu == nil then
   Player[playerid].KuznicaMenu = 1;

   if Player[playerid].selectedOptionKuz == nil then -- otherwise your selected option will be overwritten everytime you press F3
        Player[playerid].selectedOptionKuz = 0;
   end

   ShowKuznicaList(playerid);
                else
                        Player[playerid].KuznicaMenu = nil;
                        HideKuznicaList(playerid);
						end
end

function CMD_METLA(playerid)
Player[playerid].bank = Player[playerid].bank + 1
SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 1);
SendPlayerMessage(playerid,0,255,0,"За уборку вы получили 1 медную монету");
Player[playerid].timer = true
end

function CMD_Rake(playerid) -- (\/)_(O-o)_(\/)
local p_x, p_y, p_z = GetPlayerPos(playerid);
SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 1);
if GetDistance3D(p_x, p_y, p_z, 45460, -3816, -18275) <= 1200 or GetDistance3D(p_x, p_y, p_z, 55966, -3816, -18275) <= 1200 or GetDistance3D(p_x, p_y, p_z, 51386, -3708, -25361) <= 1200 then
GiveItem(playerid,"ITPL_SWAMPHERB",1);
SendPlayerMessage(playerid,0,255,0,"Вы добыли болотную траву.");
elseif GetDistance3D(p_x, p_y, p_z, -45734, 1620, 10334) <= 1200 or GetDistance3D(p_x, p_y, p_z, 10458.1006, 1284.01416, -13808.667) <= 1200 or GetDistance3D(p_x, p_y, p_z, 13680.918, 1820.05945, -17499.8906) <= 1200 or GetDistance3D(p_x, p_y, p_z, 28813.6211, 3156.2522, 8419.47949) <= 1200 or GetDistance3D(p_x, p_y, p_z, 32748.0391, 3694.68188, 6753.10352) <= 1200 or GetDistance3D(p_x, p_y, p_z, 50918.0859, 3115.59741, -22748.293) <= 1200 or GetDistance3D(p_x, p_y, p_z, 58207.6211, 1857.11414, -16255.0156) <= 3800 or GetDistance3D(p_x, p_y, p_z, 64178.3086, 2527.12158, -15836.1631) <= 3800 or GetDistance3D(p_x, p_y, p_z, 64246.3125, 2496.0542, -7470.03125) <= 3800 or GetDistance3D(p_x, p_y, p_z, 58346.8438, 2123.09863, -7769.71338) <= 3800 then
Player[playerid].bank = Player[playerid].bank + 1
SetPlayerHealth(playerid, GetPlayerHealth(playerid) - 1);
SendPlayerMessage(playerid,0,255,0,"Вы заработали 1 медную монету, собрав урожай");
end
Player[playerid].timer = true
end

function CMD_Wine(playerid) -- (\/)_(O-o)_(\/)
if Player[playerid].timer == false then
GiveItem(playerid,"ITFO_WINE",1);
SendPlayerMessage(playerid,0,255,0,"Вы выдавили вина, которого хватит на одну бутылку.");
Player[playerid].timer = true
end
local p_x, p_y, p_z = GetPlayerPos(playerid);
if GetDistance3D(p_x, p_y, p_z, Player[playerid].curpos[1], Player[playerid].curpos[2], Player[playerid].curpos[3]) <= 150 then
HasItem(playerid, "ItFo_wineberrys_01", 90);
end
end

function CMD_HIDECHAT(playerid)
if Player[playerid].chat == true then
ShowChat(playerid,0);
Player[playerid].chat = false
elseif Player[playerid].chat == false then
ShowChat(playerid,1);
Player[playerid].chat = true
end
end

function CMD_EDA(playerid)
local number = random(3);
                        if number == 1 then
                                SendPlayerMessage(playerid,0,255,0,"Рис сварился");
                                GiveItem(playerid,"ItFoRice",1);
                                RemoveItem(playerid,"ITMISCOOP",1);
                        elseif number == 2 then
                                SendPlayerMessage(playerid,0,255,0,"Суп из корней сварился");
                                GiveItem(playerid,"ItFoSoup",1);
                                RemoveItem(playerid,"ITMISCOOP",1);  
						elseif number == 3 then
                                SendPlayerMessage(playerid,0,255,0,"Рагу из мясного жука готово!");
                                GiveItem(playerid,"ItFoMeatbugragout",1);
                                RemoveItem(playerid,"ITMISCOOP",1);								
                        else
                        SendPlayerMessage(playerid,255,0,0,"Ты испортил продукты");
                        RemoveItem(playerid,"ITMISCOOP",1);
                end
				Player[playerid].timer = true
end

function Remove_protected_items(params)
    local result, playerid, item_instance, amount = sscanf(params, "dsd");
	if result == 1 then
        RemoveItem(playerid, item_instance, amount);
		Player[playerid].removeawaynum = 0;
	end
end

function OnPlayerDisconnect(playerid, reason)
if IsNPC(playerid) == 0 then
deathcounter[playerid]=0;
Player[playerid].CzyHandluje = -1;
Player[playerid].CzyZatwierdzaHandel = 0;
Player[playerid].Gold = 0;
Player[playerid].propozycja = false;
Player[playerid].timer = true;
Player[playerid].chat = true;
Player[playerid].warn = 0;
Player[playerid].bank = 0;
Player[playerid].kills = 0;
Player[playerid].deaths = 0;
Player[playerid].leader = 0;
Player[playerid].inven = 0;
Player[playerid].homekey = 0;
Player[playerid].rank = 0;
Player[playerid].alchemylvl = 0;
Player[playerid].blacksmithxp = 0;
Player[playerid].blacksmithlvl = 0;
Player[playerid].runexp = 0;
Player[playerid].runelvl = 0;
Player[playerid].admin = 0;
Player[playerid].gmp1 = 0;
Player[playerid].gmp2 = 0;
Player[playerid].gmp3 = 0;
Player[playerid].hunger = 0;
Player[playerid].thirst = 0;
Player[playerid].discribe = "NULL";
Player[playerid].quest = 2;
Player[playerid].ht_able=1;
Player[playerid].logout=0;
--Craft
		Player[playerid].craft_cursor=0;
		Player[playerid].OnCraftMenu=0;
		Player[playerid].SubMenu=-1;
		Player[playerid].able_craft={};
		for i=0, 100 do
			Player[playerid].able_craft[i]=0;
		end			
--Listing
		Player[playerid].lists_count=0;
		Player[playerid].lists={};
		for i=0, 500 do
			Player[playerid].lists[i]={};
			Player[playerid].lists[i].text="NULL";
			Player[playerid].lists[i].author="NULL";
			Player[playerid].lists[i].enabled_mark=0;
			Player[playerid].lists[i].mark_untouched=0;
			Player[playerid].lists[i].d_day=0;
			Player[playerid].lists[i].d_month=0;
			Player[playerid].lists[i].d_year=0;
		end
	
--Skin_Edit
		Player[playerid].OnSkinEdit=0;	
		Player[playerid].skin_edit_timer=0;		
		Player[playerid].sedit_join=0;
		Player[playerid].sedit_cursor=0;
		Player[playerid].sedit_gender=0;
		Player[playerid].sedit_gender_texture="";
		Player[playerid].sedit_body=0;
		Player[playerid].sedit_head=0;
		Player[playerid].sedit_fatness=1;
		Player[playerid].sedit_scale=1;
		Player[playerid].sedit_head_texture="";
		Player[playerid].sedit_face=0;
	
    SetPlayerEnable_OnPlayerKey(playerid,0);
    if reason == 0 then --Самостоятельно
       SendMessageToAll(255,0,0,GetPlayerName(playerid).." вышел из игры.");
    elseif reason == 1 then --крашнуло
       SendMessageToAll(255,0,0,GetPlayerName(playerid).." потерял соединение с сервером.");
    end
		--[[if Player[playerid].ht_able==1 and Player[playerid].loggedIn==1 then
		KillTimer(htt[playerid]);
		end]]
	--[[if Chairs[playerid] ~= nil then
	Chairs[playerid]:Destroy();
	end]]
end
end

function OnPlayerKey (playerid, keydown, keyup)
local number = random(3);
	if Player[playerid].loggedIn==1 then
		
		--Description
		if keydown==KEY_V then
			local focus=GetFocus(playerid);
			if focus~=-1 then
				if Player[focus].discribe~="NULL" then
					GameTextForPlayer(playerid,3000,5000,string.format("#%s# %s ",GetPlayerName(focus), Player[focus].discribe),"Font_Old_10_White_Hi.TGA",255,255,0,5000);
				end
			end
		end
		
		--Skin Edit Menu
		if Player[playerid].OnSkinEdit==1 then
			Update_Show_Sedit_Draw(playerid);
			Skin_Edit(playerid);
			if keydown == KEY_DOWN and Player[playerid].sedit_cursor~=6 then
				Player[playerid].sedit_cursor=Player[playerid].sedit_cursor+1;
			elseif keydown == KEY_UP and Player[playerid].sedit_cursor~=0 then
				Player[playerid].sedit_cursor=Player[playerid].sedit_cursor-1;
			elseif keydown == KEY_LEFT then
				if Player[playerid].sedit_cursor==0 then
					if Player[playerid].sedit_gender==0 then
						Player[playerid].sedit_gender=1;
					else
						Player[playerid].sedit_gender=Player[playerid].sedit_gender-1;
					end
				elseif Player[playerid].sedit_cursor==1 then
					if Player[playerid].sedit_body==0 then
						Player[playerid].sedit_body=12;
					else
						Player[playerid].sedit_body=Player[playerid].sedit_body-1;
					end
				elseif Player[playerid].sedit_cursor==2 then
					if Player[playerid].sedit_head==0 then
						Player[playerid].sedit_head=14;
					else
						Player[playerid].sedit_head=Player[playerid].sedit_head-1;
					end
				elseif Player[playerid].sedit_cursor==3 then
					if Player[playerid].sedit_face==0 then
						Player[playerid].sedit_face=162;
					else
						Player[playerid].sedit_face=Player[playerid].sedit_face-1;
					end
				elseif Player[playerid].sedit_cursor==4 then
					if Player[playerid].sedit_fatness>0 then
						Player[playerid].sedit_fatness=Player[playerid].sedit_fatness-0.2;
					end
				elseif Player[playerid].sedit_cursor==5 then
					if Player[playerid].sedit_scale>0.7 then
						Player[playerid].sedit_scale=Player[playerid].sedit_scale-0.05;
					end
				end
			elseif keydown == KEY_RIGHT then
				if Player[playerid].sedit_cursor==0 then
					if Player[playerid].sedit_gender==1 then
						Player[playerid].sedit_gender=0;
					else
						Player[playerid].sedit_gender=(Player[playerid].sedit_gender+1);
					end
				elseif Player[playerid].sedit_cursor==1 then
					if Player[playerid].sedit_body==12 then
						Player[playerid].sedit_body=0;
					else
						Player[playerid].sedit_body=(Player[playerid].sedit_body+1);
					end
				elseif Player[playerid].sedit_cursor==2 then
					if Player[playerid].sedit_head==14 then
						Player[playerid].sedit_head=0;
					else
						Player[playerid].sedit_head=(Player[playerid].sedit_head+1);
					end
				elseif Player[playerid].sedit_cursor==3 then
					if Player[playerid].sedit_face==162 then
						Player[playerid].sedit_face=0;
					else
						Player[playerid].sedit_face=(Player[playerid].sedit_face+1);
					end
				elseif Player[playerid].sedit_cursor==4 then
					if Player[playerid].sedit_fatness<2.4 then
						Player[playerid].sedit_fatness=(Player[playerid].sedit_fatness+0.2);
					end
				elseif Player[playerid].sedit_cursor==5 then
					if Player[playerid].sedit_scale<1.1 then
						Player[playerid].sedit_scale=(Player[playerid].sedit_scale+0.05);
					end
				end
			elseif keydown == KEY_RETURN and Player[playerid].sedit_cursor==6 then
				--KillTimer(Player[playerid].skin_edit_timer);
				FreezePlayer(playerid,0);
				Player[playerid].OnSkinEdit=0;
				Player[playerid].sedit_cursor=0;
				DestroyAllPlayerDraws(playerid);
				HideTexture(playerid,bg);
				Chairs[playerid]:Destroy();
				PlayAnimation(playerid,"S_RUN");
				SaveAccount(playerid);
			end
		end
		
		--Craft
		
		
		if Player[playerid].OnCraftMenu==1 then
			Update_Craft_Draw(playerid);
			if Player[playerid].SubMenu==-1 then
				if keydown==KEY_DOWN then
					if Player[playerid].craft_cursor~=MAX_CRAFT_MENU-1 then
						Player[playerid].craft_cursor=Player[playerid].craft_cursor+1;
					else
						Player[playerid].craft_cursor=0;
					end
				elseif keydown==KEY_UP then
					if Player[playerid].craft_cursor~=0 then
						Player[playerid].craft_cursor=Player[playerid].craft_cursor-1;
					else
						Player[playerid].craft_cursor=MAX_CRAFT_MENU-1;
					end
				elseif keydown==KEY_RETURN then
					if Craft[Player[playerid].craft_cursor].science~=-1 then
						if GetPlayerScience(playerid,Craft[Player[playerid].craft_cursor].science)==1 then
							Player[playerid].SubMenu=Player[playerid].craft_cursor;
							Check_Craft(playerid);
							Update_Craft_Draw(playerid);
							Player[playerid].craft_cursor=0;
						else
							PlayPlayerSound(playerid,scfail);
						end
					else
						Player[playerid].SubMenu=Player[playerid].craft_cursor;
						Check_Craft(playerid);
						Update_Craft_Draw(playerid);
						Player[playerid].craft_cursor=0;
					end
				elseif keydown==28 then
					Player[playerid].OnCraftMenu=0;
					Player[playerid].SubMenu=-2;
					Update_Craft_Draw(playerid);
					HideDraw(playerid,returnd);
					HideTexture(playerid,bgc);
					FreezePlayer(playerid,0);
				end
			else
				if keydown==KEY_DOWN then
					if Player[playerid].craft_cursor~=Craft[Player[playerid].SubMenu].max_items-1 then
						Player[playerid].craft_cursor=Player[playerid].craft_cursor+1;
					else
						Player[playerid].craft_cursor=0;
					end
				elseif keydown==KEY_UP then
					if Player[playerid].craft_cursor~=0 then
						Player[playerid].craft_cursor=Player[playerid].craft_cursor-1;
					else
						Player[playerid].craft_cursor=Craft[Player[playerid].SubMenu].max_items-1;
					end
				elseif keydown==KEY_RETURN then
					if Player[playerid].able_craft[Player[playerid].craft_cursor]==Craft[Player[playerid].SubMenu].item[Player[playerid].craft_cursor].max_ingredients then
						Player[playerid].able_craft[Player[playerid].craft_cursor]=-1;
						for i=0, Craft[Player[playerid].SubMenu].item[Player[playerid].craft_cursor].max_ingredients-1 do
							RemoveItem(playerid,Craft[Player[playerid].SubMenu].item[Player[playerid].craft_cursor].ingredient[i].instance,Craft[Player[playerid].SubMenu].item[Player[playerid].craft_cursor].ingredient[i].count);
						end
						GiveItem(playerid,Craft[Player[playerid].SubMenu].item[Player[playerid].craft_cursor].instance,Craft[Player[playerid].SubMenu].item[Player[playerid].craft_cursor].count);
						
						local randomsound=random(2);
						PlayPlayerSound(playerid,scluck[randomsound]);
						
						Check_Craft(playerid);
						for i=0, 100000 do
						end
						
					else
						PlayPlayerSound(playerid,scfail);
					end
				elseif keydown==28 then
					Player[playerid].SubMenu=-1;
					Player[playerid].craft_cursor=0;
				end
			end
		end
		
		if keydown==KEY_K and Player[playerid].OnCraftMenu~=1 then
			FreezePlayer(playerid,1);
			Player[playerid].OnCraftMenu=1;
			Player[playerid].craft_cursor=0;
			Player[playerid].SubMenu=-1;
			ShowTexture(playerid,bgc);
			Create_Craft_Draw(playerid);
		end
		
		
	end
	
	if keydown == KEY_F11 then
	if GetFocus(playerid) == Bot_Hunter then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, ArmorMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Оливер: Привет"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			elseif number == 3 then
			end
		else
			HideSelectionMenu(playerid, ArmorMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Оливер: Удачи"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			elseif number == 3 then
			end
		end
	elseif GetFocus(playerid) == Mob_Kuznec then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, WeaponsMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Эй дружище, выбираешь клинок?"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Выбирай"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Опять ты!"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		else
			HideSelectionMenu(playerid, WeaponsMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Прощай"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Удачи тебе!"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Доброго пути тебе"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
	elseif GetFocus(playerid) == Bot_Alchemy then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, AlchemyMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Лучшие зелья только у меня"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Тебе что-то нужно?"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Что тебе нужно от меня?"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		else
			HideSelectionMenu(playerid, AlchemyMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Ступай"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Конечно"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Обращайся в любой момент"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
	elseif GetFocus(playerid) == Bot_Reseller then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, ResselerMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Разные безделушки"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: У меня полная барахолка вещей"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Выбирай что хочешь"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		else
			HideSelectionMenu(playerid, ResselerMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Ладно"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Твое дело"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Давай иди"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
	elseif GetFocus(playerid) == Bot_Trader or GetFocus(playerid) == Bot_Traktir then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, TradeMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Хочешь перекусить?"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: У меня только лучшее!"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Выбирай"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		else
			HideSelectionMenu(playerid, TradeMenu)
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Ага"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Без проблем"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Хорошо"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
	elseif GetFocus(playerid) == Bot_Tanis then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, TanisMenu)
		else
			HideSelectionMenu(playerid, TanisMenu)
		end
	elseif GetFocus(playerid) == Bot_Quest1 then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, Quest1Menu)
		else
			HideSelectionMenu(playerid, Quest1Menu)
		end
	elseif GetFocus(playerid) == Bot_Quest2 then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, Quest2Menu)
		else
			HideSelectionMenu(playerid, Quest2Menu)
		end
	elseif GetFocus(playerid) == Bot_Vor then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, VorMenu)
		else
			HideSelectionMenu(playerid, VorMenu)
		end
	elseif GetFocus(playerid) == Bot_Povar then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, PovarMenu)
		else
			HideSelectionMenu(playerid, PovarMenu)
		end
	elseif GetFocus(playerid) == Bot_Citizen or GetFocus(playerid) == Bot_Citizen2 or GetFocus(playerid) == Bot_Citizen3 or GetFocus(playerid) == Bot_Citizen4 or GetFocus(playerid) == Bot_Citizen5 or GetFocus(playerid) == Bot_Citizen6 or GetFocus(playerid) == Bot_Citizen7 then
		if not IsMenuShowing(playerid) and not GetActiveMenu(playerid) then
			ShowSelectionMenu(playerid, GorodMenu)
		else
			HideSelectionMenu(playerid, GorodMenu)
		end
	end
	
		elseif keydown == KEY_DOWN then
	if GetActiveMenu(playerid) == ArmorMenu then
			SwitchOptionDown(playerid, ArmorMenu)
		end
	if GetActiveMenu(playerid) == WeaponsMenu then
			SwitchOptionDown(playerid, WeaponsMenu)
		end
	if GetActiveMenu(playerid) == AlchemyMenu then
			SwitchOptionDown(playerid, AlchemyMenu)
		end	
	if GetActiveMenu(playerid) == TradeMenu then
			SwitchOptionDown(playerid, TradeMenu)
		end
	if GetActiveMenu(playerid) == ResselerMenu then
			SwitchOptionDown(playerid, ResselerMenu)
		end
	if GetActiveMenu(playerid) == TanisMenu then
			SwitchOptionDown(playerid, TanisMenu)
		end
	if GetActiveMenu(playerid) == Quest1Menu then
			SwitchOptionDown(playerid, Quest1Menu)
		end
	if GetActiveMenu(playerid) == Quest2Menu then
			SwitchOptionDown(playerid, Quest2Menu)
		end
	if GetActiveMenu(playerid) == GorodMenu then
			SwitchOptionDown(playerid, GorodMenu)
		end
	if GetActiveMenu(playerid) == VorMenu then
			SwitchOptionDown(playerid, VorMenu)
		end
	if GetActiveMenu(playerid) == PovarMenu then
			SwitchOptionDown(playerid, PovarMenu)
		end
		
		
    elseif keydown == KEY_UP then
	if GetActiveMenu(playerid) == ArmorMenu then
			SwitchOptionUp(playerid, ArmorMenu)
		end
	if GetActiveMenu(playerid) == WeaponsMenu then
			SwitchOptionUp(playerid, WeaponsMenu)
		end
		
	if GetActiveMenu(playerid) == AlchemyMenu then
			SwitchOptionUp(playerid, AlchemyMenu)
		end
		
	if GetActiveMenu(playerid) == TradeMenu then
			SwitchOptionUp(playerid, TradeMenu)
		end
	if GetActiveMenu(playerid) == ResselerMenu then
			SwitchOptionUp(playerid, ResselerMenu)
		end
	if GetActiveMenu(playerid) == TanisMenu then
			SwitchOptionUp(playerid, TanisMenu)
		end
	if GetActiveMenu(playerid) == Quest1Menu then
			SwitchOptionUp(playerid, Quest1Menu)
		end
	if GetActiveMenu(playerid) == Quest2Menu then
			SwitchOptionUp(playerid, Quest2Menu)
		end
	if GetActiveMenu(playerid) == GorodMenu then
			SwitchOptionUp(playerid, GorodMenu)
		end
	if GetActiveMenu(playerid) == VorMenu then
			SwitchOptionUp(playerid, VorMenu)
		end
	if GetActiveMenu(playerid) == PovarMenu then
			SwitchOptionUp(playerid, PovarMenu)
		end
		
    elseif keydown == KEY_RETURN then
	if GetActiveMenu(playerid) == ArmorMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Оливер: Заходи еще"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
		end
	if GetActiveMenu(playerid) == WeaponsMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Отличный выбор!"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: А ты смыслишь в оружии"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Айрон: Неплохо"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
	if GetActiveMenu(playerid) == ResselerMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Конечно"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Хорошая вещь"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Каррон: Забирай"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
	if GetActiveMenu(playerid) == AlchemyMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
			if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Хорошая вещь"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Твой выбор"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Иллион: Твой выбор"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
			end
		end
		
	if GetActiveMenu(playerid) == TradeMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
		if number == 1 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: За качество отвечаю!"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
		elseif number == 2 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Конечно"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
		elseif number == 3 then
			GameTextForPlayer(playerid,1500,5500,string.format("%s","Трактирщик: Держи!"),"Font_Old_20_White_Hi.TGA",0,255,0,2500);
		end
	end
	if GetActiveMenu(playerid) == TanisMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
		end
	if GetActiveMenu(playerid) == Quest1Menu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
		end
	if GetActiveMenu(playerid) == Quest2Menu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
		end
	if GetActiveMenu(playerid) == GorodMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
		end
	if GetActiveMenu(playerid) == VorMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
		end
	if GetActiveMenu(playerid) == PovarMenu then
			OnSelectionConfirmed(playerid) -- tylko to cie interesuje
	end
	end
				
	if keydown == KEY_F12 then
		    if Player[playerid].loggedIn == 1 and Player[playerid].logout==0 then
			    if(Player[playerid].skintype[2])then
				SetPlayerFatness(playerid, Player[playerid].skintype[1])
				SetPlayerWalk(playerid,playerid,Player[playerid].skintype[4]);
				end
				if Player[playerid].timer == true then
				SetTimerEx("ExitOut2",5000,0,playerid);
				GameTextForPlayer(playerid,800,4000,"Выход через 5 сек!","Font_Old_20_White_Hi.TGA",255,154,0,1500);
				Player[playerid].timer = false
				elseif Player[playerid].timer == false then
				SetTimerEx("ExitOut3",10000,0,playerid);
				GameTextForPlayer(playerid,800,4000,"Заблокировано. Через 10 сек попробуйте снова!","Font_Old_20_White_Hi.TGA",255,154,0,1500);
				end
				else
			    ExitGame(playerid);
            end
			end
			
			
		--[[if keydown == KEY_F12 then
		    if Player[playerid].loggedIn == 1 and Player[playerid].logout==0 then
			SaveAccount(playerid);
			GameTextForPlayer(playerid,800,4000,"Быстрое сохранение выполнено!","Font_Old_20_White_Hi.TGA",255,154,0,1500);
			else
			GameTextForPlayer(playerid,800,4000,"Вы не вошли в свой аккаунт!","Font_Old_20_White_Hi.TGA",255,154,0,1500);
			end
		end]]
		
		if keydown == KEY_ESCAPE then
		GameTextForPlayer(playerid,800,3000,"Для выхода клавиша F12.","Font_Old_20_White_Hi.TGA",255,154,0,1500);
		
		elseif keydown == KEY_F9 then
		    CMD_AFK(playerid);
			elseif keydown == KEY_F10 then
		    CMD_HIDECHAT(playerid);
			
		elseif keydown == KEY_F1 then
		ShowInfo(playerid);
		elseif keyup == KEY_F1 then
		HideInfo(playerid);
		
		elseif keydown == KEY_F2 then
			ShowNews(playerid);
		elseif keyup == KEY_F2 then
			HideNews(playerid);
		end
		
		if keydown==KEY_S then
		local Anima = GetPlayerAnimationID(playerid);
		if Anima == 270 then
		PlayAnimation(playerid,"T_SIT_2_STAND");
		elseif Anima == 230 then
		PlayAnimation(playerid,"T_LGUARD_2_STAND");
		elseif Anima == 199 then
		PlayAnimation(playerid,"T_HGUARD_2_STAND");
		elseif Anima == 271 then
		PlayAnimation(playerid,"T_SLEEPGROUND_2_STAND");
		elseif Anima == 256 then
		PlayAnimation(playerid,"T_PRAY_2_STAND");
		elseif Anima == 253 then
		PlayAnimation(playerid,"T_PEE_2_STAND");
		elseif Anima == 315 then
		PlayAnimation(playerid,"T_WOUNDED_2_STAND");
		elseif Anima == 140 then
		PlayAnimation(playerid,"T_CHESTBIG_S0_2_STAND");
		elseif Anima == 261 then
		PlayAnimation(playerid,"T_REPAIR_S1_2_STAND");
		elseif Anima == 296 then
		PlayAnimation(playerid,"T_TREASURE_S1_2_STAND");
		end
			--SendPlayerMessage(playerid,0,255,0,string.format("%s%s%s","Номер: #",Anima,"#"));
		end
		
		--[[if keydown==KEY_G then
		local Animas = GetPlayerAnimationID(playerid);
		local randomych = random(3)
		if Animas == 230 then
		if randomych == 0 then
		PlayAnimation(playerid,"T_LGUARD_STRETCH");
		elseif randomych == 1 then
		PlayAnimation(playerid,"T_LGUARD_SCRATCH");
		elseif randomych == 2 then
		PlayAnimation(playerid,"T_LGUARD_CHANGELEG");
		elseif randomych == 3 then
		PlayAnimation(playerid,"T_LGUARD_CHANGELEG");
		end
		elseif Animas == 199 then
		PlayAnimation(playerid,"T_HGUARD_LOOKAROUND");
		elseif Animas == 138 then
		if randomych == 0 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_1");
		elseif randomych == 1 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_2");
		elseif randomych == 2 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_3");
		elseif randomych == 3 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_4");
		end
		elseif Animas == 96 then
		if randomych == 0 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_1");
		elseif randomych == 1 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_2");
		elseif randomych == 2 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_3");
		elseif randomych == 3 then
		PlayAnimation(playerid,"R_CHAIR_RANDOM_4");
		end
		elseif Animas == 265 then
		PlayAnimation(playerid,"T_SEARCH");
		elseif Animas == 282 then
		for i = 0, 50 do --(0,1,2,3,4,5) (together 6 slots)
            if GetPlayerItem(playerid,i) == "ITFOMUTTONRAW" then
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Мясо пожарено."),"Font_Old_10_White_Hi.TGA",255,0,0,2100);
			RemoveItem(playerid,"ITFOMUTTONRAW",1);
			GiveItem(playerid,"ITFOMUTTON",1)
        else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","У вас нет больше сырого мяса!"),"Font_Old_10_White_Hi.TGA",255,0,0,2100);
			end
			end
		elseif Animas == 250 then
		if item_instance == "NULL" then
			GameTextForPlayer(playerid,3000,3000,string.format("%s","У вас нет больше сырого мяса!"),"Font_Old_20_White_Hi.TGA",255,0,0,2100);
        else
			GameTextForPlayer(playerid,3000,3000,string.format("%s","Мясо пожарено."),"Font_Old_10_White_Hi.TGA",255,0,0,2100);
			RemoveItem(playerid,"ITFOMUTTONRAW",1);
			GiveItem(playerid,"ITFOMUTTON",1)
			end
		end
		end]]


end

function ExitOut(playerid)
SaveAccount(playerid);
ExitGame(playerid);
end

function ExitOut2(playerid)
SaveAccount(playerid);
Player[playerid].timer = true;
ExitGame(playerid);
Player[playerid].loggedIn = 0;
Player[playerid].logout=1;
end

function ExitOut3(playerid)
Player[playerid].timer = true;
end

function OnGamemodeExit()
for i = 0, GetMaxSlots() - 1 do
SendPlayerMessage(i,0,250,0,"Сервер находится в состоянии оффлайн. Не волнуйтесь, ваш персонаж сохранился");
Kick(i);
end
end

function ADM_CreateProfile(playerid, params)
local result, login, passwd = sscanf(params,"ss");
	if result == 1 and not(string.find(string.lower(passwd), string.lower(" "))) and Player[playerid].admin == 444 then
		local fileRead = io.open("account/"..login..".txt","r+");
			if fileRead then
				SendPlayerMessage(playerid,255,0,0,"Такой аккаунт уже есть!");
				fileRead:close();	
			else		
		local fileWrite = io.open("account/"..login..".txt", "w+");
        fileWrite:write(login.." "..passwd.."\n");
		fileWrite:write("1 \n");
        fileWrite:write("WOM_COLONY.ZEN"," 39044.043 3858.57764 -2227.58154 ","102","\n");
		fileWrite:write("9 2 1 \n");
		fileWrite:write("0 0 0 0 0 0 0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0 \n");
		fileWrite:write("0");
        fileWrite:close();
		end
		else
        SendPlayerMessage(playerid,255,0,0,"WTF");
	end
end

function CMD_PM_Block(playerid, params)
local result, type = sscanf(params,"s");
 
if result == 1 then
        if type == "выкл" then
            Player[playerid].pmavaible = true
			SendPlayerMessage(playerid,255,0,0,"Получение личных сообщений: Включено");
        elseif type == "вкл" then
            Player[playerid].pmavaible = false
			SendPlayerMessage(playerid,255,0,0,"Получение личных сообщений: Выключено");
    end
else
        SendPlayerMessage(playerid,255,0,0,"Используй: /лсблок (вкл/выкл)");
end
end

function CMD_AFK(playerid)
    if Player[playerid].AFK == true and Player[playerid].loggedIn ~= nil then
        Player[playerid].AFK = false
		FreezePlayer(playerid, 0);
	    SendPlayerMessage(playerid,255,0,0,"Режим AFK: Выключено");
    elseif Player[playerid].AFK == false and Player[playerid].loggedIn ~= nil then
        Player[playerid].AFK = true
		FreezePlayer(playerid, 1);
	    SendPlayerMessage(playerid,255,0,0,"Режим AFK: Включено");
    end
end

function CMD_Craft_change(playerid, params)
local result, crid, proff, skill = sscanf(params,"dsd");
if Player[playerid].admin == 444 then
if result == 1 then
        if proff == "алхимия" then
            Player[crid].alchemylvl = skill;
			SendPlayerMessage(playerid,255,0,0,"Вы изменили уровень алхимии "..GetPlayerName(crid).." на "..skill);
			SendPlayerMessage(crid,255,0,0,GetPlayerName(playerid).." изменил ваш уровень алхимии на "..skill);
        elseif proff == "кузнечество" then
            Player[crid].blacksmithlvl = skill;
			SendPlayerMessage(playerid,255,0,0,"Вы изменили уровень кузнечного дела "..GetPlayerName(crid).." на "..skill);
			SendPlayerMessage(crid,255,0,0,GetPlayerName(playerid).." изменил ваш уровень кузнечного дела на "..skill);
        end
else
        SendPlayerMessage(playerid,255,0,0,"Используй: /крафтлвл <ID игрока> <алхимия/кузнечество> <уровень навыка (0/1/2/3)>");
end
else
        SendPlayerMessage(playerid,255,0,0,"(Ошибка!) Вы не админ.");
end
end

--КОМАНДЫ АДМИНА
function CMD_ADMINKA(playerid, params)
local result,ppid , clid = sscanf(params, "dd");
if result == 1 and IsPlayerAdmin(playerid) == 1 then
	if clid == 0 then
		Player[ppid].admin = 0;
		SendPlayerMessage(ppid,255,205,0,"Права администратора/модератора сняты");
		SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы сняли админку/модерку с",GetPlayerName(ppid)));
	elseif clid == 1 then
		Player[ppid].admin = 111;
		SendPlayerMessage(ppid,255,205,0,"Вы получили права саппорта");
		SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы выдали права саппорта",GetPlayerName(ppid)));
	elseif clid == 2 then
		Player[ppid].admin = 222;
		SendPlayerMessage(ppid,255,205,0,"Вы получили права модератора");
		SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы выдали права модератора",GetPlayerName(ppid)));
	elseif clid == 3 then
		Player[ppid].admin = 333;
		SendPlayerMessage(ppid,255,205,0,"Вы получили права ГМа");
		SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы выдали права глобального модератора",GetPlayerName(ppid)));
	elseif clid == 4 then
		Player[ppid].admin = 444;
		SendPlayerMessage(ppid,255,205,0,"Вы получили права администратора");
		SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы выдали админку",GetPlayerName(ppid)));
	end
	SaveAccount(ppid);
end	
LogString("AdminLog",string.format("%s %s %s",GetPlayerName(playerid),"give admin (or moder)",GetPlayerName(ppid)));
end

function CMD_AdminHelp(playerid)
		if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444
		then
			SendPlayerMessage(playerid,0,255,255,"Помощь админу:");
			SendPlayerMessage(playerid,230,230,230,"/кик (ID) (причина) || /бан (ID) (причина)");
			SendPlayerMessage(playerid,230,230,230,"/килл (ID) || /тп (от ID) (до ID)");
			SendPlayerMessage(playerid,230,230,230,"/класс (ID) (номер класса)");
			SendPlayerMessage(playerid,230,230,230,"/наблюдение (ID) - наблюдать за игроком");
			SendPlayerMessage(playerid,230,230,230,"Номера классов есть на форуме");
		else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Вы не админ!");
		end
end

function CMD_AdminInviz(playerid, params)
		if Player[playerid].loggedIn == 1 and Player[playerid].admin == 111 or Player[playerid].admin == 222 or Player[playerid].admin == 333 or Player[playerid].admin == 444 then
		    local result,modif = sscanf(params,"s");
			if modif == "включить" or modif == "вкл" and Player[playerid].invis == false then
			    Player[playerid].invis = true;
			    Player[playerid].skintype = {};
				Player[playerid].skintype[1] = GetPlayerFatness(playerid);
				Player[playerid].skintype[4] = GetPlayerWalk(playerid);
			    SendPlayerMessage(playerid,230,230,230,"Включен режим невидимости.");
				EnablePlayerNickname(playerid,0);
				EnablePlayerNicknameID(playerid,0);
			    SetPlayerFatness(playerid, -100000000)
			    SetPlayerWalk(playerid,"HumanS_Sprint.mds");
			elseif modif == "выключить" or modif == "выкл" and Player[playerid].invis == true then
			    Player[playerid].invis = false;
			    SetPlayerFatness(playerid, Player[playerid].skintype[1])
				SetPlayerWalk(playerid,Player[playerid].skintype[4]);
			    SendPlayerMessage(playerid,230,230,230,"Выключен режим невидимости.");
				EnablePlayerNickname(playerid,1);
				EnablePlayerNicknameID(playerid,1);
			end
		else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Вы не админ!");
		end
end

function CMD_SPEC(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 111 or Player[playerid].admin == 222 or Player[playerid].admin == 333 or Player[playerid].admin == 444
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SetCameraBehindPlayer(playerid, id);
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /наблюдение (ID игрока)");
			SetDefaultCamera(playerid);
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
	end
end

function CMD_Kill(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				SendPlayerMessage(id,0,255,255,string.format("%s %s","Вы были убиты",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы убили",GetPlayerName(id)));
				SetPlayerHealth(id,0);
				LogString("AdminLog",string.format("%s %s %s",GetPlayerName(playerid),"kill",GetPlayerName(id)));
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /килл (ID игрока)");
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
	end
end

function CMD_Teleport(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111
	then
		local result,from_id,to_id = sscanf(params,"dd");

		if result == 1
		then
			if IsPlayerConnected(from_id) == 1
			then
				if IsPlayerConnected(to_id) == 1
				then
					SendPlayerMessage(from_id,0,255,255,string.format("%s %s","Вы телепортировались до",GetPlayerName(to_id)));
					--SendPlayerMessage(to_id,0,255,255,string.format("%s %s","К вам телепортировался",GetPlayerName(from_id)));
					LogString("AdminLog",string.format("%s %s %s %s %s",GetPlayerName(playerid),"teleported",GetPlayerName(from_id),"to",GetPlayerName(to_id)));
					local x,y,z = GetPlayerPos(to_id);
					SetPlayerPos(from_id,x + 50,y,z);
				else
					SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",to_id,"не на сервере."));
				end
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",from_id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /тп (от ID игрока) (до ID игрока)");
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
	end
end

function CMD_Time(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222
	then
		local result,hour,minute = sscanf(params,"dd");
		
		if result == 1
		then		
			SendMessageToAll(0,255,255,string.format("%s %s %s %d:%02d","(СЕРВЕР):",GetPlayerName(playerid),"сменил время",hour,minute));
			SetTime(hour,minute);
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /time (час) (минута)");
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Вы не админ!");
	end
end

function CMD_MAll(playerid, params)
		SendPlayerMessage(playerid, 255, 255, 0, "Игроки с правами на сервере:")
		for i = 0, GetMaxPlayers() -1 do
			if IsPlayerConnected(i) == 1 then
				if Player[i].admin == 444 then
					SendPlayerMessage(playerid,255,0,0, string.format("%d|%s %s", i, GetPlayerName(i), "(Администратор)"))
				elseif Player[i].admin == 333 then
					SendPlayerMessage(playerid,0,255,0, string.format("%d|%s %s", i, GetPlayerName(i), "(Глобальный модератор)"))
				elseif Player[i].admin == 222 then
					SendPlayerMessage(playerid,255,0,255, string.format("%d|%s %s", i, GetPlayerName(i), "(Модератор)"))
				elseif Player[i].admin == 111 then
					SendPlayerMessage(playerid,255,255,0, string.format("%d|%s %s", i, GetPlayerName(i), "(Саппорт)"))
				elseif Player[i].leader >= 1 then
					SendPlayerMessage(playerid,255,255,255, string.format("%d|%s %s", i, GetPlayerName(i), "(Лидер)"))
				end
			end
		end
end

function CMD_kick(playerid, params)
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				local result,id,reason = sscanf(params,"ds");
				SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(СЕРВЕР):",GetPlayerName(id),"был кикнут. Кикнул:",GetPlayerName(playerid),".","Причина:",reason));
				Kick(id);
				LogString("AdminLog",string.format("%s %s %s %s",GetPlayerName(playerid),"kick",GetPlayerName(id),reason));
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /кик (ID игрока) (причина)");
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
	end
end

function CMD_kick(playerid, params)
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1
			then
				local result,id,reason = sscanf(params,"ds");
				SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(СЕРВЕР):",GetPlayerName(id),"был кикнут. Кикнул:",GetPlayerName(playerid),".","Причина:",reason));
				Kick(id);
				LogString("AdminLog",string.format("%s %s %s %s",GetPlayerName(playerid),"kick",GetPlayerName(id),reason));
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /кик (ID игрока) (причина)");
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
	end
end

function CMD_Ban(playerid, params)

	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333
	then
		local result,id = sscanf(params,"d");

		if result == 1
		then
			if IsPlayerConnected(id) == 1 then
				local result,id,reason = sscanf(params,"ds");
				SendMessageToAll(255,0,0,string.format("%s %s %s %s%s %s %s","(СЕРВЕР):",GetPlayerName(id),"был забанен. Забанил:",GetPlayerName(playerid),".","Причина:",reason));
				Ban(id);
				LogString("AdminLog",string.format("%s %s %s %s",GetPlayerName(playerid),"ban",GetPlayerName(id),reason));
			else
				SendPlayerMessage(playerid,230,230,230,string.format("%s %d %s","(СЕРВЕР): Player ID",id,"не на сервере."));
			end
		else
			SendPlayerMessage(playerid,230,230,230,"Используй: /бан (ID игрока) (причина)");
		end
	else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
	end
	LogString("AdminLog",string.format("%s %s %s",GetPlayerName(playerid),"ban",GetPlayerName(id)));
end

function CMD_NEWS(playerid, params)
local result, newsmsg = sscanf(params,"s");
if Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 or Player[playerid].leader >= 1 then
SendMessageToAll(0,255,0,string.format("%s %s %s %s","(НОВОСТИ):",GetPlayerName(playerid),":",newsmsg));
else
		SendPlayerMessage(playerid,255,0,0,string.format("%s","У вас нет прав"));
end
end

function CMD_GL(playerid, params)
local result, newsmsg = sscanf(params,"s");
if Player[playerid].admin == 444 or Player[playerid].admin == 333 then
SendMessageToAll(0,255,0,string.format("%s ",newsmsg));
else
		SendPlayerMessage(playerid,255,0,0,string.format("%s","У вас нет прав"));
end
end

function CMD_SERVERCHAT(playerid, params)
	local result, smsg = sscanf(params,"s");
	
	if result==1 then
		if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 then
			SendMessageToAll(255,255,0,string.format("%s %s","(СЕРВЕР):",smsg));			
		else
			SendPlayerMessage(playerid,255,0,0,string.format("%s","У вас нет прав"));
		end
	end
end

function CMD_Mute(playerid, params)
local result, pid, type = sscanf(params,"ds");
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 then
 
if result == 1 then
        if type == "включить" then
            Player[pid].Mute = true
			SendPlayerMessage(pid,255,0,0,"Ваш чат заблокировал "..GetPlayerName(playerid));
			SendPlayerMessage(playerid,255,0,0,"Вы заблокировали чат "..GetPlayerName(pid));
			LogString("AdminLog",string.format("%s %s %s",GetPlayerName(playerid),"mute",GetPlayerName(pid)));
        elseif type == "выключить" then
            Player[pid].Mute = false
			SendPlayerMessage(pid,255,0,0,"Ваш чат разблокирован "..GetPlayerName(playerid));
			SendPlayerMessage(playerid,255,0,0,"Вы разблокировали чат "..GetPlayerName(pid));
    end
else
        SendPlayerMessage(playerid,255,0,0,"Используй: /мут (ID) (включить/выключить)");
end
else
		SendPlayerMessage(playerid,230,230,230,"(СЕРВЕР): Ты не админ!");
		end
end

function CMD_Jail(playerid, params)
local result,id = sscanf(params,"d");
			if Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 or Player[playerid].leader >= 1 then
				SendPlayerMessage(id,0,255,255,string.format("%s %s","Вы были посажены в тюрьму игроком:",GetPlayerName(playerid)));
				SendPlayerMessage(id,230,230,230,"(За нонРП побег (через текстуры) вы будете наказаны)");
				SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы посадили в тюрьму",GetPlayerName(id)));
				SetPlayerPos(id,10575.858398438, 368.29537963867, 4650.1318359375);
				end
end

function CMD_Jail2(playerid, params)
local result,id = sscanf(params,"d");
			if Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 or Player[playerid].leader >= 1 then
				SendPlayerMessage(id,0,255,255,string.format("%s %s ","Вы были посажены в тюрьму игроком:",GetPlayerName(playerid)));
				SendPlayerMessage(id,230,230,230,"(За нонРП побег (через текстуры) вы будете наказаны)");
				SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы посадили в тюрьму",GetPlayerName(id)));
				SetPlayerPos(id,10575.858398438, 368.29537963867, 4650.1318359375);
				end
end

function CMD_UJail(playerid, params)
local result,id = sscanf(params,"d");
			if Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 or Player[playerid].leader >= 1 then
				SendPlayerMessage(id,0,255,255,string.format("%s %s","Вы были освобождены из тюрьмы, игроком:",GetPlayerName(playerid)));
				SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы освободили",GetPlayerName(id)));
				SetPlayerPos(id,-13.171690940857, -630.19348144531, -3612.6264648438);
				end
end

--КОМАНДЫ ЧАТА
function CMD_ME(playerid, params)
local result , metext = sscanf(params,"s");
	if result==1 then
		if Player[playerid].Mute == false then
		metext=string.gsub(metext,"/",",");
			for i = 0, MAX_PLAYERS - 1 do
				if GetDistancePlayers(playerid,i) < 1400 then
					if string.len(metext)>80 then
							SendPlayerMessage(i,255,179,0,string.format("%s%s %s%s","#",GetPlayerName(playerid),string.sub(metext,1,80),"#"));
							SendPlayerMessage(i,255,179,0,string.format("%s%s",string.sub(metext,81,string.len(metext)),"#"));
					else
						SendPlayerMessage(i,255,179,0,string.format("%s%s %s%s","#",GetPlayerName(playerid),metext,"#"));
					end
				end
			end
		elseif Player[playerid].Mute == true then
			SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."))
		end
	end
end

function CMD_MYUSLI(playerid, params)
local result , myuslitext = sscanf(params,"s");
	if result==1 then
		if Player[playerid].Mute == false then
		myuslitext=string.gsub(myuslitext,"/",",");
					if string.len(myuslitext)>80 then
							SendPlayerMessage(playerid,255,179,179,string.format("%s%s %s%s","#(мысли)",GetPlayerName(playerid),string.sub(myuslitext,1,80),"#"));
							SendPlayerMessage(playerid,255,179,179,string.format("%s%s",string.sub(myuslitext,81,string.len(myuslitext)),"#"));
					else
						SendPlayerMessage(playerid,255,179,179,string.format("%s%s %s%s","#(мысли)",GetPlayerName(playerid),myuslitext,"#"));
					end
		elseif Player[playerid].Mute == true then
			SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."))
		end
	end
end

function CMD_OOC(playerid, params)
local result, oocmsg = sscanf(params,"s");
	if Player[playerid].Mute == false then
		if result==1 then
		--oocmsg=string.gsub(oocmsg,"/",",");
			for i = 0, MAX_PLAYERS - 1 do
					if GetDistancePlayers(playerid,i) < 2000 then 
						if i==playerid then
							if string.len(oocmsg)>80 then
							SendPlayerMessage(i,0,213,255,string.format("%s %s","Вы(OOC):",string.sub(oocmsg,1,80)));
							SendPlayerMessage(i,0,213,255,string.format("%s%s",string.sub(oocmsg,81,string.len(oocmsg)),"(OOC)"));
						else
							SendPlayerMessage(i,0,213,255,string.format("%s %s","Вы(OOC):",oocmsg));
						end
					else
						if string.len(oocmsg)>80 then
							SendPlayerMessage(i,0,213,255,string.format("%s%s %s",GetPlayerName(playerid),"(OOC):",string.sub(oocmsg,1,80)));
							SendPlayerMessage(i,0,213,255,string.format("%s%s",string.sub(oocmsg,81,string.len(oocmsg)),"(OOC)"));
						else
							SendPlayerMessage(i,0,213,255,string.format("%s%s %s",GetPlayerName(playerid),"(OOC):",oocmsg));
						end
						end
					end
			end
			end
		elseif Player[playerid].Mute == true then
			SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
		end
	end

function CMD_GM(playerid, params)
	local result, oocmsg = sscanf(params,"s");
	
	if result==1 then
		if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 then
			SendMessageToAll(0,213,255,string.format("%s %s","^Автор:",oocmsg));			
		else
			SendPlayerMessage(playerid,255,0,0,string.format("%s","У вас нет прав"));
		end
	end
end

function CMD_Roll(playerid, params)
local result, dice, face = sscanf(params,"dd");
local random_roll = 0;
local summ = 0;
if result~=1 then
	dice = 2;
	face= 6;
end
if dice > 10 then
SendPlayerMessage(playerid,250,0,0,"Не выбирай большие значения!");
else
if face > 10 then
SendPlayerMessage(playerid,250,0,0,"Не выбирай большие значения!");
else
if (dice == tonumber(dice)) and (face == tonumber(face)) then
for i = 1, dice do
    random_roll = random(face);
	summ = summ + random_roll
end
if Player[playerid].Mute == false then
for i = 0, MAX_PLAYERS - 1 do
	if GetDistancePlayers(playerid,i) <= 1500 then
		
			SendPlayerMessage(i,255,255,0,GetPlayerName(playerid).." выбросил на костях "..summ.." ("..dice.."d"..face..")");			
	end
end
elseif Player[playerid].Mute == true then
    SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
end
else
    SendPlayerMessage(playerid,255,0,0,string.format("Вводимые значения должны быть цифровыми."));
end
end
end
end


function CMD_Monetka(playerid, params)
local result = sscanf(params,"s");
local monetka = random(3)
	if Player[playerid].Mute == false then
			for i = 0, MAX_PLAYERS - 1 do
				if GetDistancePlayers(playerid,i) <= 1000 then
					if monetka == 0 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игроку",GetPlayerName(playerid),"выпал орел#"));
					elseif monetka == 1 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игроку",GetPlayerName(playerid),"выпал орел#"));
					elseif monetka == 2 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игроку",GetPlayerName(playerid),"выпала решка#"));
					elseif monetka == 3 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игроку",GetPlayerName(playerid),"выпала решка#"));
					end
				end
			end
	elseif Player[playerid].Mute == true then
	SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
	end
end

function CMD_uda4a(playerid, params)
local result = sscanf(params,"s");
local udacha = random(3)
	if Player[playerid].Mute == false then
			for i = 0, MAX_PLAYERS - 1 do
				if GetDistancePlayers(playerid,i) <= 1000 then
					if udacha == 0 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игрок",GetPlayerName(playerid),"(+) удача#"));
					elseif udacha == 1 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игрок",GetPlayerName(playerid),"(+) удача#"));
					elseif udacha == 2 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игрок",GetPlayerName(playerid),"(-) неудача#"));
					elseif udacha == 3 then
					SendPlayerMessage(i,255,179,255,string.format("%s %s %s","#Игрок",GetPlayerName(playerid),"(-) неудача#"));
					end
				end
			end
	elseif Player[playerid].Mute == true then
	SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
	end
end

function CMD_DO(playerid, params)
local result, domsg = sscanf(params,"s");
	if Player[playerid].Mute == false then

		if result==1 then
		--domsg=string.gsub(domsg,"/",",");
		for i = 0, MAX_PLAYERS - 1 do
			if GetDistancePlayers(playerid,i) <= 1200 then 
					if i==playerid then
						if string.len(domsg)>80 then
							SendPlayerMessage(i,0,213,255,string.format("%s %s","Вы(ДО):",string.sub(domsg,1,80)));
							SendPlayerMessage(i,0,213,255,string.format("%s%s",string.sub(domsg,81,string.len(domsg)),"(ДО)"));
						else
							SendPlayerMessage(i,0,213,255,string.format("%s %s","Вы(ДО):",domsg));
						end
					else
						if string.len(domsg)>80 then
							SendPlayerMessage(i,0,213,255,string.format("%s%s %s",GetPlayerName(playerid),"(ДО):",string.sub(domsg,1,80)));
							SendPlayerMessage(i,0,213,255,string.format("%s%s",string.sub(domsg,81,string.len(domsg)),"(ДО)"));
						else
							SendPlayerMessage(i,0,213,255,string.format("%s%s %s",GetPlayerName(playerid),"(ДО):",domsg));
						end
					end
				end
			end
		end
	elseif Player[playerid].Mute == true then
		SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
	end
end

function CMD_PO(playerid, params)
local result, pomsg = sscanf(params,"s");
local udachechka = random(2);
	if Player[playerid].Mute == false then

		if result==1 then
		--pomsg=string.gsub(pomsg,"/",",");
		for i = 0, MAX_PLAYERS - 1 do
			if GetDistancePlayers(playerid,i) <= 1200 then
													if udachechka == 0 then
					if i==playerid then
						if string.len(pomsg)>80 then
							SendPlayerMessage(i,150,213,255,string.format("%s %s","Вы(ДО):",string.sub(pomsg,1,80)));
							SendPlayerMessage(i,150,213,255,string.format("%s%s",string.sub(pomsg,81,string.len(pomsg)),"(Удача+)"));
						else
							SendPlayerMessage(i,150,213,255,string.format("%s %s%s","Вы(ДО):",pomsg,"(Удача+)"));
						end
					else
						if string.len(pomsg)>80 then
							SendPlayerMessage(i,150,213,255,string.format("%s%s %s",GetPlayerName(playerid),"(ДО):",string.sub(pomsg,1,80)));
							SendPlayerMessage(i,150,213,255,string.format("%s%s",string.sub(pomsg,81,string.len(pomsg)),"(Удача+)"));
						else
							SendPlayerMessage(i,150,213,255,string.format("%s%s %s%s",GetPlayerName(playerid),"(ДО):",pomsg,"(Удача+)"));
						end
					end
													elseif udachechka == 1 then
					if i==playerid then
						if string.len(pomsg)>80 then
							SendPlayerMessage(i,150,213,255,string.format("%s %s","Вы(ДО):",string.sub(pomsg,1,80)));
							SendPlayerMessage(i,150,213,255,string.format("%s%s",string.sub(pomsg,81,string.len(pomsg)),"(Неудача-)"));
						else
							SendPlayerMessage(i,150,213,255,string.format("%s %s%s","Вы(ДО):",pomsg,"(Неудача-)"));
						end
					else
						if string.len(pomsg)>80 then
							SendPlayerMessage(i,150,213,255,string.format("%s%s %s",GetPlayerName(playerid),"(ДО):",string.sub(pomsg,1,80)));
							SendPlayerMessage(i,150,213,255,string.format("%s%s",string.sub(pomsg,81,string.len(pomsg)),"(Неудача-)"));
						else
							SendPlayerMessage(i,150,213,255,string.format("%s%s %s%s",GetPlayerName(playerid),"(ДО):",pomsg,"(Неудача-)"));
						end
					end
				end
													end
			end
		end
	elseif Player[playerid].Mute == true then
		SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
	end
end

function CMD_PM(playerid, params)
local result, lid , pmtext = sscanf(params,"ds");
if Player[playerid].Mute == false then
if Player[lid].pmavaible == false then
SendPlayerMessage(playerid,255,0,0,"Игрок запретил получение личных сообщений");
else
if result == 1 then
	if IsPlayerConnected(lid) == 1 then
		SendPlayerMessage(lid,255,205,0,string.format("%s %s %s %d %s %s","(PM) от ",GetPlayerName(playerid),"(ID:",playerid,")",pmtext));
		SendPlayerMessage(playerid,188,255,0,string.format("%s %s %s %d %s %s","(PM) для ",GetPlayerName(lid),"(ID:",lid,")",pmtext));
		else
		SendPlayerMessage(playerid,255,0,0,"Нет такого игрока на сервере");

	end
else 
	SendPlayerMessage(playerid,255,0,0,"Используй: /лс (ID игрока) (текст)");
	end
end
elseif Player[playerid].Mute == true then
    SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
end
end

function CMD_Amd_Answ(playerid, params)
local result, pid , pmtext = sscanf(params,"ds");
if result == 1 then
	if IsPlayerConnected(pid) == 1 then
	    if Player[playerid].admin == 444 then
		SendPlayerMessage(pid,255,205,0,"Администратор "..GetPlayerName(playerid).." ответил: "..pmtext);
		elseif Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 then
		SendPlayerMessage(pid,255,205,0,"Модератор "..GetPlayerName(playerid).." ответил: "..pmtext);
		end
		for i = 0, MAX_PLAYERS - 1 do
	        if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
		
			    SendPlayerMessage(i,255,154,0,"(REPORT) "..GetPlayerName(playerid).." ответил игроку "..GetPlayerName(pid)..": "..pmtext);
	        end
        end
	else
		SendPlayerMessage(playerid,255,0,0,"Нет такого игрока на сервере");

	end
else 
	SendPlayerMessage(playerid,255,0,0,"Используй: /ад (ID игрока) (текст)");
	end
end

function CMD_AC(playerid, params)
local result, acmsg = sscanf(params,"s");
if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 then
for i = 0, MAX_PLAYERS - 1 do
	if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
		
			SendPlayerMessage(i,255,154,0,string.format("%s %s %s %s","(A):",GetPlayerName(playerid),":",acmsg));			
	end
end
end
end

function CMD_REPORT(playerid, params)
local result, remsg = sscanf(params,"s");
if result then
    SendPlayerMessage(playerid,255,154,0,GetPlayerName(playerid).."(Вы) написали администрации: "..remsg);
end
for i = 0, MAX_PLAYERS - 1 do
	if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
		
			SendPlayerMessage(i,255,154,0,string.format("%s %s %s %s %s","(REPORT):",GetPlayerName(playerid),playerid,":",remsg));
	end
end
GameTextForPlayer(playerid,2500,4000,"Сообщение успешно отправлено","Font_Old_20_White_Hi.TGA",255,154,0,1800);
end


function CMD_K(playerid, params)
local result, kmsg = sscanf(params, "s");
if Player[playerid].Mute == false then
	if result == 1 then
		for i = 0, MAX_PLAYERS - 1 do
			if GetDistancePlayers(playerid,i) < 4000 then 
					if i==playerid then
					if string.len(kmsg)>80 then
							SendPlayerMessage(i,0,255,0,string.format("%s %s%s","Вы крикнули:",string.sub(kmsg,1,80),"-"));
							SendPlayerMessage(i,0,255,0,string.format("%s%s",string.sub(kmsg,81,string.len(kmsg)),"(Ваш крик)"));
						else
						SendPlayerMessage(i,0,255,0,string.format("%s %s","Вы крикнули:",kmsg));
						end
					else
						if string.len(kmsg)>80 then
							SendPlayerMessage(i,0,255,0,string.format("%s %s %s%s",GetPlayerName(playerid),"крикнул:",string.sub(kmsg,1,80),"-"));
							SendPlayerMessage(i,0,255,0,string.format("%s%s%s%s",string.sub(kmsg,81,string.len(kmsg)),"(",GetPlayerName(playerid)," крик)"));
						else
							SendPlayerMessage(i,0,255,0,string.format("%s %s %s",GetPlayerName(playerid),"крикнул:",kmsg));
						end
					end
			end
		end
	end
elseif Player[playerid].Mute == true then
    SendPlayerMessage(playerid,255,0,0,string.format("Ваш чат заблокирован."));
end
end

function CMD_SZ(playerid, params)
local result, szmsg = sscanf(params, "s");
	if result == 1 then
		for i = 0, MAX_PLAYERS - 1 do
			if GetDistancePlayers(playerid,i) <= 450 then 
						if i==playerid then
						if string.len(szmsg)>80 then
								SendPlayerMessage(i,47,198,215,string.format("%s %s%s","Ваш шепот:",string.sub(szmsg,1,80),"-"));
								SendPlayerMessage(i,47,198,215,string.format("%s%s",string.sub(szmsg,81,string.len(szmsg)),"(Ваш шепот)"));
							else
							SendPlayerMessage(i,47,198,215,string.format("%s %s","Ваш шепот:",szmsg));
							end
						else
							if string.len(szmsg)>80 then
								SendPlayerMessage(i,47,198,215,string.format("%s%s %s%s",GetPlayerName(playerid)," шепот:",string.sub(szmsg,1,80),"-"));
								SendPlayerMessage(i,47,198,215,string.format("%s%s%s%s",string.sub(szmsg,81,string.len(szmsg)),"(",GetPlayerName(playerid)," шепот)"));
							else
								SendPlayerMessage(i,47,198,215,string.format("%s %s %s",GetPlayerName(playerid),"шепот:",szmsg));
							end
						end
					end
		end
	end
end

--ЗАПИСЬ СТАТИСТИКИ И ИНВЕНТАРЯ
function Zapisatsuka(playerid)
			if IsPlayerConnected(playerid) == 1 then
				local name = GetPlayerName(playerid);	
				local Inv = io.open(PATH_FILE..name..".txt","w+");
				Inv:close();
					for i = 0, 120 do 
						GetPlayerItem(playerid,i);
					end	
			end
			Player[playerid].timer = true;
end

function SaveAccount(playerid)
if IsPlayerConnected(playerid) == 1 then
	local name = GetPlayerName(playerid);	
	local Inv = io.open(PATH_FILE..name..".txt","w+");
	Inv:close();
	for i = 0, 120 do 
GetPlayerItem(playerid,i);
end	
        local x, y, z = GetPlayerPos(playerid);
		local v_1 , v_2 , v_3, v_4 = GetPlayerAdditionalVisual(playerid);
		
		local fileWrite = io.open("account/"..GetPlayerName(playerid)..".txt", "w+");
        fileWrite:write(Player[playerid].nick.." "..Player[playerid].password.."\n");
		if Player[playerid].class == nil then
			Player[playerid].class = 1;
			fileWrite:write(Player[playerid].class.."\n");
		else
			fileWrite:write(Player[playerid].class.."\n");
		end	
        fileWrite:write(GetPlayerWorld(playerid)," ",x," ",y," ",z," ",GetPlayerAngle(playerid),"\n");
		fileWrite:write(v_1," ",v_2," ",v_3," ",v_4.."\n");
		fileWrite:write(GetPlayerScience(playerid, 0)," ",GetPlayerScience(playerid, 1)," ",GetPlayerScience(playerid, 2)," ",GetPlayerScience(playerid, 3)," ",GetPlayerScience(playerid, 4)," ",GetPlayerScience(playerid, 5)," ",GetPlayerScience(playerid, 6),"\n");
		fileWrite:write(Player[playerid].bank.."\n");
		fileWrite:write(Player[playerid].kills.."\n");
		fileWrite:write(Player[playerid].deaths.."\n");
		fileWrite:write(Player[playerid].leader.."\n");
		fileWrite:write(Player[playerid].inven.."\n");
		fileWrite:write(Player[playerid].homekey.."\n");
		fileWrite:write(Player[playerid].admin.."\n");
		fileWrite:write(Player[playerid].rank.."\n");
		fileWrite:write(Player[playerid].alchemylvl.."\n");
		fileWrite:write(Player[playerid].blacksmithxp.."\n");
		fileWrite:write(Player[playerid].blacksmithlvl.."\n");
		fileWrite:write(Player[playerid].runexp.."\n");
		fileWrite:write(Player[playerid].runelvl.."\n");
		fileWrite:write(Player[playerid].gmp1.."\n");
		fileWrite:write(Player[playerid].gmp2.."\n");
		fileWrite:write(Player[playerid].gmp3.."\n");
		fileWrite:write(Player[playerid].hunger," ",Player[playerid].thirst.."\n");
		fileWrite:write(Player[playerid].sedit_fatness*100," ",Player[playerid].sedit_scale*100 .."\n");
		
		fileWrite:close();
		else
               SendPlayerMessage(playerid,255,0,0,"WTF");
			   end
end

function LoadAccount(playerid)
        local fileRead = io.open("account/"..GetPlayerName(playerid)..".txt","r+");
        tempvar = fileRead:read("*l");		--name and password, these are global -> unprocessed, this line is read just to jump to line two
		tempvar = fileRead:read("*l");
		local result, classd = sscanf(tempvar,"d");
		if result == 1 then
		Player[playerid].class = classd;
				JAKAKLASA(playerid);
		end
        tempvar = fileRead:read("*l");
        local result, world, x, y, z, angle = sscanf(tempvar,"sdddd");
        if result == 1 then
                local currentWorld = GetPlayerWorld(playerid);
                if currentWorld ~= world then
                        if world == "ADDON\\ADDONWORLD.ZEN" then
                                SetPlayerWorld(playerid,"ADDON\\ADDONWORLD.ZEN","ADW_ENTRANCE");
                        elseif world == "AETEROX_LAGERFEUER.ZEN" then
                                SetPlayerWorld(playerid,"AETEROX_LAGERFEUER.ZEN","ADW_ENTRANCE");
                        elseif world == "OLDWORLD\\OLDWORLD.ZEN" then
                                SetPlayerWorld(playerid,"OLDWORLD\\OLDWORLD.ZEN","START");
                        elseif world == "WOM_COLONY\\WOM_COLONY.ZEN" then
                                SetPlayerWorld(playerid,"WOM_COLONY\\WOM_COLONY.ZEN","START");
                        elseif world == "WOM_COLONY\\DRAGONISLAND.ZEN" then
                                SetPlayerWorld(playerid,"WOM_COLONY\\DRAGONISLAND.ZEN","SHIP");
						elseif world == "WORLD.ZEN" then
							SetPlayerWorld(playerid,"WORLD.ZEN","START");
						elseif world == "OLDMINE.ZEN" then
							SetPlayerWorld(playerid,"OLDMINE.ZEN","INSEL_DORF_41");
						elseif world == "STADT.ZEN" then
							SetPlayerWorld(playerid,"STADT.ZEN","START");
                        end
                end
                SetPlayerPos(playerid, x, y, z);
                SetPlayerAngle(playerid,angle);
        end
		tempvar = fileRead:read("*l");
		local result, wyg_1, wyg_2, wyg_3, wyg_4 = sscanf(tempvar,"sdsd");
		if result == 1 then
			SetPlayerAdditionalVisual(playerid, wyg_1, wyg_2, wyg_3, wyg_4);
		end
		tempvar = fileRead:read("*l");
        local result, Sneaking, Thief, locks, blades, runes, Alchemy, trophies = sscanf(tempvar,"ddddddd");
        if result == 1 then
                SetPlayerScience(playerid, 0, Sneaking);
                SetPlayerScience(playerid, 1, Thief);
                SetPlayerScience(playerid, 2, locks);
                SetPlayerScience(playerid, 3, blades);
				SetPlayerScience(playerid, 4, runes);
                SetPlayerScience(playerid, 5, Alchemy);
				SetPlayerScience(playerid, 6, trophies);
        end
		tempvar = fileRead:read("*l");
		local result, bank = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].bank = bank;
		end
		tempvar = fileRead:read("*l");
		local result, kills = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].kills = kills;
		end
		tempvar = fileRead:read("*l");
		local result, deaths = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].deaths = deaths;
		end
		tempvar = fileRead:read("*l");
		local result, leader = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].leader = leader;
		end
		tempvar = fileRead:read("*l");
		local result, inven = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].inven = inven;
		end
		tempvar = fileRead:read("*l");
		local result, homekey = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].homekey = homekey;
		end
		tempvar = fileRead:read("*l");
		local result, admin = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].admin = admin;
		end
		tempvar = fileRead:read("*l");
        local result, rank = sscanf(tempvar,"s")
        if result == 1 then
        Player[playerid].rank = rank;
        end                   
        tempvar = fileRead:read("*l");
        local result, alchemylvl = sscanf(tempvar,"d")
        if result == 1 then
        Player[playerid].alchemylvl = tonumber(alchemylvl);
        end
        tempvar = fileRead:read("*l");
        local result, blacksmithxp = sscanf(tempvar,"d")
        if result == 1 then
        Player[playerid].blacksmithxp = tonumber(blacksmithxp);
        end
        tempvar = fileRead:read("*l");
        local result, blacksmithlvl = sscanf(tempvar,"d")
        if result == 1 then
        Player[playerid].blacksmithlvl = tonumber(blacksmithlvl);
        end
        tempvar = fileRead:read("*l");
        local result, runexp = sscanf(tempvar,"d")
        if result == 1 then
        Player[playerid].runexp = tonumber(runexp);
        end
        tempvar = fileRead:read("*l");
        local result, runelvl = sscanf(tempvar,"d")
        if result == 1 then
        Player[playerid].runelvl = tonumber(runelvl);
        end
		tempvar = fileRead:read("*l");
		local result, gmp1 = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].gmp1 = gmp1;
		end
		tempvar = fileRead:read("*l");
		local result, gmp2 = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].gmp2 = gmp2;
		end
		tempvar = fileRead:read("*l");
		local result, gmp3 = sscanf(tempvar,"d")
		if result == 1 then
		Player[playerid].gmp3 = gmp3;
        end
		tempvar = fileRead:read("*l");
		local result, hunger, thirst = sscanf(tempvar,"dd")
		if result == 1 then
			Player[playerid].hunger = hunger;
			Player[playerid].thirst = thirst;
        end
		tempvar = fileRead:read("*l");
		local result, fatness, scale = sscanf(tempvar,"dd")
		if result == 1 then
			Player[playerid].sedit_fatness = fatness/100;
			Player[playerid].sedit_scale = scale/100;
			
				SetPlayerFatness(playerid, Player[playerid].sedit_fatness);
				SetPlayerScale(playerid, 1, Player[playerid].sedit_scale, 1);
        end
		
		fileRead:close();
	local name=GetPlayerName(playerid);
	if io.open("account/"..name.."_letters.txt","r+") ~= nil then
		local playerFile=io.open("account/"..name.."_letters.txt","r+");
		local index=0;
		for line in io.lines("account/"..name.."_letters.txt","r+") do 
			local filestream=playerFile:read("*l");
			local result_lists;
			result_lists,Player[playerid].lists[index].mark_untouched, Player[playerid].lists[index].enabled_mark, Player[playerid].lists[index].d_day,Player[playerid].lists[index].d_month,Player[playerid].lists[index].d_year,Player[playerid].lists[index].author, Player[playerid].lists[index].text = sscanf(filestream,"dddddss");	
			if result_lists==0 then
			Player[playerid].lists[index].mark_untouched=0;
			Player[playerid].lists[index].enabled_mark=0;
			Player[playerid].lists[index].d_day=0;
			Player[playerid].lists[index].d_month=0;
			Player[playerid].lists[index].d_year=0;
			Player[playerid].lists[index].author="NULL";
			Player[playerid].lists[index].text="NULL";
			else
				index=index+1;
				Player[playerid].lists_count=Player[playerid].lists_count+1;
			end
		end
	end
	
end

function ReadItems(playerid)
local fileitems = io.open("Items//"..GetPlayerName(playerid)..".txt","r+");
if fileitems then
for line in fileitems:lines() do
local result, item, amount = sscanf(line,"sd");
if result == 1 then
if amount > 0 then
GiveItem(playerid,item,amount);
end
end
end
fileitems:close();
 else 
 end
 end

 
function OnPlayerDropItem(playerid, itemid, item_instance, amount, x, y, z)
		local oldValue;
local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
if file then
for line in file:lines() do 
		local result, item, value = sscanf(line,"sd");
		if result == 1 then
			if string.upper(item) == item_instance then
				oldValue = value;
			end
		end
	end
	file:close();
end
	
	if oldValue == nil then
		oldValue = 0;
	end
	
	local newValue = oldValue - amount;
	if newValue < 0 then
		newValue = 0;
	end
	
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","r+");
	local tempString = file:read("*a");
	file:close();
	local tempString = string.gsub(tempString,string.upper(item_instance).." "..oldValue,string.upper(item_instance).." "..newValue);
	local file = io.open(PATH_FILE..Player[playerid].nick..".txt","w+");
	file:write(tempString);
	file:close();


--[[if IsPlayerConnected(playerid) == 1 then
	local name = GetPlayerName(playerid);	
	local Inv = io.open(PATH_FILE..name..".txt","w+");
	Inv:close();
	for i = 0, 120 do 
GetPlayerItem(playerid,i);
end	
end]]


--[[if Player[playerid].timer == true then
SetTimerEx("Zapisatsuka",1000,0,playerid);
Player[playerid].timer = false
end]]

--Zapisatsuka(playerid);


--[[local name = GetPlayerName(playerid);
LogString("DropItem",string.format("%s %s %s %s",name,"скинул",item_instance, amount));]]
end

function OnPlayerTakeItem(playerid, itemID, item_instance, amount, x, y, z)
--[[local file = io.open("takeshmot.txt","w+");
file:write(GetPlayerName(playerid).." ["..os.date("%c").."] поднял предмет "..item_instance.." "..amount..".".."\n");
file:close();]]
--[[local name = GetPlayerName(playerid);
LogString("TakeItem",string.format("%s %s %s %s",name,"поднял",item_instance, amount));]]
Player[playerid].allowpick = true;
for k,names in pairs(protected_items)do
    if Player[playerid].allowpick == true then
        if string.upper(item_instance) == string.upper(protected_items[k]) then
            Player[playerid].allowpick = false;
        else
            Player[playerid].allowpick = true;
        end
    end
end
if Player[playerid].allowpick == true 
and itemID ~= ITEM_UNSYNCHRONIZED 
then
Player[playerid].allowpick = false;
else
Player[playerid].removeawaynum = Player[playerid].removeawaynum + 1;
SetTimerEx("Remove_protected_items",500*Player[playerid].removeawaynum,0,tostring(playerid.." "..item_instance.." "..amount));
SendPlayerMessage(playerid,255,0,0,"Предмет запрещен. Вы не можете подобрать его.");
end
end

function JAKAKLASA(playerid)

	if Player[playerid].class == 1 then
		class1(playerid);
	elseif Player[playerid].class == 2 then
		class2(playerid);
	elseif Player[playerid].class == 3 then
		class3(playerid);
	elseif Player[playerid].class == 4 then
		class4(playerid);
	elseif Player[playerid].class == 5 then
		class5(playerid);
	elseif Player[playerid].class == 6 then
		class6(playerid);
	elseif Player[playerid].class == 7 then
		class7(playerid);
	elseif Player[playerid].class == 8 then
		class8(playerid);
	elseif Player[playerid].class == 9 then
		class9(playerid);
	elseif Player[playerid].class == 10 then
		class10(playerid);
	elseif Player[playerid].class == 11 then
		class11(playerid);
	elseif Player[playerid].class == 12 then
		class12(playerid);
	elseif Player[playerid].class == 13 then
		class13(playerid);
	elseif Player[playerid].class == 14 then
		class14(playerid);
    elseif Player[playerid].class == 15 then
		class15(playerid);
	elseif Player[playerid].class == 16 then
		class16(playerid);	
	elseif Player[playerid].class == 17 then
		class18(playerid);	
	elseif Player[playerid].class == 18 then
		class18(playerid);
	elseif Player[playerid].class == 19 then
		class19(playerid);
	elseif Player[playerid].class == 20 then
		class20(playerid);
	elseif Player[playerid].class == 21 then
		class21(playerid);
	elseif Player[playerid].class == 22 then
		class22(playerid);
	elseif Player[playerid].class == 23 then
		class23(playerid);
	elseif Player[playerid].class == 24 then
		class24(playerid);
    elseif Player[playerid].class == 25 then
		class25(playerid);
	end
	
	GameTextForPlayer(playerid,6300,5500,"Загрузка...","Font_Old_20_White_Hi.TGA",255,255,0,2000);
	SetTimerEx("Checkout_Stats",2000,0,playerid);
end


function Checkout_Stats(playerid)
	Player[playerid].max_health=GetPlayerMaxHealth(playerid);
	Player[playerid].strength=GetPlayerStrength(playerid);
	Player[playerid].dexterity=GetPlayerDexterity(playerid);
	HT_Check(playerid);
end

--ЛОГИН\РЕГИСТРАЦИЯ
function welcomeagain (playerid)
local snd = random(9)
if snd == 0 then
local welcomeagain = CreateSound("DIA_1013_BANDIT_AMBUSH_01_01.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 1 then
local welcomeagain = CreateSound("DIA_1013_BANDIT_AMBUSH_01_01.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 2 then
local welcomeagain = CreateSound("DIA_1061_WACHE_PERM_01_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 3 then
local welcomeagain = CreateSound("DIA_ATTILA_HALLO_09_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 4 then
local welcomeagain = CreateSound("DIA_CANTHAR_HALLO_09_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 5 then
local welcomeagain = CreateSound("DIA_DAR_HALLO_03_01.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 6 then
local welcomeagain = CreateSound("DIA_JARVIS_HELLO_04_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 7 then
local welcomeagain = CreateSound("DIA_LEE_HALLO_04_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 8 then
local welcomeagain = CreateSound("DIA_LOTHAR_HELLOAGAIN_01_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
elseif snd == 9 then
local welcomeagain = CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV")
PlayPlayerSound(playerid, welcomeagain)
end
end

function CMD_ZALOGUJ(playerid, params)
local result, passwd = sscanf(params,"s");
local name = GetPlayerName(playerid);
		if result == 1 then
		local file = io.open("account/"..Player[playerid].nick..".txt","r+");
		local buff;
        if file then        
		buff = file:read();
		file:close();    
		end    
		if buff == nil then        
		SendPlayerMessage(playerid,0,255,0,"Ваш профиль поврежден. Обратитесь за помощью на форум в раздел Техподдержка");
		SendPlayerMessage(playerid,0,255,0,"http://heart-of-roleplay.tk.hostinghood.com/");
		LogString("CrashedProfiles",name);
		Kick(playerid);
		else
		local file = io.open("account/"..Player[playerid].nick..".txt","r+");
			if file then
				local tempvar = file:read("*l");
				local result, trashName, pass = sscanf(tempvar,"ss");
					if result == 1 then
					if pass == passwd then
					Player[playerid].password = passwd;
					FreezePlayer(playerid,0);
					logged(playerid);
					else
					SendPlayerMessage(playerid,255,0,0,"Неверный пароль!");
					for i = 0, MAX_PLAYERS - 1 do
					if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
					SendPlayerMessage(i,255,154,100,string.format("%s %s %s","(INFO):",GetPlayerName(playerid),"попытка войти, неверный пароль."));			
					end
					end
					end
				end
				file:close();
				else
				SendPlayerMessage(playerid,255,0,0,"Вы не зарегистрированы. Используй: /рег (пароль)");
			end
		end
		end
end

function logged(playerid)
	LoadAccount(playerid);
	FreezePlayer(playerid,0);
	Player[playerid].loggedIn = 1;
	ReadItems(playerid);
	PlayPlayerSound(playerid,CreateSound("DIA_DIEGOOW_HALLO_11_00.WAV"));
	Player[playerid].timer = true;
	Player[playerid].Mute = false;
	if GetPlayerName(playerid) == "Robert" then
	SetPlayerColor(playerid,255,0,0);
	elseif GetPlayerName(playerid) == "Торговец" then
	SetPlayerColor(playerid,255,255,255);
	end
	if Player[playerid].admin == 0 then
	SendPlayerMessage(playerid,0,255,60,"Вы успешно вошли! Полезные команды: /помощь, /правила");
	elseif Player[playerid].admin == 111 then
	SendPlayerMessage(playerid,0,255,60,"Вы успешно вошли! Права доступа: Саппорт");
	--SetPlayerColor(playerid,255,255,0);
	for i = 0, MAX_PLAYERS - 1 do
	if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
	SendPlayerMessage(i,255,154,100,string.format("%s %s %s","(INFO):",GetPlayerName(playerid),"залогинился. (саппорт)"));			
	end
	end
	elseif Player[playerid].admin == 222 then
	SendPlayerMessage(playerid,0,255,60,"Вы успешно вошли! Права доступа: Модератор");
	--SetPlayerColor(playerid,255,0,255);
	for i = 0, MAX_PLAYERS - 1 do
	if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
	SendPlayerMessage(i,255,154,100,string.format("%s %s %s","(INFO):",GetPlayerName(playerid),"залогинился. (модератор)"));			
	end
	end
	elseif Player[playerid].admin == 333 then
	SendPlayerMessage(playerid,0,255,60,"Вы успешно вошли! Права доступа: Глобальный модератор");
	--SetPlayerColor(playerid,0,255,0);
	for i = 0, MAX_PLAYERS - 1 do
	if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
	SendPlayerMessage(i,255,154,100,string.format("%s %s %s","(INFO):",GetPlayerName(playerid),"залогинился. (глобальный модератор)"));			
	end
	end
	elseif Player[playerid].admin == 444 then
	SendPlayerMessage(playerid,0,255,60,"Вы успешно вошли! Права доступа: Администратор");
	--SetPlayerColor(playerid,255,0,0);
	for i = 0, MAX_PLAYERS - 1 do
	if Player[i].admin == 444 or Player[i].admin == 333 or Player[i].admin == 222 or Player[i].admin == 111 then
	SendPlayerMessage(i,255,154,100,string.format("%s %s %s","(INFO):",GetPlayerName(playerid),"залогинился. (администратор)"));			
	end
	end
	end
	
	
	--Hunger
	--htt[playerid]=SetTimerEx("HT_Counter",1000*4*60,1,playerid);
	ShowTexture(playerid,hg_bg);
	ShowTexture(playerid,th_bg);
	ShowDraw(playerid,hg_dr);
	ShowDraw(playerid,th_dr);
	--
	
end

function AutoSave2(playerid)
SaveAccount(playerid);
end

function welcome (playerid)
local snd = random(2)
if snd == 0 then
local welcome = CreateSound("DIA_1015_BANDIT_AMBUSH_06_00.WAV")
PlayPlayerSound(playerid, welcome)
elseif snd == 1 then
local welcome = CreateSound("DIA_BABO_HELLO_03_00.WAV")
PlayPlayerSound(playerid, welcome)
elseif snd == 2 then
local welcome = CreateSound("DIA_GESTATH_HALLO_09_01.WAV")
PlayPlayerSound(playerid, welcome)
end
end

function CMD_ZAREJESTRUJ(playerid, params)
local result, passwd = sscanf(params,"s");
	if result == 1 and not(string.find(string.lower(passwd), string.lower(" "))) then
		local fileRead = io.open("account/"..GetPlayerName(playerid)..".txt","r+");
			if fileRead then
				SendPlayerMessage(playerid,255,0,0,"Такой аккаунт уже есть!");
				fileRead:close();	
			else
				Player[playerid].password = passwd;
				SendPlayerMessage(playerid,0,255,60,"Аккаунт создан!");
				SendPlayerMessage(playerid,0,255,60,"Полезные команды: /помощь, /правила");
				FreezePlayer(playerid,0);
				class1(playerid);
				Player[playerid].admin = 0;
				Player[playerid].leader = 0;
				Player[playerid].kills = 0;
				Player[playerid].deaths = 0;
				Player[playerid].bank = 0;
				Player[playerid].timer = true;
				Player[playerid].craft = 0;
				Player[playerid].rank = 0;
				Player[playerid].alchemylvl = 0;
				Player[playerid].blacksmithxp = 0;
				Player[playerid].blacksmithlvl = 0;
				Player[playerid].runexp = 0;
				Player[playerid].runelvl = 0;
				Player[playerid].gmp1 = 0;
				Player[playerid].gmp2 = 0;
				Player[playerid].gmp3 = 0;
				SaveAccount(playerid);
				UnMute(playerid);
				Player[playerid].loggedIn = 1;
				
				EquipArmor(playerid,"VLK_ARMOR_L");
				EquipMeleeWeapon(playerid,"ItMwPickaxe");
				GiveItem(playerid,"ItMw_2H_Axe_L_01",1);
				GiveItem(playerid,"ITFO_APPLE",3);
				GiveItem(playerid,"ITFO_CHEESE",3);
				GiveItem(playerid,"ITFO_WATER",4);
				GiveItem(playerid,"ITMI_BROOM",1);
				GiveItem(playerid,"ITFO_BREAD",3);
				GameTextForPlayer(playerid,6300,5500,"Загрузка...","Font_Old_20_White_Hi.TGA",255,255,0,2000);
				SetTimerEx("Checkout_Stats",2000,0,playerid);
				
				--Hunger
				--htt[playerid]=SetTimerEx("HT_Counter",1000*4*60,1,playerid);
				ShowTexture(playerid,hg_bg);
				ShowTexture(playerid,th_bg);
				ShowDraw(playerid,hg_dr);
				ShowDraw(playerid,th_dr);
				--
				
			end
	else
		SendPlayerMessage(playerid,255,0,0,"Используй /рег (пароль, не содержащий пробелов)");
end
end


--ИНФО
class_id = {"Простолюдин","Боец-новичек","Боец","Опытный боец","Мастер","Послушник","Старший послушник","Маг-ученик","Маг","Магистр","Оруженосец","Рыцарь","Паладин","Лорд-паладин","Лучник-новичек","Лучник","Мастер-лучник","Горожанин","Ремесленник","Подмастерье","Рудокоп","Лесоруб","Крестьянин","Старший крестьянин","GodGame"} -- 25 классов
leader_id = {"Воевода","Магистр","Лорд-паладин","Губернатор"} -- 5

function CMD_SHOWBANK(playerid, params)
local result, pid = sscanf(params,"d")
local money = Player[pid].bank
local kills = Player[pid].kills
local deaths = Player[pid].deaths
local class = Player[pid].class
local inven = Player[pid].inven
local leader = Player[pid].leader
local home = Player[pid].homekey
local health = GetPlayerHealth(pid);
local maxhealth = GetPlayerMaxHealth(pid);
local maxmana = GetPlayerMaxMana(pid);
local mana = GetPlayerMana(pid);
local str = GetPlayerStrength(pid);
local dex = GetPlayerDexterity(pid);
if Player[playerid].leader >= 1 or Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 then
if Player[playerid].loggedIn == 1 and Player[pid].loggedIn == 1
then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s %d","Информация:",GetPlayerName(pid),"|","Медяков:",money));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d %s %s %d","Смертей:",deaths,"|","Убийств:",kills));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Снаряжение:",inven));
if home >= 1 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Ключ от склада:",home));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","Ключ от склада: Нету"));
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Ключ:",home));
if class <= 26 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Характеристика:",class_id[class]));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","ID класса:",class));
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Должность: ",Player[pid].rank));
if leader == 0 then
SendPlayerMessage(playerid,0,255,255,string.format("%s","Лидер: Нет"));
elseif leader <= 6 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Лидер:",leader_id[leader]));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","Лидер: Нет"));
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s %s %s %s %s %s","HP:",maxhealth,"/",health,"|","MP",maxmana,"/",mana));
SendPlayerMessage(playerid,0,255,255,string.format("%s %s %s %s %s","Сила:",str,"|","Ловкость:",dex));
else
		SendPlayerMessage(playerid,230,230,230,"Вы не залогинились! (или игрок не залогинился)");
		end
else
		SendPlayerMessage(playerid,230,230,230,"Вы не админ/лидер чтобы пользоваться этой командой");
		end
end

function CMD_DROP(playerid,params)
local result, slot; result, slot, Player[playerid].amount_drop = sscanf(params, "dd");
	if Player[playerid].loggedIn == 1 then
		Player[playerid].Drop = 1;
		GetPlayerItem(playerid, slot);
	else
	SendPlayerMessage(playerid, 255, 0, 0, "Пожалуйста, войдите в свой аккаунт!");
end
end

function CMD_SHOWSTATS(playerid)
if Player[playerid].loggedIn == 1 then
local money = Player[playerid].bank
local kills = Player[playerid].kills
local deaths = Player[playerid].deaths
local class = Player[playerid].class
local inven = Player[playerid].inven
local leader = Player[playerid].leader
local home = Player[playerid].homekey
local hour,minute = GetTime();
GameTextForPlayer(playerid,2500,4000,string.format("%s %02d:%02d","Игровое время:",hour,minute),"Font_Old_20_White_Hi.TGA",255,255,0,10000);
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Медяков:",money));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Убийств:",kills));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Смертей:",deaths));
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Снаряжение:",inven));
if home >= 1 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Ключ от склада:",home));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","Ключ от склада: Нету"));
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","ID:",playerid));
if class <= 26 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Характеристика:",class_id[class]));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","ID класса:",class));
end
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Должность:",Player[playerid].rank));
if leader == 0 then
SendPlayerMessage(playerid,0,255,255,string.format("%s","Лидер: Нет"));
elseif leader <= 6 then
SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Лидер:",leader_id[leader]));
else
SendPlayerMessage(playerid,0,255,255,string.format("%s","Лидер: Нет"));
end
end
end

function ShowInfo(playerid)
if Player[playerid].loggedIn == 1 then
local money = Player[playerid].bank
local class = Player[playerid].class
local inven = Player[playerid].inven
local leader = Player[playerid].leader
local hour,minute = GetTime();
	textureid = CreateTexture(2600, 3200, 4200, 4600, "Frame_GMPA.TGA")
		drawid1 = CreateDraw(2700, 3300, string.format("%s %d" , "Медяков: " , money), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		drawid2 = CreateDraw(2700, 3550, string.format("%s %s" , "Характеристика: " , class_id[class]), "Font_Old_10_White_Hi.TGA", 255, 255, 255)--
		drawid3 = CreateDraw(2700, 3800, string.format("%s %d" , "Пропусков: " , inven), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		if leader == 0 then
			drawid4 = CreateDraw(2700, 4050, string.format("%s" , "Лидер: Нет"), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		elseif leader <= 4 then
			drawid4 = CreateDraw(2700, 4050, string.format("%s %s" , "Лидер: " , leader_id[leader]), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		else
			drawid4 = CreateDraw(2700, 4050, string.format("%s" , "Лидер: Нет"), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		end
		drawid5 = CreateDraw(2700, 4300, string.format("%s %d %d" , "Время: " , hour,minute), "Font_Old_10_White_Hi.TGA", 255, 255, 255)
		ShowTexture(playerid,textureid);
		ShowDraw(playerid,drawid1);
		ShowDraw(playerid,drawid2);
		ShowDraw(playerid,drawid3);
		ShowDraw(playerid,drawid4);
		ShowDraw(playerid,drawid5);
end
end

function HideInfo(playerid)
if Player[playerid].loggedIn == 1 then
	HideTexture(playerid,textureid);
		HideDraw(playerid,drawid1);
		HideDraw(playerid,drawid2);
		HideDraw(playerid,drawid3);
		HideDraw(playerid,drawid4);
		HideDraw(playerid,drawid5);
		DestroyTexture(textureid);
		DestroyDraw(drawid1);
		DestroyDraw(drawid2);
		DestroyDraw(drawid3);
		DestroyDraw(drawid4);
		DestroyDraw(drawid5);
end
end

function ShowNews(playerid)
if Player[playerid].loggedIn == 1 then
		ShowTexture(playerid,texturenews);
		ShowDraw(playerid,drawnews1);
		ShowDraw(playerid,drawnews2);
		ShowDraw(playerid,drawnews3);
		ShowDraw(playerid,drawnews4);
		ShowDraw(playerid,drawnews5);
		ShowDraw(playerid,drawnews6);
end
end

function HideNews(playerid)
if Player[playerid].loggedIn == 1 then
	HideTexture(playerid,texturenews);
		HideDraw(playerid,drawnews1);
		HideDraw(playerid,drawnews2);
		HideDraw(playerid,drawnews3);
		HideDraw(playerid,drawnews4);
		HideDraw(playerid,drawnews5);
		HideDraw(playerid,drawnews6);
		DestroyTexture(texturenews);
		DestroyDraw(drawnews1);
		DestroyDraw(drawnews2);
		DestroyDraw(drawnews3);
		DestroyDraw(drawnews4);
		DestroyDraw(drawnews5);
		DestroyDraw(drawnews6);
end
end

function CMD_SETRANK(playerid, params)
local result,ppid , work = sscanf(params, "ds");
if result == 1 and Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 or Player[playerid].leader > 0 then
		Player[ppid].rank = work
		SendPlayerMessage(ppid,255,205,0,"Вы получили должность: "..work);
		SendPlayerMessage(playerid,47,198,215,string.format("%s %s %s %s","Вы назначили должность: ",work," игроку : ",GetPlayerName(ppid)));
	SaveAccount(ppid);
end	
end

function CMD_SETKEYS(playerid, params)
local result,ppid , keys = sscanf(params, "dd");
if result == 1 and Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 or Player[playerid].admin == 111 then
		Player[ppid].homekey = keys
		SendPlayerMessage(ppid,255,205,0,"Вы получили ключи от склада: "..keys);
		SendPlayerMessage(playerid,47,198,215,string.format("%s %d %s %s","Вы выдали:",keys,"ключей от склада игроку: ",GetPlayerName(ppid)));
	SaveAccount(ppid);
end	
end

function CMD_HEAL(playerid, params)
local result, pid = sscanf(params,"d");
local heal = GetPlayerMaxHealth(pid);
		if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
		SetPlayerHealth(pid,heal)
		SendPlayerMessage(pid,255,205,0,string.format("%s %s",GetPlayerName(playerid),"исцелил вас."));
		SendPlayerMessage(playerid,255,205,0,string.format("%s %s%s","Вы исцелили игрока",GetPlayerName(pid),"."));		
		end
end

function CMD_Name(playerid, params)
 
	if Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
 
		local result,id,name = sscanf(params,"ds");
 
		if result == 1 then
 
			if IsPlayerConnected(id) == 1 then
 
				local adminname = GetPlayerName(playerid);
				local beforename = GetPlayerName(id);
				if SetPlayerName(id,name) == 1 then
					SendPlayerMessage(playerid,0,255,0,string.format("%s %s %s %s","Вы изменили ник игрока",beforename,"на",name));
					SendPlayerMessage(id,0,255,0,string.format("%s %s %s %s %s %s","Админ",adminname,"изменил Ваш ник",beforename,"на",name));
					LogString("AdminLog",string.format("%s %s %s %s %s",adminname,"changed",beforename,"to",name));
				else
					SendPlayerMessage(playerid,255,250,200,"(Server) Невозможно сменить ник.");
				end
			else
				SendPlayerMessage(playerid,255,250,200,string.format("%s %d %s","(Server): Player ID",id,"is not connected with server."));
			end
		else
			SendPlayerMessage(playerid,255,250,200,"Используй: /ник (ид_игрока) (никнейм)");
		end
	else
		SendPlayerMessage(playerid,255,250,200,"(СЕРВЕР): Ты не админ!");
	end
end

--КЛАССЫ
function CMD_AWANS(playerid, params)
local result,ppid , clid = sscanf(params, "dd");
if result == 1 and Player[playerid].loggedIn == 1 and Player[playerid].admin == 444 or Player[playerid].admin == 333 or Player[playerid].admin == 222 then
	if clid <= 25 then
		Player[ppid].class = clid;
		JAKAKLASA(ppid);
		SendPlayerMessage(ppid,255,205,0,"Вы получили характеристики: "..class_id[clid]);
		SendPlayerMessage(playerid,47,198,215,string.format("%s %s %s","Вы выдали характеристики",class_id[clid]..":",GetPlayerName(ppid)));
	end
	SaveAccount(ppid);
end	
end

function class1(id) -- простолюдин
SetPlayerMana(id,30);
SetPlayerMaxMana(id,30);  
SetPlayerHealth(id,200);
SetPlayerMaxHealth(id,200);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,10);  
SetPlayerDexterity(id,10);  
SetPlayerSkillWeapon(id,SKILL_1H,27);
SetPlayerSkillWeapon(id,SKILL_2H,27);
SetPlayerSkillWeapon(id,SKILL_BOW,27);
SetPlayerSkillWeapon(id,SKILL_CBOW,27);
SetPlayerMagicLevel(id,0);
end

function class2(id) -- боец-новичек
SetPlayerMana(id,30);
SetPlayerMaxMana(id,30);  
SetPlayerHealth(id,300);
SetPlayerMaxHealth(id,300);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,20);  
SetPlayerDexterity(id,20);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class3(id) -- боец
SetPlayerMana(id,60);
SetPlayerMaxMana(id,60);  
SetPlayerHealth(id,450);
SetPlayerMaxHealth(id,450);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,30);
SetPlayerDexterity(id,30);  
SetPlayerSkillWeapon(id,SKILL_1H,57);
SetPlayerSkillWeapon(id,SKILL_2H,57);
SetPlayerSkillWeapon(id,SKILL_BOW,30);
SetPlayerSkillWeapon(id,SKILL_CBOW,30);
SetPlayerMagicLevel(id,0);
end

function class4(id) -- опытный боец
SetPlayerMana(id,60);
SetPlayerMaxMana(id,60);
SetPlayerHealth(id,600);
SetPlayerMaxHealth(id,600);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,40);
SetPlayerDexterity(id,40);
SetPlayerSkillWeapon(id,SKILL_1H,60);
SetPlayerSkillWeapon(id,SKILL_2H,60);
SetPlayerSkillWeapon(id,SKILL_BOW,55);
SetPlayerSkillWeapon(id,SKILL_CBOW,55);
SetPlayerMagicLevel(id,0);
end

function class5(id) -- мастер
SetPlayerMana(id,60);
SetPlayerMaxMana(id,60);  
SetPlayerHealth(id,800);
SetPlayerMaxHealth(id,800);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,60);  
SetPlayerDexterity(id,60);
SetPlayerSkillWeapon(id,SKILL_1H,90);
SetPlayerSkillWeapon(id,SKILL_2H,90);
SetPlayerSkillWeapon(id,SKILL_BOW,90);
SetPlayerSkillWeapon(id,SKILL_CBOW,90);
SetPlayerMagicLevel(id,0);
end

function class6(id) -- послушник
SetPlayerMana(id,100);
SetPlayerMaxMana(id,100);
SetPlayerHealth(id,300);
SetPlayerMaxHealth(id,300);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,15);  
SetPlayerDexterity(id,15);  
SetPlayerSkillWeapon(id,SKILL_1H,27);
SetPlayerSkillWeapon(id,SKILL_2H,27);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,1);
end

function class7(id) -- старший послушник
SetPlayerMana(id,100);
SetPlayerMaxMana(id,100);  
SetPlayerHealth(id,400);
SetPlayerMaxHealth(id,400);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,20);  
SetPlayerDexterity(id,20);  
SetPlayerSkillWeapon(id,SKILL_1H,27);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,2);
end

function class8(id) -- маг-ученик
SetPlayerMana(id,200);
SetPlayerMaxMana(id,200);  
SetPlayerHealth(id,500);
SetPlayerMaxHealth(id,500);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,20);  
SetPlayerDexterity(id,20);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,55);
SetPlayerSkillWeapon(id,SKILL_BOW,30);
SetPlayerSkillWeapon(id,SKILL_CBOW,30);
SetPlayerMagicLevel(id,4);
end

function class9(id) -- маг
SetPlayerMana(id,300);
SetPlayerMaxMana(id,300);  
SetPlayerHealth(id,600);
SetPlayerMaxHealth(id,600);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,20);  
SetPlayerDexterity(id,20);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,55);
SetPlayerSkillWeapon(id,SKILL_BOW,30);
SetPlayerSkillWeapon(id,SKILL_CBOW,30);
SetPlayerMagicLevel(id,5);
end

function class10(id) -- магистр
SetPlayerMana(id,500);
SetPlayerMaxMana(id,500);  
SetPlayerHealth(id,800);
SetPlayerMaxHealth(id,800);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,30); 
SetPlayerDexterity(id,30);
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,55);
SetPlayerSkillWeapon(id,SKILL_BOW,30);
SetPlayerSkillWeapon(id,SKILL_CBOW,30);
SetPlayerMagicLevel(id,6);
end

function class11(id) -- оруженосец
SetPlayerMana(id,100);
SetPlayerMaxMana(id,100);  
SetPlayerHealth(id,300);
SetPlayerMaxHealth(id,300);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,20);  
SetPlayerDexterity(id,20);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class12(id) -- рыцарь
SetPlayerMana(id,120);
SetPlayerMaxMana(id,120);  
SetPlayerHealth(id,450);
SetPlayerMaxHealth(id,450);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,30); 
SetPlayerDexterity(id,30);
SetPlayerSkillWeapon(id,SKILL_1H,57);
SetPlayerSkillWeapon(id,SKILL_2H,57);
SetPlayerSkillWeapon(id,SKILL_BOW,30);
SetPlayerSkillWeapon(id,SKILL_CBOW,30);
SetPlayerMagicLevel(id,0);
end

function class13(id) -- паладин
SetPlayerMana(id,200);
SetPlayerMaxMana(id,200);
SetPlayerHealth(id,600);
SetPlayerMaxHealth(id,600);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,40);  
SetPlayerDexterity(id,40);  
SetPlayerSkillWeapon(id,SKILL_1H,60);
SetPlayerSkillWeapon(id,SKILL_2H,60);
SetPlayerSkillWeapon(id,SKILL_BOW,55);
SetPlayerSkillWeapon(id,SKILL_CBOW,55);
SetPlayerMagicLevel(id,0);
end

function class14(id) -- лорд-паладин
SetPlayerMana(id,400);
SetPlayerMaxMana(id,400);  
SetPlayerHealth(id,800);
SetPlayerMaxHealth(id,800);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,60);  
SetPlayerDexterity(id,60);  
SetPlayerSkillWeapon(id,SKILL_1H,90);
SetPlayerSkillWeapon(id,SKILL_2H,90);
SetPlayerSkillWeapon(id,SKILL_BOW,90);
SetPlayerSkillWeapon(id,SKILL_CBOW,90);
SetPlayerMagicLevel(id,5);
end

function class15(id) -- лучник-новичек
SetPlayerMana(id,60);
SetPlayerMaxMana(id,60);
SetPlayerHealth(id,300);
SetPlayerMaxHealth(id,300);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,15);
SetPlayerDexterity(id,30);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,45);
SetPlayerSkillWeapon(id,SKILL_CBOW,45);
SetPlayerMagicLevel(id,0);
end

function class16(id) -- лучник
SetPlayerMana(id,60);
SetPlayerMaxMana(id,60); 
SetPlayerHealth(id,450);
SetPlayerMaxHealth(id,450);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,25); 
SetPlayerDexterity(id,40);
SetPlayerSkillWeapon(id,SKILL_1H,57);
SetPlayerSkillWeapon(id,SKILL_2H,57);
SetPlayerSkillWeapon(id,SKILL_BOW,55);
SetPlayerSkillWeapon(id,SKILL_CBOW,55);
SetPlayerMagicLevel(id,0);
end

function class17(id) -- мастер-лучник
SetPlayerMana(id,60);
SetPlayerMaxMana(id,60);  
SetPlayerHealth(id,600);
SetPlayerMaxHealth(id,600);
SetPlayerAcrobatic(id,1);
SetPlayerStrength(id,55);  
SetPlayerDexterity(id,70);  
SetPlayerSkillWeapon(id,SKILL_1H,90);
SetPlayerSkillWeapon(id,SKILL_2H,57);
SetPlayerSkillWeapon(id,SKILL_BOW,90);
SetPlayerSkillWeapon(id,SKILL_CBOW,90);
SetPlayerMagicLevel(id,0);
end

function class18(id) -- горожанин
SetPlayerMana(id,50);
SetPlayerMaxMana(id,50);  
SetPlayerHealth(id,250);
SetPlayerMaxHealth(id,250);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,15);  
SetPlayerDexterity(id,15);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class19(id) -- ремесленник 
SetPlayerMana(id,50);
SetPlayerMaxMana(id,50);  
SetPlayerHealth(id,300);
SetPlayerMaxHealth(id,300);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,20);  
SetPlayerDexterity(id,20);  
SetPlayerSkillWeapon(id,SKILL_1H,57);
SetPlayerSkillWeapon(id,SKILL_2H,57);
SetPlayerSkillWeapon(id,SKILL_BOW,30);
SetPlayerSkillWeapon(id,SKILL_CBOW,30);
SetPlayerMagicLevel(id,0);
end

function class20(id) -- подмастерье
SetPlayerMana(id,50);
SetPlayerMaxMana(id,50);  
SetPlayerHealth(id,250);
SetPlayerMaxHealth(id,250);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,15);  
SetPlayerDexterity(id,15);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class21(id) -- рудокоп
SetPlayerMana(id,30);
SetPlayerMaxMana(id,30);  
SetPlayerHealth(id,250);
SetPlayerMaxHealth(id,250);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,12);  
SetPlayerDexterity(id,12);  
SetPlayerSkillWeapon(id,SKILL_1H,27);
SetPlayerSkillWeapon(id,SKILL_2H,27);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class22(id) -- лесоруб
SetPlayerMana(id,30);
SetPlayerMaxMana(id,30);  
SetPlayerHealth(id,250);
SetPlayerMaxHealth(id,250);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,14);  
SetPlayerDexterity(id,14);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class23(id) -- крестьянин
SetPlayerMana(id,30);
SetPlayerMaxMana(id,30);  
SetPlayerHealth(id,250);
SetPlayerMaxHealth(id,250);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,12);  
SetPlayerDexterity(id,12);  
SetPlayerSkillWeapon(id,SKILL_1H,27);
SetPlayerSkillWeapon(id,SKILL_2H,27);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class24(id) -- старший крестьянин
SetPlayerMana(id,30);
SetPlayerMaxMana(id,30);  
SetPlayerHealth(id,250);
SetPlayerMaxHealth(id,250);
SetPlayerAcrobatic(id,0);
SetPlayerStrength(id,15);  
SetPlayerDexterity(id,15);  
SetPlayerSkillWeapon(id,SKILL_1H,30);
SetPlayerSkillWeapon(id,SKILL_2H,30);
SetPlayerSkillWeapon(id,SKILL_BOW,25);
SetPlayerSkillWeapon(id,SKILL_CBOW,25);
SetPlayerMagicLevel(id,0);
end

function class25(id) -- GodGame
SetPlayerMana(id,2000);
SetPlayerMaxMana(id,2000);  
SetPlayerHealth(id,3000);
SetPlayerMaxHealth(id,3000);
SetPlayerWalk(id,"HumanS_Sprint.mds");
SetPlayerAcrobatic(id,1);
SetPlayerStrength(id,250);  
SetPlayerDexterity(id,250);  
SetPlayerSkillWeapon(id,SKILL_1H,100);
SetPlayerSkillWeapon(id,SKILL_2H,100);
SetPlayerSkillWeapon(id,SKILL_BOW,100);
SetPlayerSkillWeapon(id,SKILL_CBOW,100);
SetPlayerMagicLevel(id,6);
end

--ИНВЕНТАРЬ
function CMD_INV(playerid, params)
local result, pid = sscanf(params,"d")
	Player[pid].inven = 1;
	SendPlayerMessage(pid,255 , 255 ,94,"Вы получили возможность забрать свое снаряжение. ( /снаряжение )");
	SendPlayerMessage(playerid,0,255,255,string.format("%s %s","Вы выдали снаряжение",GetPlayerName(pid)));
end

function CMD_INVEN(playerid)

local class = Player[playerid].rank
if Player[playerid].inven < 1 then
SendPlayerMessage(playerid,255,250,200,"Обратитесь к лидеру за инвентарем");
else
Player[playerid].inven = Player[playerid].inven - 1
if class == "Нет" then

elseif class == "рабочий" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_KOZA_A",1);
GiveItem(playerid,"ItMw_1H_Bau_Axe",1);

elseif class == "крестьянин" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_BAU_L",1);
GiveItem(playerid,"ItMw_1H_Bau_Axe",1);

elseif class == "ст_крестьянин" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",20);
GiveItem(playerid,"ITMI_BROOM",20);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_BAU_M",1);
GiveItem(playerid,"ItMw_Sense",1);
GiveItem(playerid,"ItMw_1H_Bau_Axe",1);

elseif class == "рядовой" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Mil_Sword",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MIL_L",1);


elseif class == "капрал" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Sword_Broad_01",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"GRD_ARMOR_L",1);


elseif class == "послушник" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Axe",1);
GiveItem(playerid,"ItMw_1H_Nov_Mace",1);
GiveItem(playerid,"ITRU_LIGHT",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_NOV_L",1);

elseif class == "ст_послушник" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Axe",1);
GiveItem(playerid,"ItMw_Richtstab",1);
GiveItem(playerid,"ITRU_LIGHT",1);
GiveItem(playerid,"ITRU_LIGHTHEAL",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_NOV_L",1);

elseif class == "маг-ученик" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Nov_Mace",1);
GiveItem(playerid,"ITRU_LIGHT",1);
GiveItem(playerid,"ITRU_MEDIUMHEAL",1);
GiveItem(playerid,"ITMI_RAKE",20);
GiveItem(playerid,"ITMI_BROOM",20);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"KDF_ARMOR_L",1);

elseif class == "маг" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_Addon_Stab01",1);
GiveItem(playerid,"ITRU_LIGHT",1);
GiveItem(playerid,"ITRU_LIGHTHEAL",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_KDF_L",1);

elseif class == "боец" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_SLD_L",1);

elseif class == "сержант" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Sword_Long_01",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_SLD_M",1);

elseif class == "старшина" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Sword_Long_03",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_SLD_H",1);

elseif class == "странник" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Sword_Long_05",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_KOZA_M",1);


elseif class == "бродяга" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Mace_War_04",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_KOZA_L",1);


elseif class == "мятежник" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MTZ_A",1);

elseif class == "разведчик" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MTZ_L",1);

elseif class == "рубака" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MTZ_M",1);


elseif class == "капитан" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MTZ_H",1);

elseif class == "советник" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MTZ_S",1);

elseif class == "король" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Mil_Sword",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_MTZ",1);

elseif class == "граф" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Mil_Sword",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_TRA_H",1);

elseif class == "торговец" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItMw_1H_Bau_Mace",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ITAR_TRA_01",1);

elseif class == "лич" then
GiveItem(playerid,"ITFO_APPLE",3);
GiveItem(playerid,"ITFO_CHEESE",3);
GiveItem(playerid,"ITFO_WATER",4);
GiveItem(playerid,"ItRu_SuckEnergy",1);
GiveItem(playerid,"ItRu_Fear",1);
GiveItem(playerid,"ItRu_BeliarsRage",1);
GiveItem(playerid,"ItRu_Swarm",1);
GiveItem(playerid,"ItRu_ChargeFireball",1);
GiveItem(playerid,"ItRu_Skull",1);
GiveItem(playerid,"ItRu_Shrink",1);
GiveItem(playerid,"ItRu_BreathOfDeath",1);
GiveItem(playerid,"ITMI_RAKE",1);
GiveItem(playerid,"ITMI_BROOM",1);
GiveItem(playerid,"ITFO_BREAD",3);
GiveItem(playerid,"ItAr_Dementor",1);

elseif class == "тест" then
GiveItem(playerid,"ITAR_KDW_M",3);
GiveItem(playerid,"ITAR_KDW_L",3);
GiveItem(playerid,"ITAR_KDW_A",3);
GiveItem(playerid,"ITAR_KNG",3);
GiveItem(playerid,"ITAR_KNG_S",3);
GiveItem(playerid,"ITAR_KNG_H",3);
GiveItem(playerid,"ITAR_KNG_M",3);
GiveItem(playerid,"ITAR_KNG_L",3);
GiveItem(playerid,"ITAR_KNG_A",3);
GiveItem(playerid,"ITAR_MTZ",3);
GiveItem(playerid,"ITAR_MTZ_S",3);
GiveItem(playerid,"ITAR_MTZ_H",3);
GiveItem(playerid,"ITAR_MTZ_M",3);
GiveItem(playerid,"ITAR_MTZ_L",3);
GiveItem(playerid,"ITAR_MTZ_A",3);
GiveItem(playerid,"ITAR_SLED_M",3);
GiveItem(playerid,"ITAR_SLED_L",3);
GiveItem(playerid,"ITAR_DMB_H",3);
GiveItem(playerid,"ITAR_DMB_L",3);
GiveItem(playerid,"ITAR_TRA_H",3);
GiveItem(playerid,"ITAR_TRA_01",3);
GiveItem(playerid,"ITAR_TRA_02",3);
GiveItem(playerid,"ITAR_TRA_03",3);
GiveItem(playerid,"ITAR_DRU_H",3);
GiveItem(playerid,"ITAR_DRU_L",3);
GiveItem(playerid,"ITAR_RAV",3);
GiveItem(playerid,"ITAR_BEAR",3);
GiveItem(playerid,"ITAR_BOMZ_L",3);
GiveItem(playerid,"ITAR_BOMZARA",3);
GiveItem(playerid,"ITAR_KOZA_A",3);
GiveItem(playerid,"ITAR_KOZA_L",3);
GiveItem(playerid,"ITAR_KOZA_M",3);
GiveItem(playerid,"ITAR_KOZA_H",3);
GiveItem(playerid,"ITAR_KOZA_S",3);
GiveItem(playerid,"ITMW_STAB06",3);
GiveItem(playerid,"ItMw_2H_Axe_L_01",3);
GiveItem(playerid,"ITMW_FISHING_ROD",3);

elseif class == "Кузнец" then
elseif class == "Алхимик" then

end
SendPlayerMessage(playerid,255 , 0 ,94,"Снаряжение получено");
SendPlayerMessage(playerid,255 , 0 ,94,"Пожалуйста, перезайдите и сохраните его!");
SendPlayerMessage(playerid,255 , 0 ,94,"Приятной Вам игры.");
end
end
