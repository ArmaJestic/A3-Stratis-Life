// A_stats_fnc_wait_entry

#include "../../includes/macro.h"

private["_entry", "_object", "_timeout"];
_entry = _this select 0;
_object = _this select 1;
_timeout = _this select 2;

if (undefined(_entry)) exitWith {null};
if (typeName _entry !="ARRAY") exitWith {null};
if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};
if (isNull _object) exitWith {null};
if (undefined(_timeout)) exitWith {null};
if (typeName _timeout != "SCALAR") exitWith {null};

private["_end_time"];
_end_time = serverTime + 1;
private["_variable_name"];
_variable_name = _entry select 0;

waitUntil {
	private["_variable_value"];
	_variable_value = [_object, _variable_name] call A_object_fnc_getVariable;
	if (not(undefined(_variable_value))) exitWith {true};
	if (_end_time < serverTime) exitWith {
		private["_message"];
		_message = format["WARNING: Time-out occurred while initializing %1", _variable_name];
		player groupChat _message;
		diag_log _message;
		true
	};
	false
};
