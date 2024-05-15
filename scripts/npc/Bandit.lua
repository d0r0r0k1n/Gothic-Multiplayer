
function Bandit()
	local npc = CreateNPC(GetNewNPCName("Бандит"));
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
	SetPlayerWalk(npc, "HumanS_Relaxed.mds");
	SetPlayerInstance(npc,"BDT_1013_BANDIT_L");
	SetPlayerMaxHealth(npc, 400);
	SetPlayerHealth(npc, 400);
	SetPlayerFatness(npc, -1);
	SetPlayerStrength(npc, 50);
	SetPlayerSkillWeapon(npc,SKILL_1H,30);
	PlayAnimation(npc,"S_LGUARD");
	--Items:
	local armor = random(2)
	if armor == 0 then
	EquipArmor(npc,"ITAR_BDT_H");
	EquipMeleeWeapon(npc,"ItMw_NagelKeule2");
	elseif armor == 1 then
	EquipArmor(npc,"ITAR_BDT_M");
	EquipMeleeWeapon(npc,"ItMw_1H_Sld_Axe");
	elseif armor == 2 then
	EquipArmor(npc,"ITAR_BDT_M");
	EquipMeleeWeapon(npc,"ItMw_NagelKeule");
	end
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_GiantRat;
	npcarr.func = Blattcrawler;
	return npcarr;
end