
function OrcWarrior()
	local npc = CreateNPC(GetNewNPCName("ќрк-воин"));
	
	if(npc == -1)then
		print("Creating Orc Warrior Failed!");
	end
	
	SetPlayerInstance(npc,"OrcWarrior_Roam");
	
	SetPlayerStrength(npc, 100);
	SetPlayerDexterity(npc, 150);
	SetPlayerLevel(npc, 30);
	SetPlayerMaxHealth(npc, 600);
	SetPlayerHealth(npc, 600);
	
	EquipMeleeWeapon(npc, "ItMw_2H_OrcAxe_03");
	
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



function OrcWarrior1()
	npcarr = OrcWarrior();
	
	npcarr.func = OrcWarrior1;
	
	
	return npcarr;
end

function OrcWarrior2()
	npcarr = OrcWarrior();
	npcarr.func = OrcWarrior2;
	
	return npcarr;
end

function OrcWarrior3()
	npcarr = OrcWarrior();
	npcarr.func = OrcWarrior3;
	
	return npcarr;
end

function OrcWarrior4()
	npcarr = OrcWarrior();
	npcarr.func = OrcWarrior4;
	
	return npcarr;
end