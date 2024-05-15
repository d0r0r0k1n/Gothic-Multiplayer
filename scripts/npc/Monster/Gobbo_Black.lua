
function Gobbo_Black()
	local npc = CreateNPC(GetNewNPCName("������ ������"));
	
	if(npc == -1)then
		print("Creating Gobbo_Black Failed!");
	end
	
	SetPlayerInstance(npc,"Gobbo_Black");
	
	SetPlayerStrength(npc, 60);
	SetPlayerDexterity(npc, 60);
	SetPlayerLevel(npc, 8);
	SetPlayerMaxHealth(npc, 400);
	SetPlayerHealth(npc, 400);
	
	EquipMeleeWeapon(npc, "ItMw_1h_Bau_Mace");
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Goblin;
	npcarr.GotEnemyFunc = AI_GOTENEMY_MONSTER_FLEE;
	npcarr.func = Gobbo_Black;
	
	
	return npcarr;
end



function Gobbo_Warrior()
	local npcArray = Gobbo_Black();
	local name = GetNewNPCName("������-����");
	SetPlayerName(npcArray.id, name);
	
	
	SetPlayerStrength(npcArray.id, 75);
	SetPlayerDexterity(npcArray.id, 75);
	SetPlayerLevel(npcArray.id, 15);
	SetPlayerMaxHealth(npcArray.id, 75);
	SetPlayerHealth(npcArray.id, 75);
	npcArray.func = Gobbo_Warrior;
	
	return npcArray;
end