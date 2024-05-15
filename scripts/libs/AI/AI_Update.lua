local mfloor = math.floor;


function GetPlayers(world, x, y, z, values)
	local baseTable = {};
	
	x =  mfloor(x/AI_TARGET_DISTANCE);
	y =  mfloor(y/AI_TARGET_DISTANCE);
	z =  mfloor(z/AI_TARGET_DISTANCE);
	
	local fpp = AI_FullPlayerPos[world];
	
	for ix = -1*values, values, 1 do
		for iy = -1*values, values, 1 do
			for iz = -1*values, values, 1 do
				local Str = x+ix+1000*(y+iy)+1000*1000*(z+iz);
				local plPos = fpp[Str];
				if(plPos ~= nil) then
					for key,val in pairs(plPos)do
						table.insert(baseTable, val);
					end
				end
			end
		end
	end
	
	return baseTable;
end
local AI_UPDATE_NOW = true;
function AI_Timer()
	local x = GetTickCount();
	AI_FullPlayerPos = {};
	
	if(AI_UPDATE_NOW)then
		AI_UPDATE_NOW = false;
	else
		AI_UPDATE_NOW = true;
	end
	
	for key,val in pairs(GetFullPlayerList()) do
		val.GP_World = string.upper(trim(GetPlayerWorld(key)));
		val.GP_IsDead = IsDead(key);
		val.GP_IsUnconscious = IsUnconscious(key);
		
		local x,y,z = GetPlayerPos(key);
		val.GP_PosX = x;
		val.GP_PosY = y;
		val.GP_PosZ = z;
		
		if(AI_FullPlayerPos[val.GP_World] == nil)then
			AI_FullPlayerPos[val.GP_World] = {};
		end
		
		local xStr = mfloor(x/AI_TARGET_DISTANCE)+1000*mfloor(y/AI_TARGET_DISTANCE)+1000*1000*mfloor(z/AI_TARGET_DISTANCE);
		
		if(AI_FullPlayerPos[val.GP_World][xStr] == nil)then
			AI_FullPlayerPos[val.GP_World][xStr] = {};
		end
		table.insert(AI_FullPlayerPos[val.GP_World][xStr], val);
	end
	for key,val in pairs(AI_NPCList_Sort) do
		AI_Update(val);
	end
	local z = GetTickCount() - x;
	if(AI_DEBUG_DURATION~= nil and AI_DEBUG_DURATION)then
		print("Duration: "..z);
	end
end

function AI_Update(_playerid)
	local ainpc = AI_NPCList[_playerid];
	
	if(next(ainpc["ENEMY"]) ~= nil and ainpc.AttackFunc ~= nil and ainpc["INDIALOG"] == false )then
		ENEMY_DISCONNECTED(_playerid)
		
		if(next(ainpc["ENEMY"]) ~= nil)then
			AI_NPCList[_playerid].AttackFunc(AI_NPCList[_playerid]);
			return;--INTERRUPTED because he attacks the enemy...
		end
	end
	
	
	
	if(ainpc.DailyRoutine ~= nil and ainpc["UPDATETA"] and ainpc["INDIALOG"] == false)then
		ainpc.DailyRoutine(_playerid);
	end
	
	if(ainpc.UpdateFunc ~= nil  and ainpc["INDIALOG"] == false)then
		ainpc.UpdateFunc(_playerid);
	end
	
	updateImportantDialogs(_playerid);
	
	
	if(((AI_UPDATE_NOW == true and ainpc.ID % 2 == 0)or (AI_UPDATE_NOW == false and ainpc.ID % 2 ~= 0)) and ainpc.GP_IsDead == 0 and ainpc.GP_IsUnconscious == 0 and ainpc.TargetFunc ~= nil and ainpc["INDIALOG"] == false)then
		local npcList = GetPlayers(ainpc.GP_World, ainpc.GP_PosX, ainpc.GP_PosY ,ainpc.GP_PosZ , 1);
		ainpc["OLD_TARGETS"] = ainpc["TARGETS"];
		ainpc["TARGETS"] = {};
		local targetdistance = ainpc.Aivars["TARGETDISTANCE"];
		for key,val in pairs(npcList)do
			CheckTargetPlayer(ainpc, val, targetdistance);
		end
		ainpc["OLD_TARGETS"] = {};
	end
	
	if(ainpc["INTERRUPTED"])then
		return; -- INTERRUPT AI STATES!
	end
	
	
	if(next(ainpc["STATES"]) == nil)then
		if(ainpc.LastState ~= nil and ainpc.LastState.Continue == true)then
			ainpc.LastState.start = true;
			table.insert(ainpc["STATES"], AI_NPCList[_playerid].LastState);
			return;
		else
			return;
		end
	end
	
	ainpc["STATES"][1]:update();
end


function updateImportantDialogs(_playerid)
	local ainpc = AI_NPCList[_playerid];
	if(next(ainpc.Dialogs) ~= nil and ainpc["INDIALOG"] == false and ainpc.GP_IsDead == 0 and ainpc.GP_IsUnconscious == 0)then
	--Check Distance to players!
		for key,val in pairs(AI_PlayerList) do
			if(val ~= nil)then
				local distance = GetDistancePlayers(val.ID, _playerid);
				if(val.GP_World == ainpc.GP_World and distance < 600 and distance ~= 0 and val.GP_IsDead == 0 and val.GP_IsDead == 0)then--Distance has to be less then 1000
					if(ainpc["DIA_TARGETLIST"][val.ID] == nil)then
						
						--Important,Dialogs
						for key2,val2 in ipairs(ainpc.Dialogs) do
							if(val2["type"] == 1 and val.KnowsDialog[val2["func"]] == nil)then--The Dialog is important!
								--Check the Condition-Func
								local dCond = true;
								if(val2["condFunc"] ~= nil)then
									dCond = val2["condFunc"](val.ID, _playerid);
								end
								
								--First time to speak with the npc?
								--if(val2["listener"][val.ID] == nil)then
									if(dCond ) then
										--startDialog(_playerid, val);
										
										ainpc["INACTIVESTATES"] = table.copy(AI_NPCList[_playerid]["STATES"]);
										ainpc["STATES"] = {};
										ainpc["INDIALOG"] = true;
										ainpc.DIA_TARGET = val.ID;
										
										--PlayAnimation(_playerid, "S_LGUARD");
										--PlayAnimation(val.ID, "S_LGUARD");
										
										FreezePlayer(val.ID,1);
										FreezePlayer(_playerid,1);
										
										PlayGesticulation(val.ID);
										PlayGesticulation(_playerid);
										AI_TURNTOPLAYERAO(_playerid, val.ID);
										
										val.DIALOGPATNER = _playerid;
										val2["func"](val.ID, _playerid);
										val.KnowsDialog[val2["func"]] = val2["func"];
										
										ainpc["DIA_TARGETLIST"][val.ID] = val.ID;
										val2["listener"][val.ID] = val.ID;
										return;
									end
									
								--end
							end
						end
						
						ainpc["DIA_TARGETLIST"][val.ID] = val.ID;
					end
				elseif(val.GP_World ~= ainpc.GP_World or GetDistancePlayers(val.ID, _playerid) > 700)then--if the distance is over 1100 he will remove the target from the targetlist.
					if(ainpc["DIA_TARGETLIST"][val.ID] ~= nil)then
						ainpc["DIA_TARGETLIST"][val.ID] = true;
					end
				end
				
			end
		end
	end
end


function CheckTargetPlayer(ainpc, val, TargetDistance)
	if(val ~= nil and val.ID ~= ainpc.ID and (val.Invisible == nil or val.Invisible == false) and val["INDIALOG"] == false)then
		local distancePlayer =  getDistance(val.GP_PosX, val.GP_PosY, val.GP_PosZ, ainpc.GP_PosX,ainpc.GP_PosY,ainpc.GP_PosZ)--GetDistancePlayers(val.ID, _playerid);
		local targetsList = ainpc["TARGETS"];
		
		if(distancePlayer < TargetDistance and distancePlayer ~= 0)then--Distance has to be less then 1000
			if(ainpc["OLD_TARGETS"][val.ID] == nil)then
				ainpc.TargetFunc(ainpc.ID, val.ID);
			end
			targetsList[val.ID] = val.ID;
		end
	end
end