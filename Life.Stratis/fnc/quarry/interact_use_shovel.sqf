// A_quarry_fnc_interact_use_shovel

#include "header.h"


params["_player","_object"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_object)) exitWith {};

if (A_quarry_var_interact_use_shovel_active) exitWith {};
A_quarry_var_interact_use_shovel_active = true;

private["_exit_clean"];
_exit_clean = {
	sleep 1;
	A_quarry_var_interact_use_shovel_active = false;
};


_player playActionNow "PutDown";
[_player, _object] call A_quarry_fnc_interact_sand_hit;

[] call _exit_clean;