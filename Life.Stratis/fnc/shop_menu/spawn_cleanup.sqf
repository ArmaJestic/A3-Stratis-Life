// A_shop_menu_fnc_spawn_cleanup

#include "header.h"


params["_vehicle","_logic",["_sleep_time",null,[0]]];

if (UNDEFINED(_vehicle)) exitWith {};
if (UNDEFINED(_logic)) exitWith {};
if (UNDEFINED(_sleep_time)) exitWith {};
if (!([_vehicle] call A_object_fnc_exists)) exitWith {};
if (_vehicle in A_shop_menu_var_spawn_cleanup_queue) exitWith {};

[_sleep_time,[_vehicle,_logic],{
	params["_vehicle","_logic"];
	if ((_vehicle distance _logic) > 3) exitWith {
		A_shop_menu_var_spawn_cleanup_queue = A_shop_menu_var_spawn_cleanup_queue - [_vehicle];
	};
	deleteVehicle _vehicle;
	A_shop_menu_var_spawn_cleanup_queue = A_shop_menu_var_spawn_cleanup_queue - [objNull];
}] call A_frame_fnc_wait;