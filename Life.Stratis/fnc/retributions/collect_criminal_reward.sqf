// A_retributions_fnc_collect_criminal_reward

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_bounty", "_killer"];
_bounty = _dp select A_retributions_var_dp_victim_bounty;
_killer = _dp select A_retributions_var_dp_killer;

if (_bounty <= 0) exitWith {null};
format["[%1, %2] call A_retributions_fnc_criminal_reward;", _killer, _bounty] call A_broadcast_fnc_broadcast;	
