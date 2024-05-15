
function Scavenger()
	local npc = CreateNPC(GetNewNPCName("Падальщик"));
	
	if(npc == -1)then
		print("Creating Scavenger Failed!");
	end
	
	SetPlayerInstance(npc,"Scavenger");
	
	SetPlayerStrength(npc, 40);
	SetPlayerDexterity(npc, 40);
	SetPlayerLevel(npc, 7);
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
	npcarr.Guild = AI_GUILD_Scavenger;
	npcarr.GotEnemyFunc = AI_GOTENEMY_MONSTER_FLEE;
	npcarr.func = Scavenger;
	
	return npcarr;
end

function YoungScavenger()
	local npcarr = Scavenger();--A normal Wolf will be created
	local name = GetNewNPCName("Молодой падальщик");
	SetPlayerName(npcarr.id, name);
	
	SetPlayerStrength(npcarr.id, 26);
	SetPlayerDexterity(npcarr.id, 26);
	SetPlayerLevel(npcarr.id, 4);
	SetPlayerMaxHealth(npcarr.id, 150);
	SetPlayerHealth(npcarr.id, 150);
	npcarr.func = YoungScavenger;
	
	
	return npcarr;
end

function ScavengerDemon()
	local npcarr = Scavenger();--A normal Wolf will be created
	local name = GetNewNPCName("Степной падальщик");
	SetPlayerName(npcarr.id, name);
	
	SetPlayerInstance(npcarr.id,"Scavenger_Demon");
	
	SetPlayerStrength(npcarr.id, 60);
	SetPlayerDexterity(npcarr.id, 60);
	SetPlayerLevel(npcarr.id, 12);
	SetPlayerMaxHealth(npcarr.id, 300);
	SetPlayerHealth(npcarr.id, 300);
	npcarr.func = ScavengerDemon;
	
	
	return npcarr;
end