// A_drag_fnc_interact_object_put_vehicle

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_object);

if (not([_player] call A_player_fnc_exists)) exitWith {};
if (not([_object] call A_object_fnc_exists)) exitWith {};

private["_vehicle"];
_vehicle =  call A_drag_fnc_target_vehicle;
if (undefined(_vehicle)) exitWith {};

if ((isPlayer _object) && {(locked _vehicle < 2) && {([_vehicle] call A_vehicle_fnc_empty_cargo_slots) > 0}}) exitWith {
	[[_object, _vehicle, true], "A_player_fnc_enter_vehicle_cargo", _object, false] call BIS_fnc_MP;
	
	[[_player]] call A_drag_fnc_object_release;
};
