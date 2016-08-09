// A_vehicle_fnc_init_handler_persistent

#include "..\..\includes\macro.h"


diag_log format["A_vehicle_fnc_init_handler_persistent %1", _this];
ARGV(0,_vehicle);
ARGV(1,_vehicle_name);

if (undefined(_vehicle)) exitWith {};
if (undefined(_vehicle_name)) exitWith {};
if (typeName _vehicle != "OBJECT") exitWith {};
if (isNull _vehicle) exitWIth {};
if (typeName _vehicle_name != "STRING") exitWith {};


_vehicle setVehicleVarname _vehicle_name;
missionNamespace setVariable [_vehicle_name, _vehicle];
if (undefined(A_mounted_fnc_add_actions)) then {
	A_mounted_var_actions_init = if (undefined(A_mounted_var_actions_init)) then { [] } else {A_mounted_var_actions_init};
	A_mounted_var_actions_init = A_mounted_var_actions_init + [_vehicle_name];
}else{
	[_vehicle] call A_mounted_fnc_add_actions;
};

_vehicle addEventHandler ["GetIn", { _this spawn A_vehicle_fnc_GetIn_handler}];
_vehicle addEventHandler ["GetOut", { _this spawn A_vehicle_fnc_GetOut_handler}];
