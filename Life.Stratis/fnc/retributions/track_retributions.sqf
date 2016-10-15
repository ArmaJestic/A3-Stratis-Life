// A_retributions_fnc_track_retributions

#include "header.h"


private["_dp"];
_dp = _this select 0;

private["_killer", "_suicide", "_victim_armed", "_victim_criminal", "_roadkill", "_victim_side", "_victim_name", "_killer_name", "_teamkill", "_justified"];

_killer = _dp select INDEX_DP_KILLER;
_suicide = _dp select INDEX_DP_SUICIDE;
_victim_armed = _dp select INDEX_DP_VICTIM_ARMED;
_victim_criminal = _dp select INDEX_DP_VICTIM_CRIMINAL;
_roadkill = _dp select INDEX_DP_ROADKILL;
_victim_side = _dp select INDEX_DP_VICTIM_SIDE;
_killer_side = _dp select INDEX_DP_KILLER_SIDE;
_victim_name = _dp select INDEX_DP_VICTIM_NAME;
_killer_name = _dp select INDEX_DP_KILLER_NAME;
_teamkill = _dp select INDEX_DP_TEAMKILL;
_justified = _dp select INDEX_DP_JUSTIFIED;

//Retributions
if (_suicide ||
	_killer_name == "Error: No vehicle" || 
	_killer_name == "Error: No unit" || 
	_victim_name == "Error: No vehicle" || 
	_victim_name == "Error: No unit") exitWith {null};

//player groupChat format["JUST: %1", _justified];
if ((_victim_side == "Civilian") && !_justified) exitWith {
	[_killer, "DM"] call A_retributions_fnc_add_killer;
	A_retributions_var_player_unfair_killed = true;
};

if (_teamkill) exitWith {
	[_killer, "TK"] call A_retributions_fnc_add_killer;
	A_retributions_var_player_unfair_killed = true;
};
