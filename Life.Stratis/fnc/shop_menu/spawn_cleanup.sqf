// A_shop_menu_fnc_spawn_cleanup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

_this spawn {
ARGV(0,_vehicle);
ARGV(1,_logic)
ARGV(2,_sleep_time);

if (undefined(_vehicle)) exitWith {};
if (undefined(_logic)) exitWith {};
if (undefined(_sleep_time)) exitWith {};
if (not([_vehicle] call A_object_fnc_exists)) exitWith {};
if (typeName _sleep_time != "SCALAR") exitWith {};
if (_vehicle in A_shop_menu_var_spawn_cleanup_queue) exitWith {};

sleep _sleep_time;
if ((_vehicle distance _logic) > 3) exitWith {
	A_shop_menu_var_spawn_cleanup_queue = A_shop_menu_var_spawn_cleanup_queue - [_vehicle];
};
deleteVehicle _vehicle;
A_shop_menu_var_spawn_cleanup_queue = A_shop_menu_var_spawn_cleanup_queue - [objNull];
};
