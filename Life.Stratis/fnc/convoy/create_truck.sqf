// A_convoy_fnc_create_truck

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_location);

private["_class", "_truck"];
_class = ["B_Hunter_F"] call BIS_fnc_selectRandom;
_truck = createVehicle [_class, _location, [], 0, "NONE"];

private["_truck_name"];
_truck_name = "convoy_truck";

//[[_truck, _truck_name], "A_convoy_fnc_init_handler_persistent", true, true] spawn BIS_fnc_MP;
[[_truck, _truck_name], "A_convoy_fnc_init_handler_persistent", true, true, _truck] spawn A_jip_fnc_register;
waitUntil {not(isNil _truck_name)};

[_truck, "tuning", 5, true] call A_object_fnc_setVariable;
processinitcommands;
_truck
