function White(playerid)
local name = GetPlayerName(playerid);
if name == "Rainbow" then
elseif name == "Nort" then
elseif name == "licontrop" then
elseif name == "Lambert" then
elseif name == "Whiplasher" then
elseif name == "1" then
elseif name == "2" then
elseif name == "3" then
-- играем
else
SendPlayerMessage(playerid,255,255,255,"Ваш ник не записан в white-лист.");
Kick(playerid);
end
end
