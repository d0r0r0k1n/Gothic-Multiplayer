
function Bloodfly()
	local npc = CreateNPC(GetNewNPCName("Кровавый шершень"));
	
	if(npc == -1)then
		print("Creating Bloodfly Failed!");
	end
	
	SetPlayerInstance(npc,"Bloodfly");
	
	SetPlayerStrength(npc, 35);
	SetPlayerDexterity(npc, 35);
	SetPlayerLevel(npc, 12);
	SetPlayerMaxHealth(npc, 200);
	SetPlayerHealth(npc, 200);
	
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.update_func = AI_UP_MONSTER;
	npcarr.target_routine = AI_TA_MONSTER;
	npcarr.onhitted = ON_WOLF_HIT;
	npcarr.Guild = AI_GUILD_Bloodfly;
	npcarr.aivar = {};
	npcarr.aivar["ATTACKRANGE"] = 300;
	npcarr.aivar["WARNTIME"] = 3000;
	npcarr.func = Bloodfly;
	
	return npcarr;
end


function YoungBloodfly()
	local npcarr = Bloodfly();
	local name = GetNewNPCName("Молодой кровавый шершень");
	SetPlayerName(npcarr.id, name);
	
	SetPlayerStrength(npcarr.id, 25);
	SetPlayerDexterity(npcarr.id, 25);
	SetPlayerLevel(npcarr.id, 3);
	SetPlayerMaxHealth(npcarr.id, 150);
	SetPlayerHealth(npcarr.id, 150);
	
	
	npcarr.func = YoungBloodfly;
	
	return npcarr;
end