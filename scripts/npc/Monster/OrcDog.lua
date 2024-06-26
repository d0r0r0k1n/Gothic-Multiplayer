
function OrcDog()
	local npc = CreateNPC(GetNewNPCName("������ ������"));
	
	if(npc == -1)then
		print("Creating Orc Dog Failed!");
	end
	
	SetPlayerInstance(npc,"Warg");
	
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
	npcarr.Guild = AI_GUILD_OrcDog;
	npcarr.func = OrcDog;
	
	return npcarr;
end