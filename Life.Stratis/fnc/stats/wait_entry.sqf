// A_stats_fnc_wait_entry

#include "header.h"


params[["_entry",null,[[]]], ["_object",objNull,[objNull]], ["_timeout",null,[0]]];

if (UNDEFINED(_entry)) exitWith {null};
if (isNull _object) exitWith {null};
if (UNDEFINED(_timeout)) exitWith {null};

private _end_time = diag_tickTime + 1;
private _variable_name = _entry select 0;

waitUntil {
	private _variable_value = [_object, _variable_name] call A_object_fnc_getVariable;
	if (DEFINED(_variable_value)) exitWith {true};
	if (_end_time < diag_tickTime) exitWith {
		private _message = format["WARNING: Time-out occurred while initializing %1", _variable_name];
		player groupChat _message;
		diag_log _message;
		true
	};
	false
};