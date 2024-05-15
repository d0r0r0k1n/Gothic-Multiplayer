function Razor()
	local npc = CreateNPC(GetNewNPCName("Бритвозуб"));
	
	if(npc == -1)then
		print("Creating Razor Failed!");
	end
	
	SetPlayerInstance(npc,"Razor");
	
	SetPlayerStrength(npc, 90);
	SetPlayerDexterity(npc, 90);
	SetPlayerLevel(npc, 18);
	SetPlayerMaxHealth(npc, 500);
	SetPlayerHealth(npc, 500);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Razor;
	npcarr.func = Razor;
	
	return npcarr;
end