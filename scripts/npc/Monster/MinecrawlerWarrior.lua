function MinecrawlerWarrior()
	local npc = CreateNPC(GetNewNPCName("������-����"));
	
	if(npc == -1)then
		print("Creating MinecrawlerWarrior Failed!");
	end
	
	SetPlayerInstance(npc,"MinecrawlerWarrior");
	
	SetPlayerStrength(npc, 90);
	SetPlayerDexterity(npc, 90);
	SetPlayerLevel(npc, 12);
	SetPlayerMaxHealth(npc, 550);
	SetPlayerHealth(npc, 550);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Minecrawler;
	npcarr.func = MinecrawlerWarrior;
	
	return npcarr;
end