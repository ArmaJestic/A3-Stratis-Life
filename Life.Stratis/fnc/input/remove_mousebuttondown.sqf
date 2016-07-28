// A_input_fnc_remove_mousebuttondown

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


disableSerialization;
private["_display"];
    _display = findDisplay 46;
if (not(undefined(mouseButtonDown_id))) then {
	_display displayRemoveEventHandler  ["MouseButtonDown", mouseButtonDown_id];
	mouseButtonDown_id = null;
};
