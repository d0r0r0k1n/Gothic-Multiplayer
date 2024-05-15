
function Waran()
	local npc = CreateNPC(GetNewNPCName("Варан"));
	
	if(npc == -1)then
		print("Creating Waran Failed!");
	end
	
	SetPlayerInstance(npc,"Waran");
	
	SetPlayerStrength(npc, 70);
	SetPlayerDexterity(npc, 70);
	SetPlayerLevel(npc, 12);
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
	npcarr.Guild = AI_GUILD_Waran;
	npcarr.func = Waran;
	
	return npcarr;
end

function Firewaran()
	local npc = CreateNPC(GetNewNPCName("Огненный варан"));
	
	if(npc == -1)then
		print("Creating Waran Failed!");
	end
	
	SetPlayerInstance(npc,"FireWaran");
	
	SetPlayerStrength(npc, 150);
	SetPlayerDexterity(npc, 150);
	SetPlayerLevel(npc, 30);
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
	npcarr.Guild = AI_GUILD_Waran;
	npcarr.func = Firewaran;
	
	return npcarr;
end