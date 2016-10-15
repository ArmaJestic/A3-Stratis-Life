// A_vehicle_fnc_set_init2

#include "header.h"


params["_vehicle","_vehicle_name","_flag"];

missionNamespace setVariable[_flag, false];
[[_vehicle], "A_vehicle_fnc_init_handler",null,false] call A_jip_fnc_register;

[_vehicle, "isPlayerVehicle", true, true] call A_object_fnc_setVariable;
[player, _vehicle] call A_vehicle_fnc_add;
[_vehicle] call A_vehicle_fnc_set_loadout;