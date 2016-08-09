// A_jip_fnc_register_request_receive

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

[format["A_jip_fnc_register_request_receive %1", _this]] call A_jip_fnc_message;

ARGV(0,_variable);
ARGV(1,_this);

ARGV(0,_arguments);
ARGV(1,_callback);
ARGV(2,_target);
ARGV(3,_persist);
ARGV(4,_object);

if (undefined(_arguments)) exitWith {};
if (undefined(_callback)) exitWith {};
if (undefined(_object) || {!(typeName _object == "OBJECT" || {typeName _object == "SCALAR"})}) then {
	_object = true;
};

[_arguments, _callback, _target, false] call BIS_fnc_MP;

private["_jip_entry"];
_jip_entry = [];
_jip_entry set [A_jip_var_arguments, _arguments];
_jip_entry set [A_jip_var_callback, _callback];
_jip_entry set [A_jip_var_object, _object];

A_jip_var_registry set [count(A_jip_var_registry), _jip_entry];
[] call A_jip_fnc_cleanup;
