// A_vehicle_fnc_init_handler_persistent

#include "header.h"


params[["_vehicle",objNull,[objNull]],["_vehicle_name",null,[""]]];

if UNDEFINED(_vehicle_name) exitWith {};
if (isNull _vehicle) exitWith {};

_vehicle setVehicleVarname _vehicle_name;
missionNamespace setVariable[_vehicle_name, _vehicle];
if UNDEFINED(A_mounted_fnc_add_actions) then {
	A_mounted_var_actions_init = [A_mounted_var_actions_init,[]] select UNDEFINED(A_mounted_var_actions_init);
	A_mounted_var_actions_init pushBack _vehicle_name;
}else{
	[_vehicle] call A_mounted_fnc_add_actions;
};

_vehicle addEventHandler ["GetIn", {_this spawn A_vehicle_fnc_GetIn_handler}];
_vehicle addEventHandler ["GetOut", {_this spawn A_vehicle_fnc_GetOut_handler}];