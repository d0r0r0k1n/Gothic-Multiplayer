
--Default Monster Daily-Routine
function DR_Monster_Default(_playerid)
    if(TA_FUNC(_playerid,  22,  00,  5,  00))then
        DR_FUNC_SLEEP(_playerid);
    end
    
    if(TA_FUNC(_playerid,  5,  0,  22,  0))then
        DR_FUNC_ROAM(_playerid);
    end
end

--Eating Monster Daily-Routine
function DR_Monster_MidEat(_playerid)
    if(TA_FUNC(_playerid,  22,  00,  5,  00))then
        AI_ClearStates(_playerid);
        DR_FUNC_SLEEP(_playerid);
    end
    
    if(TA_FUNC(_playerid,  5,  0,  22,  0))then
        AI_ClearStates(_playerid);
        DR_FUNC_EAT(_playerid);
        --DR_FUNC_EAT(_playerid);
    end
end