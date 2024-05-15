
function Molerat()
	local npc = CreateNPC(GetNewNPCName("Кротокрыс"));
	
	if(npc == -1)then
		print("Creating Molerat Failed!");
	end
	
	SetPlayerInstance(npc,"Molerat");
	
	SetPlayerStrength(npc, 30);
	SetPlayerDexterity(npc, 30);
	SetPlayerLevel(npc, 5);
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
	npcarr.Guild = AI_GUILD_Molerat;
	npcarr.func = Molerat;
	
	return npcarr;
end

function YoungMolerat()
	local npcArray = Molerat();--A normal Wolf will be created
	local youngwolfname = GetNewNPCName("Молодой кротокрыс");
	SetPlayerName(npcArray.id, youngwolfname);
	
	SetPlayerStrength(npcArray.id, 20);
	SetPlayerDexterity(npcArray.id, 20);
	SetPlayerLevel(npcArray.id, 2);
	SetPlayerMaxHealth(npcArray.id, 150);
	SetPlayerHealth(npcArray.id, 150);
	
	npcArray.func = YoungMolerat;
	
	
	
	return npcArray;
end