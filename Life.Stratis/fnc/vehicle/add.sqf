// A_vehicle_fnc_add

#include "header.h"


params["_player","_vehicle"];	
if (!([_player] call A_player_fnc_human)) exitWith {false};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {false};

([_player, str(_vehicle)] call A_vehicle_fnc_add_name)