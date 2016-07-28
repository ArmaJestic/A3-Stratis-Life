// A_retributions_fnc_track_retributions

#include "..\..\includes\macro.h"


private["_dp"];
_dp = _this select 0;

private["_killer", "_suicide", "_victim_armed", "_victim_criminal", "_roadkill", "_victim_side", "_victim_name", "_killer_name", "_teamkill", "_justified"];

_killer = _dp select A_retributions_var_dp_killer;
_suicide = _dp select A_retributions_var_dp_is_suicide;
_victim_armed = _dp select A_retributions_var_dp_is_victim_armed;
_victim_criminal = _dp select A_retributions_var_dp_is_victim_criminal;
_roadkill = _dp select A_retributions_var_dp_is_roadkill;
_victim_side = _dp select A_retributions_var_dp_victim_side;
_killer_side = _dp select A_retributions_var_dp_killer_side;
_victim_name = _dp select A_retributions_var_dp_victim_name;
_killer_name = _dp select A_retributions_var_dp_killer_name;
_teamkill = _dp select A_retributions_var_dp_is_teamkill;
_justified = _dp select A_retributions_var_dp_justified;

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
