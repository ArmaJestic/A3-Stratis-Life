// A_input_fnc_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


disableSerialization;
private["_display"];
_display = null;
waituntil {
	_display = findDisplay 46;
	if (undefined(_display)) exitWith {false};
	if (isNull _display) exitWith {false};
	true
};

_display displayAddEventHandler ["KeyDown", "_this call A_input_fnc_keydown_handler"];
_display displayAddEventHandler ["KeyUp", "_this call A_input_fnc_keyup_handler"];
_display displayAddEventHandler ["KeyDown", "_this call A_input_fnc_admin_handler"];

[] call A_doors_fnc_doors_setup_MouseZChanged;
[] call A_doors_fnc_doors_setup_KeyDown;
[] call A_doors_fnc_doors_setup_KeyUp;
