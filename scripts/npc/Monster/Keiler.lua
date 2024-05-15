function Keiler()
	local npc = CreateNPC(GetNewNPCName("Кабан"));
	
	if(npc == -1)then
		print("Creating Keiler Failed!");
	end
	
	SetPlayerInstance(npc,"Keiler");
	
	SetPlayerStrength(npc, 50);
	SetPlayerDexterity(npc, 50);
	SetPlayerLevel(npc, 6);
	SetPlayerMaxHealth(npc, 400);
	SetPlayerHealth(npc, 400);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Keiler;
	npcarr.func = Keiler;
	
	return npcarr;
end