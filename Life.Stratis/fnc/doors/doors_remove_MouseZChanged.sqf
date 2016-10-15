// A_doors_fnc_doors_remove_MouseZChanged

#include "header.h"


disableSerialization;
    _display = findDisplay 46;
if (!(UNDEFINED(A_doors_var_doors_MouseZChangedHandler_id))) then {
	_display displayRemoveEventHandler  ["MouseZChanged", A_doors_var_doors_MouseZChangedHandler_id];
	A_doors_var_doors_MouseZChangedHandler_id = null;
};
