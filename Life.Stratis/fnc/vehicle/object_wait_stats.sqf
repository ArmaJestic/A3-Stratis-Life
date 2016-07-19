// A_vehicle_fnc_object_wait_stats

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_variable_name);
ARGV(2,_time_out);
if (undefined(_object)) exitWith {null};
if (undefined(_variable_name)) exitWith {null};
if (typeName _variable_name != "STRING") exitWith {null};
if (undefined(_time_out)) exitWith {null};
if (typeName _time_out != "SCALAR") exitWith {null};
if (_time_out < 0) exitWith {null};


private["_end_time"];
_end_time = serverTime + _time_out;

while {true} do {
	private["_variable_value"];
	_variable_value = [_object, _variable_name] call A_object_fnc_getVariable;
	if (not(undefined(_variable_value))) exitWith {null};
	if (_end_time < serverTime) exitWith {
		private["_message"];
		_message = format["WARNING: Time-out occurred while waiting for ""%1"" on ""%2""", _variable_name, _object];
		player groupChat _message;
		diag_log _message;
	};
};
