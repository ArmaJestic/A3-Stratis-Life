// A_vehicle_fnc_list

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {[]};

([_player, "vehicles_name_list"] call A_player_fnc_get_array)
