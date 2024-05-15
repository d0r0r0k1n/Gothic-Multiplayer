function GiantRat()
	local npc = CreateNPC(GetNewNPCName("Гигантская крыса"));
	
	if(npc == -1)then
		print("Creating GiantRat Failed!");
	end
	
	SetPlayerInstance(npc,"Giant_Rat");
	
	SetPlayerStrength(npc, 40);
	SetPlayerDexterity(npc, 40);
	SetPlayerLevel(npc, 12);
	SetPlayerMaxHealth(npc, 200);
	SetPlayerHealth(npc, 200);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_GiantRat;
	npcarr.func = GiantRat;
	
	return npcarr;
end


function YoungGiantRat()
	local npcarr = GiantRat();
	local name = GetNewNPCName("Молодая гигантская крыса");
	SetPlayerName(npcarr.id, name);
	
	SetPlayerStrength(npcarr.id, 30);
	SetPlayerDexterity(npcarr.id, 30);
	SetPlayerLevel(npcarr.id, 3);
	SetPlayerMaxHealth(npcarr.id, 100);
	SetPlayerHealth(npcarr.id, 100);
	
	
	npcarr.func = YoungGiantRat;
	
	return npcarr;
end