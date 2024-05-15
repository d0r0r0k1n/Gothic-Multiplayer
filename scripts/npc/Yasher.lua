
function Yasher()
	local npc = CreateNPC(GetNewNPCName("Человек-ящер"));
	SetPlayerInstance(npc,"DRACONIAN");
	SetPlayerMaxHealth(npc, 600);
	SetPlayerHealth(npc, 600);
	SetPlayerStrength(npc, 120);
	--Items:
	EquipMeleeWeapon(npc,"ItMw_2H_OrcSword_01");
	
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
	npcarr.func = OrcWarrior;
	
	return npcarr;
end