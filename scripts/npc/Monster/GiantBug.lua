function Giant_Bug()
	local npc = CreateNPC(GetNewNPCName("Полевой хищник"));
	
	if(npc == -1)then
		print("Creating Giant_Bug Failed!");
	end
	
	SetPlayerInstance(npc,"Giant_Bug");
	
	SetPlayerStrength(npc, 50);
	SetPlayerDexterity(npc, 50);
	SetPlayerLevel(npc, 8);
	SetPlayerMaxHealth(npc, 300);
	SetPlayerHealth(npc, 300);
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_GiantBug;
	npcarr.func = Giant_Bug;
	return npcarr;
end


function YoungGiant_Bug()
	local npcarr = Giant_Bug();
	local name = GetNewNPCName("Молодой полевой хищник");
	SetPlayerName(npcarr.id, name);
	
	SetPlayerStrength(npcarr.id, 30);
	SetPlayerDexterity(npcarr.id, 30);
	SetPlayerLevel(npcarr.id, 2);
	SetPlayerMaxHealth(npcarr.id, 200);
	SetPlayerHealth(npcarr.id, 200);
	
	
	npcarr.func = YoungGiant_Bug;
	
	return npcarr;
end
