// A_doors_fnc_doors_setup_KeyDown

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_data"];
_data = _this;

disableSerialization;
     _display = call A_doors_fnc_doors_wait_display;
if ( undefined(A_doors_var_doors_KeyDownHandler_id) ) then {
	A_doors_var_A_doors_fnc_doors_KeyDownHandler_id = _display displayAddEventHandler  ["KeyDown", format["[_this, %1] call A_doors_fnc_doors_KeyDownHandler", _data]];
};
