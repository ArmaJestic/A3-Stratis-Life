// A_input_fnc_get_stunned_allowed_keys

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_keys"];

_keys = [];
{
	private["_action"];
	_action = _x;
	_keys = _keys + (actionKeys _action);
} forEach A_input_var_stunned_allowed_actions;
_keys
