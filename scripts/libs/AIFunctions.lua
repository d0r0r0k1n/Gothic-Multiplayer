print("Loaded Lib: AIFunctions.lua");

require "scripts/libs/scriptFunctions"
require "scripts/libs/WayPoints"
require "scripts/libs/GetItems"
big_require("./scripts/libs/Handler/", "");
big_require("./scripts/libs/AI/", "");


AI_NPCList = {};--List with all NPCs and their AI-Functions!
AI_NPCList_Sort = {};--table.insert(NPCList, id);
AI_PlayerList = {}; -- Only Players!
AI_FullPList = {}; --Players and NPCs, only IDS! AI_FullPList[id] = id;
AI_WayNets = {};
AI_FreePoints = {};
AI_HASITEM_TABLE = {};
AI_FullPlayerPos = {};

AI_DEBUG_DURATION = false;
AI_TARGET_DISTANCE = 2500;



local gameTime = 0;
local gameTimeCounter = 0;

function AI_Set(_playerid)
	if(AI_NPCList[_playerid] == nil) then
		AI_NPCList[_playerid] = {};
		AI_NPCList[_playerid].ID = _playerid;
		AI_NPCList[_playerid].Func = nil;
		AI_NPCList[_playerid].STATES = {};
		AI_NPCList[_playerid].INACTIVESTATES = {};
		AI_NPCList[_playerid].TALKTABLE=true;
		AI_NPCList[_playerid].INTERRUPTED = false;
		AI_NPCList[_playerid].UpdateFunc = nil;
		AI_NPCList[_playerid].TargetFunc = nil;
		AI_NPCList[_playerid].TARGETS = {};
		AI_NPCList[_playerid].ENEMY={};
		AI_NPCList[_playerid].AttackFunc = nil;
		
		Reset_TA(_playerid);
		
		AI_NPCList[_playerid].TA_FUNC = nil;
		AI_NPCList[_playerid].Dialogs = {};
		AI_NPCList[_playerid].UPDATETA = true;
		
		AI_NPCList[_playerid].INDIALOG = false;
		AI_NPCList[_playerid].LASTATTACKED = 0;
		AI_NPCList[_playerid].LASTWP = nil;
		AI_NPCList[_playerid].WeaponMode = 0;
		
		
		AI_NPCList[_playerid].DIA_CHOISES = {};
		AI_NPCList[_playerid].DIA_WAITFORCHOISE = false;
		AI_NPCList[_playerid].DIA_CHOISE = 0;
		AI_NPCList[_playerid].DIA_TARGET = 0;
		AI_NPCList[_playerid].DIA_TARGETLIST = {};
		AI_NPCList[_playerid].OnHitFunc = nil;
		AI_NPCList[_playerid].NEXTMOVES = {};
		
		AI_NPCList[_playerid].Guild = AI_GUILD_GuildLess;
		AI_NPCList[_playerid].Aivars = {};
		AI_NPCList[_playerid].FRIENDS = {};
		AI_NPCList[_playerid].NpcUpdateStati = 1;
		AI_NPCList[_playerid].NPCTradingInventory = {};
		
		AI_NPCList[_playerid].GuildAttitude = {};
		
		AI_NPCList[_playerid].LastState = nil;
		AI_NPCList[_playerid].GotEnemyFunc = nil;
		AI_NPCList[_playerid].TargetChecked = {};
		
		AI_NPCList[_playerid].LastPosUpdate = 0;
		
		AI_NPCList[_playerid].StartWP = nil;
		
		--General Things from GetPlayer.. to make the script faster
		AI_NPCList[_playerid].GP_World = nil;
		AI_NPCList[_playerid].GP_IsDead = false;
		AI_NPCList[_playerid].GP_IsUnconscious = false;
		AI_NPCList[_playerid].GP_PosX = nil;
		AI_NPCList[_playerid].GP_PosY = nil;
		AI_NPCList[_playerid].GP_PosZ = nil;
		
		
	end
end

function AI_SetPlayer(_playerid)
	AI_PlayerList[_playerid] = {};
	AI_PlayerList[_playerid].ID=_playerid
	AI_PlayerList[_playerid].DIALOGPATNER=nil
	AI_PlayerList[_playerid].TRADINGPARTNER = nil
	AI_PlayerList[_playerid].Invisible = false
	AI_PlayerList[_playerid].Guild = AI_GUILD_GuildLess;
	AI_PlayerList[_playerid].INDIALOG = false;
	AI_PlayerList[_playerid].KnowsDialog = {};
end

function AI_SetAivar(_playerid)
	if(AI_NPCList[_playerid].Aivars["TARGETS"] == nil)then
		AI_NPCList[_playerid].Aivars["TARGETS"] = {};
	end
	
	if(AI_NPCList[_playerid].Aivars["WARN"] == nil)then
		AI_NPCList[_playerid].Aivars["WARN"] = 0;
	end
	
	if(AI_NPCList[_playerid].Aivars["WARNTIME"] == nil)then
		AI_NPCList[_playerid].Aivars["WARNTIME"] = 10000;
	end
	
	if(AI_NPCList[_playerid].Aivars["MaxWarnDistance"] == nil)then
		AI_NPCList[_playerid].Aivars["MaxWarnDistance"] = 1300;
	end
	
	if(AI_NPCList[_playerid].Aivars["WarnDistance"] == nil)then
		AI_NPCList[_playerid].Aivars["WarnDistance"] = 1000;
	end
	
	if(AI_NPCList[_playerid].Aivars["MinWarnDistance"] == nil)then
		AI_NPCList[_playerid].Aivars["MinWarnDistance"] = 500;
	end
	
	
	
	if(AI_NPCList[_playerid].Aivars["TARGETDISTANCE"] == nil)then
		AI_NPCList[_playerid].Aivars["TARGETDISTANCE"] = 2000;
	end
	
	if(AI_NPCList[_playerid].Aivars["Flee"] == nil)then
		AI_NPCList[_playerid].Aivars["Flee"] = false;
	end
	
	AI_NPCList[_playerid].Aivars["FleeStartWP"] = nil;
	
	AI_NPCList[_playerid].Aivars["FleeEndWP"] = nil;
	
	AI_NPCList[_playerid].Aivars["FleeRoute"] = nil;
end

function ENEMY_DISCONNECTED(_playerid)
	if(IsNPC(AI_NPCList[_playerid]["ENEMY"][1]) == 0 and IsPlayerConnected(AI_NPCList[_playerid]["ENEMY"][1]) == 0)then
		--print("NPC ".._playerid..": Enemy "..AI_NPCList[_playerid]["ENEMY"][1].." is disconncted!");
		table.remove(AI_NPCList[_playerid]["ENEMY"], 1);
		
		if(next(AI_NPCList[_playerid]["ENEMY"]) ~= nil)then
			ENEMY_DISCONNECTED(_playerid);
		end
	end
end



function InitAiSystem()
	CreateAI_WayNets();
	SetDefaultGuildAttitude();
	
	
	SetTimer("AI_Timer",200,1);
end









function GetGameTime()
	return GetTickCount();
end

function TA_FUNC(_playerid, _hour, _minute, _hour2, _minute2)
	if(AI_NPCList[_playerid]["INDIALOG"])then
		return false;
	end
	local hour,minute = GetTime();
	
	hour3 = nil;
	if(_hour2 < _hour)then
		hour3 = _hour2+24;
	end
	
	if((hour >= _hour and hour <= _hour2) or ( hour3~=nil and hour+24 >= _hour and hour <= _hour2)or ( hour3~=nil and hour >= _hour and hour <= hour3))then
		if(hour == _hour and minute <_minute)then--Minute has to be bigger!
			return false;
		end 
		if(hour == _hour2 and minute >=_minute2)then--Minute has to be lower!
			return false;
		end 
		if(AI_NPCList[_playerid]["TAHOUR"] == -10 or
				((AI_NPCList[_playerid]["TAHOUR"] ~= _hour or AI_NPCList[_playerid]["TAMINUTE"] ~= _minute) or (AI_NPCList[_playerid]["TAHOUR_END"] ~= _hour2 or AI_NPCList[_playerid]["TAMINUTE_END"] ~= _minute2)) or
				(_hour == 0 and _minute == 0 and _hour2 == 24 and _minute2 == 0 and AI_NPCList[_playerid]["TA_Last_Hour"] == 23 and hour == 0) )then
			AI_NPCList[_playerid]["TAHOUR"] = _hour;
			AI_NPCList[_playerid]["TAMINUTE"] = _minute;
			AI_NPCList[_playerid]["TAHOUR_END"] = _hour2;
			AI_NPCList[_playerid]["TAMINUTE_END"] = _minute2;
			AI_NPCList[_playerid]["TA_Last_Hour"] = hour;
			AI_NPCList[_playerid]["TA_Last_Minute"] = minute;
			return true;
		else
			AI_NPCList[_playerid]["TA_Last_Hour"] = hour;
			AI_NPCList[_playerid]["TA_Last_Minute"] = minute;
		end
	end
	return false;
end

function Reset_TA(_player)
	AI_NPCList[_player]["TAHOUR"] = -10;
	AI_NPCList[_player]["TAMINUTE"]=-10;
	AI_NPCList[_player]["TAHOUR_END"] = -10;
	AI_NPCList[_player]["TAMINUTE_END"]=-10;
	AI_NPCList[_player]["TA_Last_Hour"] = -10;
	AI_NPCList[_player]["TA_Last_Minute"] = -10;
end

function CreateAI_WayNets()
	AI_WayNets["NEWWORLD\\NEWWORLD.ZEN"] = WayNet.create();
	AI_WayNets["NEWWORLD\\NEWWORLD.ZEN"]:load("scripts/wps/newworld.wp");
	AI_WayNets["OLDWORLD\\OLDWORLD.ZEN"] = WayNet.create();
	AI_WayNets["OLDWORLD\\OLDWORLD.ZEN"]:load("scripts/wps/oldworld.wp");
	AI_WayNets["ADDON\\ADDONWORLD.ZEN"] = WayNet.create();
	AI_WayNets["ADDON\\ADDONWORLD.ZEN"]:load("scripts/wps/addonworld.wp");
	
	AI_WayNets["COLONY.ZEN"] = WayNet.create();
	AI_WayNets["COLONY.ZEN"]:load("scripts/wps/colony.wp");
	
	AI_FreePoints["NEWWORLD\\NEWWORLD.ZEN"] = FreePointList.create( );
	AI_FreePoints["NEWWORLD\\NEWWORLD.ZEN"]:load("scripts/wps/newworld.fp");
	AI_FreePoints["OLDWORLD\\OLDWORLD.ZEN"] = FreePointList.create( );
	AI_FreePoints["OLDWORLD\\OLDWORLD.ZEN"]:load("scripts/wps/oldworld.fp");
	AI_FreePoints["ADDON\\ADDONWORLD.ZEN"] = FreePointList.create( );
	AI_FreePoints["ADDON\\ADDONWORLD.ZEN"]:load("scripts/wps/addonworld.fp");
	AI_FreePoints["COLONY.ZEN"] = FreePointList.create();
	AI_FreePoints["COLONY.ZEN"]:load("scripts/wps/colony.fp");
end

function GetAIWayNet(world)
	return AI_WayNets[string.upper(trim(world))];
end

function GetNearFreepoint(_playerid, waypoint, freepoint)
	local wp = AI_WayNets[AI_NPCList[_playerid].GP_World]:GetWaypoint(waypoint);
	local fp = AI_FreePoints[AI_NPCList[_playerid].GP_World]:GetNearFreePoints(wp.x, wp.y, wp.z, freepoint, 2000);
	
	if(fp == nil or #fp == 0)then
		return "";
	end
	return fp[1].name;
end

function SpawnNPC(_npc, _waypoint, _world)	
	
	if(_npc.id == -1)then
		print("NPC wasn't valid! -1");
		return;
	end
	AI_Set(_npc.id);
	AI_NPCList[_npc.id].DailyRoutine = _npc.daily_routine;
	AI_NPCList[_npc.id].AttackFunc = _npc.attack_routine;
	
	AI_NPCList[_npc.id].Func = _npc.func;
	
	if(_npc.WeaponMode ~= nil)then
		AI_NPCList[_npc.id].WeaponMode = _npc.WeaponMode;
	end
	
	if(_npc.dialogs ~= nil)then
		AI_NPCList[_npc.id].Dialogs = _npc.dialogs;
	end
	
	if(_npc.update_func ~= nil)then
		AI_NPCList[_npc.id].UpdateFunc = _npc.update_func;
	end
	
	if(_npc.target_routine ~= nil)then
		AI_NPCList[_npc.id].TargetFunc = _npc.target_routine;
	end
	
	if(_npc.onhitted ~= nil)then
		AI_NPCList[_npc.id].OnHitFunc = _npc.onhitted;
	end
	
	if(_npc.Guild ~= nil)then
		AI_NPCList[_npc.id].Guild = _npc.Guild;
	end
	ResetGuildAttitude(AI_NPCList[_npc.id]);
	
	if(_npc.GotEnemyFunc ~= nil)then
		AI_NPCList[_npc.id].GotEnemyFunc = _npc.GotEnemyFunc;
	end
	
	if(_npc.aivar ~= nil)then
		AI_NPCList[_npc.id].Aivars = _npc.aivar;
	end
	
	
	
	AI_SetAivar(_npc.id);
	
	if(_npc.tradingInventory ~=nil)then
		AI_NPCList[_npc.id].NPCTradingInventory = _npc.tradingInventory;
	end
	
	SpawnPlayer(_npc.id);
	
	if(_world == nil)then
		world = string.upper(trim(GetPlayerWorld(_npc.id)));
	else
		world = string.upper(trim(_world));
	end
	
	
	if(world ~= nil and _waypoint ~= nil)then
		if(_world ~= nil)then
			SetPlayerWorld(_npc.id,world,_waypoint);
		end
		local wp = AI_WayNets[world]:GetWaypoint(_waypoint);
		
		
		if(wp == nil)then
			local fp = AI_FreePoints[world]:GetFreePoint(_waypoint);
			if(fp == nil)then
				print("The waypoint couldn't be found! Actual World:"..world.." searched waypoint: ".._waypoint.." NPCID:".._npc.id);
			else
				SetPlayerPos(_npc.id, tonumber(fp.x), tonumber(fp.y), tonumber(fp.z));
				AI_NPCList[_npc.id].LASTWP = _waypoint;
				AI_NPCList[_npc.id].StartWP = _waypoint;
			end
		else
			SetPlayerPos(_npc.id, tonumber(wp.x), tonumber(wp.y), tonumber(wp.z));
			AI_NPCList[_npc.id].LASTWP = _waypoint;
			AI_NPCList[_npc.id].StartWP = _waypoint;
		end
		
	elseif(_world ~= nil)then
		SetPlayerWorld(_npc.id,_world,"START");
	end
	
	AddPlayerOrNPC(AI_NPCList[_npc.id]);
	
	table.insert(AI_NPCList_Sort, _npc.id);
	
end

function SetEnemy(_playerid, _enemyid)
	for key, val in ipairs(AI_NPCList[_playerid]["ENEMY"]) do
		if(val == _enemyid)then
			return;
		end
	end
	
	if(AI_NPCList[_enemyid] ~= nil and AI_NPCList[_enemyid].GotEnemyFunc ~= nil)then
		AI_NPCList[_enemyid].GotEnemyFunc(_enemyid, _playerid);
	end
	
	table.insert(AI_NPCList[_playerid]["ENEMY"], _enemyid); 
end

function GetPlayerAI(_playerid)
	return AI_NPCList[_playerid];
end

function GetWayNets(_playerid)
	return AI_WayNets;
end

function GetNPCwithFunc(_func)
	local npcList = {};
	
	for key, val in pairs(AI_NPCList) do
		if(val.Func == _func)then
			table.insert(npcList, val);
		end
	end
	
	return npcList;
end

function GetNPCwithGuild(_guild)
	local npcList = {};
	
	for key, val in pairs(AI_NPCList) do
		if(val.Guild == _guild)then
			table.insert(npcList, val);
		end
	end
	
	return npcList;
end






big_require("./scripts/fai/", "", true);
big_require("./scripts/ai/", "", true);
big_require("./scripts/npc/", "", true);
--require "scripts/fai/fai"
--require "scripts/ai/ai"
--require "scripts/npc/aNPC"