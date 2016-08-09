// A_actions_fnc_action
// Used to execute functions from an action call
// Kind of redundant now that A3 addaction supports putting code in place of a script name
/*
	addAction passes
	Index
	0	target, object action attached to
	1	caller, unit activated action
	2	id, ID of activated action
	3	arguments, arguments from addAction
*/

#include "..\..\includes\macro.h"


//ARGV(0,_target);
//ARGV(1,_caller);
//ARGV(2,_id);
//ARGV(3,_data);

//private _err = params[["_target", null], ["_caller", null], ["_id", null, [0]], ["_data", null, [[]], 2]];
//EXT_ERR(_err, A_actions_fnc_action)

//PARAM_EXIT(A_actions_fnc_action, [[QUOTE(_target), null], [QUOTE(_caller), null], [QUOTE(_id), null, [0]], [QUOTE(_data), null, [[]], 2]])
if !(params [["_target", null], ["_caller", null], ["_id", null, [0]], ["_data", null, [[]], 2]]) exitwith {LOGE_EP(A_actions_fnc_action)};

//if (undefined(_data)) exitWith {"A_actions_fnc_action error: undefined data" call A_err_fnc_log;};

private _function_arguments = _data select 0;
private _function_name = _data select 1;
private _function = missionNamespace getVariable [_function_name, null];

if (undefined(_function)) exitWith {"A_actions_fnc_action error: undefined function" call A_err_fnc_log;};

[_function_arguments, _target, _caller, _id] spawn _function;
