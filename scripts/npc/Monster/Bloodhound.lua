
function Bloodhound()
	local npc = CreateNPC(GetNewNPCName("���������"));
	
	if(npc == -1)then
		print("Creating Bloodhound Failed!");
	end
	
	SetPlayerInstance(npc,"Bloodhound");
	
	SetPlayerStrength(npc, 90);
	SetPlayerDexterity(npc, 90);
	SetPlayerLevel(npc, 7);
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
	npcarr.Guild = AI_GUILD_Bloodhound;
	npcarr.func = Bloodhound;
	
	
	return npcarr;
end