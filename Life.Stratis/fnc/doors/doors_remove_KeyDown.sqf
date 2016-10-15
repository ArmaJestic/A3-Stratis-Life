// A_doors_fnc_doors_remove_KeyDown

#include "header.h"


disableSerialization;
    _display = findDisplay 46;
if (!(UNDEFINED(A_doors_var_doors_KeyDownHandler_id))) then {
	_display displayRemoveEventHandler  ["KeyDown", A_doors_var_doors_KeyDownHandler_id];
	A_doors_var_doors_KeyDownHandler_id = null;
};
