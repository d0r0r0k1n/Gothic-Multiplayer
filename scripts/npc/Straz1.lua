
function Straz1()
	local npc = CreateNPC(GetNewNPCName("Патрульный"));
	local skin = random(6)
	if skin == 0 then
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",0,"Hum_Head_Pony",43);
	elseif skin == 1 then
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",0,"Hum_Head_Pony",44);
	elseif skin == 2 then
	SetPlayerAdditionalVisual(npc,"HUM_BODY_NAKED0",8,"HUM_HEAD_PONY",10);
	elseif skin == 3 then
	SetPlayerAdditionalVisual(npc,"Hum_Body_Naked0",3,"Hum_Head_Pony",17);
	elseif skin == 4 then
	SetPlayerAdditionalVisual(npc,"HUM_BODY_NAKED0",0,"HUM_HEAD_BALD",0);
	elseif skin == 5 then
	SetPlayerAdditionalVisual(npc,"HUM_BODY_NAKED0",9,"HUM_HEAD_BALD",116);
	elseif skin == 6 then
	SetPlayerAdditionalVisual(npc,"HUM_BODY_NAKED0",1,"HUM_HEAD_THIEF",5);
	end
	SetPlayerWalk(npc, "HumanS_Militia.mds");
	SetPlayerInstance(npc,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(npc, 400);
	SetPlayerHealth(npc, 400);
	SetPlayerFatness(npc, -1);
	SetPlayerStrength(npc, 50);
	SetPlayerSkillWeapon(npc,SKILL_1H,30);
	--PlayAnimation(npc,"S_HGUARD");
	--Items:
	local armor = random(2)
	if armor == 0 then
	EquipArmor(npc,"ITAR_MIL_M");
	EquipMeleeWeapon(npc,"ItMw_1H_Pal_Sword");
	elseif armor == 1 then
	EquipArmor(npc,"ITAR_MIL_L");
	EquipMeleeWeapon(npc,"ItMw_1H_Mil_Sword");
	elseif armor == 2 then
	EquipArmor(npc,"ITAR_MIL_L");
	EquipMeleeWeapon(npc,"ItMw_1H_Sld_Sword");
	end
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = DR_p1;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_GuildLess;
	npcarr.func = Blattcrawler;
	return npcarr;
end

function DR_p1(playerid)
if(TA_FUNC(playerid, 22, 0, 06, 0))then
          AI_ClearStates(playerid); --That will remove all old AI functions from the queue.
          AI_SETWALKTYPE(playerid, 0); --The NPC will walk from now on!
          AI_GOTO(playerid, "NW_CITY_MERCHANT_TRADE_03"); --Since version 0.11 AI_GOTO works with way- and freepoints.
		  SetPlayerWeaponMode(playerid,0);
		  --PlayAnimation(playerid,"S_HGUARD");
     elseif(TA_FUNC(playerid, 06, 0, 06, 30))then
          AI_ClearStates(playerid);
          AI_SETWALKTYPE(playerid, 0);
          AI_GOTO(playerid, "NW_CITY_HABOUR_KASERN_CENTRE_03");
		  SetPlayerWeaponMode(playerid,0);
	elseif(TA_FUNC(playerid, 06, 30, 07, 0))then
		  SetPlayerWeaponMode(playerid,3);
          PlayAnimation(playerid,"T_1HSFREE");
     elseif(TA_FUNC(playerid, 07, 0, 22, 0))then
          AI_ClearStates(playerid);
          AI_SETWALKTYPE(playerid, 0);
          AI_GOTO(playerid, "NW_CITY_MERCHANT_PATH_43");
		  SetPlayerWeaponMode(playerid,0);
		  --PlayAnimation(playerid,"S_LGUARD");
     end
end