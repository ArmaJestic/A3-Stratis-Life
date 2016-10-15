// A_player_fnc_get_gear

#include "header.h"


params["_player"];
if (!([_player] call A_player_fnc_exists)) exitWith {null};
if ([_player] call A_player_fnc_ghost) exitWith {[_player, "A_client_var_cached_gear"] call A_object_fnc_getVariable};

private _gear = getUnitLoadout player;
// no need to separate individual arrays
//_gear params["_primary","_secondary","_handgun","_uniform","_vest","_backpack","_helmet","_goggles","_binocs","_assigned"];

_gear