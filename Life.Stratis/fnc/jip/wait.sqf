// A_jip_fnc_wait

#include "../../includes/macro.h"
#include "../../includes/constants.h"

ARGV(0,_player);
ARGV(1,_jip_variable);
ARGV(2,_sleep_method);


if (undefined(_sleep_method)) then {
	_sleep_method = {
		uiSleep (_this select 0);
	};
};

[_player, _jip_variable, null] call A_jip_fnc_set;
[_player, _jip_variable] call A_jip_fnc_get;

private["_jip_data"];
_jip_data = null;
private["_start_time"];
_start_time = time;


while {true} do {
	private["_time_diff"];
	_time_diff = time - _start_time;
	if (_time_diff > 3) exitWith {
		[format["WARNING: Timeout occurred while waiting for JIP data"]] call A_jip_fnc_message;
	};
	
	_jip_data = _player getVariable [_jip_variable, null];
	if (defined(_jip_data) && {typeName _jip_data == "ARRAY"}) exitWith {};
	[0.1] call _sleep_method;
};

_jip_data
