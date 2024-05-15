function StoneGolem()
	local npc = CreateNPC(GetNewNPCName("Каменный голем"));
	
	if(npc == -1)then
		print("Creating StoneGolem Failed!");
	end
	
	SetPlayerInstance(npc,"StoneGolem");
	
	SetPlayerStrength(npc, 150);
	SetPlayerDexterity(npc, 150);
	SetPlayerLevel(npc, 25);
	SetPlayerMaxHealth(npc, 700);
	SetPlayerHealth(npc, 700);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Golem;
	npcarr.func = StoneGolem;
	
	return npcarr;
end


function FireGolem()
	local npc = CreateNPC(GetNewNPCName("Огненный голем"));
	
	if(npc == -1)then
		print("Creating FireGolem Failed!");
	end
	
	SetPlayerInstance(npc,"FireGolem");
	
	SetPlayerStrength(npc, 200);
	SetPlayerDexterity(npc, 200);
	SetPlayerLevel(npc, 40);
	SetPlayerMaxHealth(npc, 800);
	SetPlayerHealth(npc, 800);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Golem;
	npcarr.func = FireGolem;
	
	return npcarr;
end



function IceGolem()
	local npc = CreateNPC(GetNewNPCName("Ледяной голем"));
	
	if(npc == -1)then
		print("Creating IceGolem Failed!");
	end
	
	SetPlayerInstance(npc,"IceGolem");
	
	SetPlayerStrength(npc, 225);
	SetPlayerDexterity(npc, 225);
	SetPlayerLevel(npc, 45);
	SetPlayerMaxHealth(npc, 950);
	SetPlayerHealth(npc, 950);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Golem;
	npcarr.func = IceGolem;
	
	return npcarr;
end

function SwampGolem()
	local npc = CreateNPC(GetNewNPCName("Болотный голем"));
	
	if(npc == -1)then
		print("Creating SwampGolem Failed!");
	end
	
	SetPlayerInstance(npc,"SwampGolem");
	
	SetPlayerStrength(npc, 125);
	SetPlayerDexterity(npc, 125);
	SetPlayerLevel(npc, 25);
	SetPlayerMaxHealth(npc, 900);
	SetPlayerHealth(npc, 900);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Golem;
	npcarr.func = SwampGolem;
	
	return npcarr;
end


function BridgeGolem()
	npcarr = StoneGolem();
	npcarr.func = BridgeGolem;
	
	
	return npcarr;
end

function Shattered_Golem()
	npcarr = StoneGolem();
	npcarr.func = Shattered_Golem;
	
	
	return npcarr;
end