// A_retributions_fnc_collect_faction_reward

#include "header.h"


private["_dp"];
_dp = _this select 0;

private["_reward", "_killer"];
_killer = _dp select INDEX_DP_KILLER;
_reward = 20000;

format["[%1, %2] call A_retributions_fnc_faction_reward;", _killer, _reward] call A_broadcast_fnc_broadcast;	
