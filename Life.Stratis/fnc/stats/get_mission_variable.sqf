// A_stats_fnc_get_mission_variable

#include "header.h"


params[["_variableName",null,[""]]]; 

if (UNDEFINED(_variableName)) exitWith {null};

private _variable = missionNamespace getVariable [_vehicle_name, null];
if (UNDEFINED(_variable)) exitWith {null};

_variable