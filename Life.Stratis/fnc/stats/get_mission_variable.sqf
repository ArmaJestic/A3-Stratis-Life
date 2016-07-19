// A_stats_fnc_get_mission_variable

#include "../../includes/macro.h"

private["_variableName"]; 
_variableName = _this select 0;
if (undefined(_variableName)) exitWith {null};
if (typeName _variableName != "STRING") exitWith {null};
private["_variable"];
_variable = missionNamespace getVariable [_vehicle_name, null];
if (undefined(_variable)) exitWith {null};
_variable
