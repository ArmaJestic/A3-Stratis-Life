// A_vehicle_fnc_remove_name

#include "header.h"


ARGV(0,_player);
ARGV(1,_vehicle_name);

if (!([_player] call A_player_fnc_human)) exitWith {false};
if(UNDEFINED(_vehicle_name)) exitWith {false};
if (typeName _vehicle_name != "STRING") exitWith {false};


private["_vehicles_name_list"];
_vehicles_name_list = [_player, "vehicles_name_list"] call A_player_fnc_get_array;

if (!(_vehicle_name in _vehicles_name_list)) exitWith {false};

_vehicles_name_list = _vehicles_name_list - [_vehicle_name];
[_player, "vehicles_name_list", _vehicles_name_list, false] call A_player_fnc_set_array_checked;
true
