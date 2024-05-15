
function Skeleton()
	local npc = CreateNPC(GetNewNPCName("Cкелет"));
	
	if(npc == -1 or npc==nil)then
		print("Creating Skeleton Failed!");
	end
	
	SetPlayerInstance(npc,"Skeleton");
	
	SetPlayerStrength(npc, 150);
	SetPlayerDexterity(npc, 150);
	SetPlayerLevel(npc, 30);
	SetPlayerMaxHealth(npc, 500);
	SetPlayerHealth(npc, 500);
	
	EquipMeleeWeapon(npc, "ItMw_2H_Sword_M_01");
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 4;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Skeleton;
	npcarr.func = Skeleton;
	
	return npcarr;
end


function SkeletonSH()
	local npcArray = Skeleton();
	
	SetPlayerStrength(npcArray.id, 110);
	npcArray.WeaponMode = 3;
	EquipMeleeWeapon(npcArray.id, "ItMw_1h_MISC_Sword");
	npcArray.func = SkeletonSH;
	
	return npcArray;
end


function SkeletonScout()
	local npc = CreateNPC(GetNewNPCName("Скелет скаут"));
	
	if(npc == -1)then
		print("Creating Skeleton Scout Failed!");
	end
	
	SetPlayerInstance(npc,"Lesser_Skeleton");
	
	SetPlayerStrength(npc, 45);
	SetPlayerDexterity(npc, 75);
	SetPlayerLevel(npc, 15);
	SetPlayerMaxHealth(npc, 150);
	SetPlayerHealth(npc, 150);
	
	EquipMeleeWeapon(npc, "ItMw_1h_MISC_Sword");
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Skeleton;
	npcarr.func = SkeletonScout;
	
	return npcarr;
end

function Lesser_Skeleton()
	local npc = CreateNPC(GetNewNPCName("Маленький скелет"));
	
	if(npc == -1)then
		print("Creating Lesser Skeleton Failed!");
	end
	
	SetPlayerInstance(npc,"Lesser_Skeleton");
	
	SetPlayerStrength(npc, 45);
	SetPlayerDexterity(npc, 75);
	SetPlayerLevel(npc, 15);
	SetPlayerMaxHealth(npc, 150);
	SetPlayerHealth(npc, 150);
	
	EquipMeleeWeapon(npc, "ItMw_1h_MISC_Sword");
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 3;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Skeleton;
	npcarr.func = Lesser_Skeleton;
	
	return npcarr;
end




function SkeletonWarrior()
	local npc = CreateNPC(GetNewNPCName("Скелет-воин"));
	
	if(npc == -1 or npc == nil)then
		print("Creating Skeleton Warrior Failed!");
	end
	
	SetPlayerInstance(npc,"Skeleton_Lord");
	
	SetPlayerStrength(npc, 105);
	SetPlayerDexterity(npc, 100);
	SetPlayerLevel(npc, 40);
	SetPlayerMaxHealth(npc, 400);
	SetPlayerHealth(npc, 400);
	
	EquipMeleeWeapon(npc, "ItMw_Zweihaender2");
	EquipArmor(npc, "ITAR_PAL_SKEL");
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 4;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Skeleton;
	npcarr.func = SkeletonWarrior;
	
	return npcarr;
end


function SkeletonLord()
	local npcarr = SkeletonWarrior();
	local name = GetNewNPCName("Скелет-лорд");
	SetPlayerName(npcarr.id, name);
	
	
	return npcarr;
end


function SkeletonMage()
	local npc = CreateNPC(GetNewNPCName("Скелет-маг"));
	
	if(npc == -1)then
		print("Creating Skeleton Mage Failed!");
	end
	
	SetPlayerInstance(npc,"SkeletonMage");
	
	SetPlayerStrength(npc, 150);
	SetPlayerDexterity(npc, 150);
	SetPlayerLevel(npc, 30);
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
	npcarr.Guild = AI_GUILD_Skeleton;
	npcarr.func = SkeletonMage;
	
	return npcarr;
end