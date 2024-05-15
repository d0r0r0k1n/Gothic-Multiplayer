
function Gobbo_Green()
	local npc = CreateNPC(GetNewNPCName("Гоблин"));
	
	if(npc == -1)then
		print("Creating Gobbo_Green Failed!");
	end
	
	SetPlayerInstance(npc,"Gobbo_Green");
	
	SetPlayerStrength(npc, 50);
	SetPlayerDexterity(npc, 50);
	SetPlayerLevel(npc, 7);
	SetPlayerMaxHealth(npc, 350);
	SetPlayerHealth(npc, 350);
	
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
	npcarr.Guild = AI_GUILD_Goblin;
	npcarr.GotEnemyFunc = AI_GOTENEMY_MONSTER_FLEE;
	npcarr.func = Gobbo_Green;
	
	return npcarr;
end


function YoungGobbo_Green()
	local npcarr = Gobbo_Green();
	local name = GetNewNPCName("Молодой гоблин");
	SetPlayerName(npcarr.id, name);
	
	SetPlayerStrength(npcarr.id, 35);
	SetPlayerDexterity(npcarr.id, 35);
	SetPlayerLevel(npcarr.id, 3);
	SetPlayerMaxHealth(npcarr.id, 300);
	SetPlayerHealth(npcarr.id, 300);
	
	
	npcarr.func = YoungGobbo_Green;
	
	return npcarr;
end