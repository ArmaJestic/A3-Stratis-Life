// A_vehicle_fnc_set_init

#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_vehicle);
ARGV(1,_vehicle_name);

if (undefined(_vehicle)) exitWith {null};
if (undefined(_vehicle_name)) exitWith {null};

if (typeName _vehicle != "OBJECT") exitWith {null};
if (typeName _vehicle_name != "STRING") exitWith {null};


private["_flag"];
_flag = "vehicle_init_flag";

missionNamespace setVariable [_flag, false];
//[[_vehicle, _vehicle_name], "A_vehicle_fnc_init_handler_persistent", true, true] spawn BIS_fnc_MP;
[[_vehicle, _vehicle_name], "A_vehicle_fnc_init_handler_persistent", true, true] spawn A_jip_fnc_register;
waitUntil { not(isNil _vehicle_name) };

missionNamespace setVariable [_flag, false];
[[_vehicle], "A_vehicle_fnc_init_handler", true, false] spawn BIS_fnc_MP;

[_vehicle, "isPlayerVehicle", true, true] call A_object_fnc_setVariable;
[player, _vehicle] call A_vehicle_fnc_add;
[_vehicle] call A_vehicle_fnc_set_loadout;


};
