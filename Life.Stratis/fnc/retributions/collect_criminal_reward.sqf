// A_retributions_fnc_collect_criminal_reward

#include "header.h"


private["_dp"];
_dp = _this select 0;

private["_bounty", "_killer"];
_bounty = _dp select INDEX_DP_VICTIM_BOUNTY;
_killer = _dp select INDEX_DP_KILLER;

if (_bounty <= 0) exitWith {null};
format["[%1, %2] call A_retributions_fnc_criminal_reward;", _killer, _bounty] call A_broadcast_fnc_broadcast;	
