// A_retributions_fnc_update_killer_stats

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_suicide", "_victim_side", "_killer"];
_suicide = _dp select A_retributions_var_dp_is_suicide;
_victim_side = _dp select A_retributions_var_dp_victim_side;
_killer = _dp select A_retributions_var_dp_killer;

if (_suicide) exitWith {
	[_killer, "A_main_var_selfkilled", 1] call A_player_fnc_update_scalar;
};

if (_victim_side == "Civilian") exitWith {
	[_killer, "civskilled", 1] call A_player_fnc_update_scalar;
};

if (_victim_side == "Cop") exitWith {
	[_killer, "copskilled", 1] call A_player_fnc_update_scalar;
};
