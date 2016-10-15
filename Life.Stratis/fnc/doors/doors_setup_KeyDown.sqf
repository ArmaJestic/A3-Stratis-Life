// A_doors_fnc_doors_setup_KeyDown

#include "header.h"


disableSerialization;
private _display = (findDisplay 46);
if UNDEFINED(A_doors_var_doors_KeyDownHandler_id) then {
	A_doors_var_doors_KeyDownHandler_id = _display displayAddEventHandler  ["KeyDown", {_this call A_doors_fnc_doors_KeyDownHandler}];
};