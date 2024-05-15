function Giant_DesertRat()
	local npc = CreateNPC(GetNewNPCName("Гигантская пустынная крыса"));
	
	if(npc == -1)then
		print("Creating GiantDesertRat Failed!");
	end
	
	SetPlayerInstance(npc,"Giant_DesertRat");
	
	SetPlayerStrength(npc, 75);
	SetPlayerDexterity(npc, 75);
	SetPlayerLevel(npc, 10);
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
	npcarr.Guild = AI_GUILD_GiantDesertRat;
	npcarr.func = Giant_DesertRat;
	return npcarr;
end