#include "macro.h"
#include "constants.h"

if (not(undefined(jip_functions_defined))) exitWith {};

if (isServer) then {
	jip_registry = [];
};

jip_entry_arguments = 0;
jip_entry_callback = 1;
jip_entry_object = 2;

jip_message = {
	ARGV(0,_message);
	if (undefined(_message)) exitWith {};
	diag_log _message;
	//player globalChat _message;
};



jip_register_request_receive = {
	[format["jip_register_request_receive %1", _this]] call jip_message;

	ARGV(0,_variable);
	ARGV(1,_this);
	
	ARGV(0,_arguments);
	ARGV(1,_callback);
	ARGV(2,_target);
	ARGV(3,_persist);
	ARGV(4,_object);
	
	if (undefined(_arguments)) exitWith {};
	if (undefined(_callback)) exitWith {};
	if (undefined(_object) || {not(typeName _object == "OBJECT" || {typeName _object == "SCALAR"})}) then {
		_object = true;
	};
	
	[_arguments, _callback, _target, false] call BIS_fnc_MP;
	
	private["_jip_entry"];
	_jip_entry = [];
	_jip_entry set [jip_entry_arguments, _arguments];
	_jip_entry set [jip_entry_callback, _callback];
	_jip_entry set [jip_entry_object, _object];
	
	jip_registry set [count(jip_registry), _jip_entry];
	[] call jip_cleanup;
};

jip_cleanup = {
	{
		private["_entry", "_entry_object"];
		_entry = _x;
		_entry_object = _entry select jip_entry_object;
		if ((typeName _entry_object == "OBJECT") && {isNull _entry_object}) then {
			jip_registry set [_forEachIndex, objNull];
		};

		if ((typename _entry_object == "SCALAR") && {_entry_object > serverTime}) then {
			jip_registry set [_forEachIndex, objNull];
		};
		
	} forEach jip_registry;
	jip_registry = jip_registry - [objNull];
};

jip_register_setup = {
	if (not(isServer)) exitWith {};

	[format["jip_register_setup %1", _this]] call jip_message;
	jip_register_request_buffer =  " ";
	publicVariableServer "jip_register_request_buffer";
	"jip_register_request_buffer" addPublicVariableEventHandler { _this call jip_register_request_receive;};
};

jip_register = {
	if (undefined(_this)) exitWith {};

	jip_register_request_buffer = _this;
	if (isServer) then {
		["", jip_register_request_buffer] call jip_register_request_receive;
	}
	else {
		publicVariableServer "jip_register_request_buffer";
	};
};



jip_get_request_receive = {
	[format["jip_get_request_receive %1", _this]] call jip_message;

	ARGV(0,_variable);
	ARGV(1,_this);
	
	ARGV(0,_object);
	ARGV(1,_jip_variable);

	if (undefined(_object)) exitWith {};
	if (undefined(_jip_variable)) exitWith {};
	
	private["_data"];
	_data = missionNamespace getVariable [_jip_variable, null];
	[_object, _jip_variable, _data] call jip_set;
};

jip_get_setup = {
	if (not(isServer)) exitWith {};
	[format["jip_get_setup %1", _this]] call jip_message;
	jip_get_request_buffer =  " ";
	publicVariableServer "jip_get_request_buffer";
	"jip_get_request_buffer" addPublicVariableEventHandler { _this call jip_get_request_receive;};
};

jip_get = {
	ARGV(0,_object);
	ARGV(1,_jip_variable);

	jip_get_request_buffer = [_object,_jip_variable];
	if (isServer) then {
		["", jip_get_request_buffer] call jip_get_request_receive;
	}
	else {
		publicVariableServer "jip_get_request_buffer";
	};
};


jip_set = {
	ARGV(0,_object);
	ARGV(1,_variable_name);
	ARGV(2,_value);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_variable_name)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (typeName _variable_name != "STRING") exitWith {};
	
	if (undefined(_value)) exitWIth {
		_object setVariable [_variable_name, nil, true];
	};
	
	_object setVariable [_variable_name, _value, true];
};

jip_wait = {
	ARGV(0,_player);
	ARGV(1,_jip_variable);
	ARGV(2,_sleep_method);
	
	
	if (undefined(_sleep_method)) then {
		_sleep_method = {
			uiSleep (_this select 0);
		};
	};
	
	[_player, _jip_variable, null] call jip_set;
	[_player, _jip_variable] call jip_get;
	
	private["_jip_data"];
	_jip_data = null;
	private["_start_time"];
	_start_time = time;
	
	
	while {true} do {
		private["_time_diff"];
		_time_diff = time - _start_time;
		if (_time_diff > 3) exitWith {
			[format["WARNING: Timeout occurred while waiting for JIP data"]] call jip_message;
		};
		
		_jip_data = _player getVariable [_jip_variable, null];
		if (defined(_jip_data) && {typeName _jip_data == "ARRAY"}) exitWith {};
		[0.1] call _sleep_method;
	};
	
	_jip_data
};

jip_load = {
	if (isServer) exitWith {};
	
	[format["JIP: loading"]] call jip_message;
	
	private["_object", "_jip_variable"];
	_object = player;
	_jip_variable = "jip_registry";
	
	private["_jip_data"];
	_jip_data = [_object, _jip_variable] call jip_wait;
	if (undefined(_jip_data)) exitWith {
		[format["WARNING: Could not load JIP data"]] call jip_message;
	};
	
	[format["JIP: executing"]] call jip_message;
	{
		private["_jip_entry"];
		_jip_entry = _x;
		
		private["_arguments", "_callback"];
		_arguments = _jip_entry select jip_entry_arguments;
		_callback = _jip_entry select jip_entry_callback;
		
		private["_callback_method"];
		_callback_method = missionNamespace getVariable [_callback, null];
		if (undefined(_callback_method)) then {
			[format["WARNING: JIP entry skipped, method '%1' not found", _callback]] call jip_message;
		}
		else {
			[_arguments, _callback_method] call jip_execute;
		};
	} forEach _jip_data;
	
	[_object, _jip_variable, null] call jip_set;
	[format["JIP: complete"]] call jip_message;
};

jip_execute = { _this spawn {
	ARGV(0,_arguments);
	ARGV(1,_method);
	if (undefined(_arguments)) exitWith {};
	if (undefined(_method)) exitWith {};
	if (typeName _method != "CODE") exitWith {};
	
	_arguments call _method;
};};

jip_setup = {
	if (not(isServer)) exitWIth {};
	[] call jip_register_setup;
	[] call jip_get_setup;
};


[] call jip_setup;

jip_functions_defined = true;