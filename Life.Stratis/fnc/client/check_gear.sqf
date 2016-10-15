// A_client_fnc_check_gear

#include "..\..\includes\macro.h"


private _player = player;
if (!(alive _player)) exitWith {null};

private["_gear"];
_gear = [_player] call A_player_fnc_get_gear;
//keep the clone's gear in sync
if (str(_gear) != A_client_var_cached_gear) then {
	[_player, "A_client_var_cached_gear", _gear, true] call A_object_fnc_setVariable;
	A_client_var_cached_gear = str(_gear);
};