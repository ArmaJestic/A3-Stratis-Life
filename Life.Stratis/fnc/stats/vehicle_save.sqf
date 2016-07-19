// A_stats_fnc_vehicle_save

//method intended saving vehicle stats ... it can be run on any client

#include "..\..\includes\macro.h"

private["_vehicle", "_variable", "_value"];
_vehicle = _this select 0;
_variable = _this select 1;
_value = _this select 2;

private["_uid"];
_uid = [_vehicle] call A_stats_fnc_get_uid;

if (_uid == "") exitWith {null};

if (undefined(_variable)) exitWith {null};
if (undefined(_value)) exitWith {null};
if (typeName _variable != "STRING") exitWith {null};
	
[_uid, _variable, _value] call A_stats_fnc_save;
