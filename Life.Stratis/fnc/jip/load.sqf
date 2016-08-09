// A_jip_fnc_load

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

if (isServer) exitWith {};

[format["JIP: loading"]] call A_jip_fnc_message;

private["_object", "_jip_variable"];
_object = player;
_jip_variable = "A_jip_var_registry";

private["_jip_data"];
_jip_data = [_object, _jip_variable] call A_jip_fnc_wait;
if (undefined(_jip_data)) exitWith {
	[format["WARNING: Could not load JIP data"]] call A_jip_fnc_message;
};

[format["JIP: executing"]] call A_jip_fnc_message;
{
	private["_jip_entry"];
	_jip_entry = _x;
	
	private["_arguments", "_callback"];
	_arguments = _jip_entry select A_jip_var_arguments;
	_callback = _jip_entry select A_jip_var_callback;
	
	private["_callback_method"];
	_callback_method = missionNamespace getVariable [_callback, null];
	if (undefined(_callback_method)) then {
		[format["WARNING: JIP entry skipped, method '%1' not found", _callback]] call A_jip_fnc_message;
	}else{
		[_arguments, _callback_method] call A_jip_fnc_execute;
	};
} forEach _jip_data;

[_object, _jip_variable, null] call A_jip_fnc_set;
[format["JIP: complete"]] call A_jip_fnc_message;
