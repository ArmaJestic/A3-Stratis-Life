// A_actions_fnc_action
// Used to execute functions from an action call
// Kind of redundant now that A3 addaction supports putting code in place of a script name
//	addAction passes
//	Index
//	0	target, object action attached to
//	1	caller, unit activated action
//	2	id, ID of activated action
//	3	arguments, arguments from addAction


#include "..\..\includes\macro.h"


params [["_target", null], ["_caller", null], ["_id", null, [0]], ["_data", null, [[]], 2]];

_data params["_function_arguments","_function_name"];
private _function = missionNamespace getVariable [_function_name,null];

if (UNDEFINED(_function)) exitWith {};

[_function_arguments, _target, _caller, _id] spawn _function;