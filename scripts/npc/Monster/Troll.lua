function Troll()
	local npc = CreateNPC(GetNewNPCName("������"));
	
	if(npc == -1)then
		print("Creating Troll Failed!");
	end
	
	SetPlayerInstance(npc,"Troll");
	
	SetPlayerStrength(npc, 200);
	SetPlayerDexterity(npc, 200);
	SetPlayerLevel(npc, 50);
	SetPlayerMaxHealth(npc, 1200);
	SetPlayerHealth(npc, 1200);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Troll;
	npcarr.func = Troll;
	
	return npcarr;
end


function Troll_Black()
	local npc = CreateNPC(GetNewNPCName("������ ������"));
	
	if(npc == -1)then
		print("Creating Troll_Black Failed!");
	end
	
	SetPlayerInstance(npc,"Troll_Black");
	
	SetPlayerStrength(npc, 300);
	SetPlayerDexterity(npc, 300);
	SetPlayerLevel(npc, 100);
	SetPlayerMaxHealth(npc, 1500);
	SetPlayerHealth(npc, 1500);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Troll;
	npcarr.func = Troll_Black;
	
	return npcarr;
end