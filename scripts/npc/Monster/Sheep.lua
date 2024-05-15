function Sheep()
	local npc = CreateNPC(GetNewNPCName("����"));
	
	if(npc == -1)then
		print("Creating Sheep Failed!");
	end
	
	SetPlayerInstance(npc,"Sheep");
	
	SetPlayerStrength(npc, 5);
	SetPlayerDexterity(npc, 5);
	SetPlayerLevel(npc, 1);
	SetPlayerMaxHealth(npc, 10000);
	SetPlayerHealth(npc, 10000);
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.GotEnemyFunc = AI_GOTENEMY_MONSTER_FLEE;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.onhitted = nil;
	npcarr.Guild = AI_GUILD_Sheep;
	npcarr.func = Sheep;
	
	return npcarr;
end

function Hammel()
	local npc = CreateNPC(GetNewNPCName("�����"));
	
	if(npc == -1)then
		print("Creating Hammel Failed!");
	end
	
	SetPlayerInstance(npc,"Hammel");
	
	SetPlayerStrength(npc, 5);
	SetPlayerDexterity(npc, 5);
	SetPlayerLevel(npc, 1);
	SetPlayerMaxHealth(npc, 10000);
	SetPlayerHealth(npc, 10000);
	
	npcarr = {};
	npcarr.id = npc;
	npcarr.daily_routine = nil;
	npcarr.attack_routine = FAI_WOLF_ATTACK;
	npcarr.GotEnemyFunc = AI_GOTENEMY_MONSTER_FLEE;
	npcarr.WeaponMode = 0;
	npcarr.dialogs = nil;
	npcarr.onhitted = nil;
	npcarr.Guild = AI_GUILD_Sheep;
	npcarr.func = Hammel;
	
	return npcarr;
end