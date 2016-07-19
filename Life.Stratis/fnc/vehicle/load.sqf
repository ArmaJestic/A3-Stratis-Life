// A_vehicle_fnc_load

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};
["vehicles_name_list", []] call A_stats_fnc_init_variable;
