function OrcShaman()
	local npc = CreateNPC(GetNewNPCName("Орк-шаман"));
	
	if(npc == -1)then
		print("Creating Orc Shaman Failed!");
	end
	
	SetPlayerInstance(npc,"OrcShaman_Sit");
	
	SetPlayerStrength(npc, 100);
	SetPlayerDexterity(npc, 170);
	SetPlayerLevel(npc, 35);
	SetPlayerMaxHealth(npc, 650);
	SetPlayerHealth(npc, 650);
	
	EquipMeleeWeapon(npc, "ItMw_2H_OrcAxe_01");
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 4;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Orc;
	npcarr.func = OrcShaman;
	
	return npcarr;
end