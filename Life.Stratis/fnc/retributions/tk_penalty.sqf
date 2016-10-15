// A_retributions_fnc_tk_penalty

#include "header.h"


private["_dp"];
_dp = _this select 0;

private["_killer_side", "_killer", "_victim"];
_killer_side = _dp select INDEX_DP_KILLER_SIDE;
_killer = _dp select INDEX_DP_KILLER;
_victim = player;
if (_killer_side != "Cop") exitWith {null};

format['[%1, %2] call A_retributions_fnc_tk_jail_cop;', _killer, _victim] call A_broadcast_fnc_broadcast;
