// A_retributions_fnc_tk_penalty

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_killer_side", "_killer", "_victim"];
_killer_side = _dp select A_retributions_var_dp_killer_side;
_killer = _dp select A_retributions_var_dp_killer;
_victim = player;
if (_killer_side != "Cop") exitWith {null};

format['[%1, %2] call A_retributions_fnc_tk_jail_cop;', _killer, _victim] call A_broadcast_fnc_broadcast;
