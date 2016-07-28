// A_retributions_fnc_collect_faction_reward

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_reward", "_killer"];
_killer = _dp select A_retributions_var_dp_killer;
_reward = 20000;

format["[%1, %2] call A_retributions_fnc_faction_reward;", _killer, _reward] call A_broadcast_fnc_broadcast;	
