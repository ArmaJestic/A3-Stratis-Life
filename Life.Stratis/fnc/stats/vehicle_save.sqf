// A_stats_fnc_vehicle_save

//method intended saving vehicle stats ... it can be run on any client

#include "header.h"


params[["_vehicle",objNull,[objNull]], ["_variable",null,[""]], ["_value",null]];

if (isNull _vehicle) exitwith {null};
if (UNDEFINED(_variable)) exitWith {null};
if (UNDEFINED(_value)) exitWith {null};

private _uid = [_vehicle] call A_stats_fnc_get_uid;
if (_uid == "") exitWith {null};
	
[_uid, _variable, _value] call A_stats_fnc_save;