// A_input_fnc_init2

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"

if (isServer) exitwith {};

{
	private["_action"];
	_action = _x;
	A_input_var_overlapping_keys = A_input_var_overlapping_keys + (actionKeys _action);
} foreach A_input_var_overlapping_actions;

[] call A_input_fnc_setup;
[] call A_input_fnc_setup_mousebuttondown;