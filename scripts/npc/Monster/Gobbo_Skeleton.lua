
function Gobbo_Skeleton()
	local npc = CreateNPC(GetNewNPCName("Гоблин-скелет"));
	
	if(npc == -1)then
		print("Creating Gobbo_Skeleton Failed!");
	end
	
	SetPlayerInstance(npc,"Gobbo_Skeleton");
	
	SetPlayerStrength(npc, 70);
	SetPlayerDexterity(npc, 70);
	SetPlayerLevel(npc, 15);
	SetPlayerMaxHealth(npc, 450);
	SetPlayerHealth(npc, 450);
	
	EquipMeleeWeapon(npc, "ItMw_1h_Bau_Mace");
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Goblin_Skeleton;
	npcarr.GotEnemyFunc = AI_GOTENEMY_MONSTER_FLEE;
	npcarr.func = Gobbo_Skeleton;
	
	return npcarr;
end