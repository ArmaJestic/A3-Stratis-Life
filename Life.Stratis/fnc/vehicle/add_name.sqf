// A_vehicle_fnc_add_name

#include "header.h"


params["_player",["_vehicle_name",null,[""]]];

if (!([_player] call A_player_fnc_human)) exitWith {false};
if UNDEFINED(_vehicle_name) exitWith {false};

private _vehicles_name_list = [_player, "vehicles_name_list"] call A_player_fnc_get_array;

if (_vehicle_name in _vehicles_name_list) exitWith {false};

_vehicles_name_list set [count(_vehicles_name_list), _vehicle_name];

[_player, "vehicles_name_list", _vehicles_name_list, false] call A_player_fnc_set_array_checked;
true