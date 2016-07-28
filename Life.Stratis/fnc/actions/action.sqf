// A_actions_fnc_action

#include "..\..\includes\macro.h"


ARGV(0,_target);
ARGV(1,_caller);
ARGV(2,_id);
ARGV(3,_data);

if (undefined(_data)) exitWith {};
if (typeName _data != "ARRAY") exitWIth {};
if (count _data < 2) exitWith {};

private["_function_name", "_function_arguments"];
_function_arguments = _data select 0;
_function_name = _data select 1;

private["_function"];
_function = missionNamespace getVariable [_function_name, null];
if (undefined(_function)) exitWith {};

[_function_arguments, _target, _caller, _id] spawn _function;
