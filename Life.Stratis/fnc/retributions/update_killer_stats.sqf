// A_retributions_fnc_update_killer_stats

#include "header.h"


private["_dp"];
_dp = _this select 0;

private["_suicide", "_victim_side", "_killer"];
_suicide = _dp select INDEX_DP_SUICIDE;
_victim_side = _dp select INDEX_DP_VICTIM_SIDE;
_killer = _dp select INDEX_DP_KILLER;

if (_suicide) exitWith {
	[_killer, "A_main_var_selfkilled", 1] call A_player_fnc_update_scalar;
};

if (_victim_side == "Civilian") exitWith {
	[_killer, "civskilled", 1] call A_player_fnc_update_scalar;
};

if (_victim_side == "Cop") exitWith {
	[_killer, "copskilled", 1] call A_player_fnc_update_scalar;
};
