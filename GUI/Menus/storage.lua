local sklad_stal = 100;
local sklad_fish = 101;
local sklad_hleb = 102;
local sklad_psen = 103;
local sklad_beer = 104;
local sklad_wine = 105;
local sklad_motiga = 106;

function CMD_GET_SKLAD(playerid, params) --взять со склада
local result , item = sscanf(params, "s");
	if item == "сталь" then
GETSTAL(playerid,params);
	elseif item == "рыбу" then
GETFISH(playerid,params);
	elseif item == "хлеб" then
GETHLEB(playerid,params);
	elseif item == "пшеницу" then
GETPSEN(playerid,params);
	elseif item == "пиво" then
GETBEER(playerid,params);
	elseif item == "вино" then
GETWINE(playerid,params);
	elseif item == "мотыгу" then
GETMOTIGA(playerid,params);
end
end

function CMD_GIVE_SKLAD(playerid, params) --вернуть на склад
local result , item = sscanf(params, "s");
	if item == "сталь" then
GIVESTAL(playerid);
	elseif item == "рыбу" then
GIVEFISH(playerid);
	elseif item == "хлеб" then
GIVEHLEB(playerid);
	elseif item == "пшеницу" then
GIVEPSEN(playerid);
	elseif item == "пиво" then
GIVEBEER(playerid);
	elseif item == "вино" then
GIVEWINE(playerid);
	elseif item == "мотыгу" then
GIVEMOTIGA(playerid);
end
end

function GETSTAL(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "STAL")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Стали было:",a));
SetINI("sklad.cfg", "STAL", a-1 );
local a = GetINI("sklad.cfg", "STAL")
GiveItem(playerid,"ITMISWORDRAW",1);
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
print("1")
local a = GetINI("sklad.cfg", "STAL")
print("2",a)
HasItem(playerid,"ITMISWORDRAW",sklad_stal);
print("3")
end

function GETFISH(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "FISH")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Рыбы было:",a));
SetINI("sklad.cfg", "FISH", a-1 );
local a = GetINI("sklad.cfg", "FISH")
GiveItem(playerid,"ItFo_Fish",1);
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
GiveItem(playerid,"ItFo_Bread",1);
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
HasItem(playerid,"ItFo_Bread",sklad_psen);
end

function GETBEER(playerid,params)
local result,a = sscanf(params,"d");
local a = GetINI("sklad.cfg", "BEER")
if a > "0" then
SendPlayerMessage(playerid,0,255,255,string.format("%s %d","Пива было:",a));
SetINI("sklad.cfg", "BEER", a-1 );
local a = GetINI("sklad.cfg", "BEER")
GiveItem(playerid,"ItFo_Beer",1);
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
