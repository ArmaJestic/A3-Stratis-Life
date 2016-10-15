// A_vehicle_fnc_set_init

#include "header.h"


params[["_vehicle",objNull,[objNull]],["_vehicle_name",null,[""]]];
if (isNull _vehicle) exitWith {null};
if UNDEFINED(_vehicle_name) exitWith {null};


private _flag = "vehicle_init_flag";

missionNamespace setVariable[_flag, false];
[[_vehicle, _vehicle_name],"A_vehicle_fnc_init_handler_persistent",_vehicle] call A_jip_fnc_register;

[[_vehicle,_vehicle_name,_flag],{!(isNil (_this select 1))},A_vehicle_fnc_set_init2] call A_frame_fnc_waitUntil;