// A_input_fnc_setup_mousebuttondown

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


disableSerialization;
private _display = findDisplay 46;
if (UNDEFINED(mouseButtonDown_id)) then {
	mouseButtonDown_id = _display displayAddEventHandler["MouseButtonDown", {_this call A_input_fnc_mousebuttondown_handler}];
};