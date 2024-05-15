
function Wolf()
	local npc = CreateNPC(GetNewNPCName("Волк"));
	
	if(npc == -1)then
		print("Creating Wolf Failed!");
	end
	
	SetPlayerInstance(npc,"Wolf");
	
	SetPlayerStrength(npc, 50);
	SetPlayerDexterity(npc, 50);
	SetPlayerLevel(npc, 6);
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
	npcarr.Guild = AI_GUILD_Wolf;
	npcarr.func = Wolf;
	return npcarr;
end

function YoungWolf()
	local npcArray = Wolf();--A normal Wolf will be created
	local youngwolfname = GetNewNPCName("Молодой волк");
	SetPlayerName(npcArray.id, youngwolfname);
	
	SetPlayerStrength(npcArray.id, 30);
	SetPlayerDexterity(npcArray.id, 30);
	SetPlayerLevel(npcArray.id, 3);
	SetPlayerMaxHealth(npcArray.id, 200);
	SetPlayerHealth(npcArray.id, 200);
	
	
	npcArray.func = YoungWolf;
	
	return npcArray;
end