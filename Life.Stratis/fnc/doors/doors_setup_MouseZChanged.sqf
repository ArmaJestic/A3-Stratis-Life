// A_doors_fnc_doors_setup_MouseZChanged

#include "header.h"


disableSerialization;
private _display = findDisplay 46;
if UNDEFINED(A_doors_var_doors_MouseZChangedHandler_id) then {
	A_doors_var_doors_MouseZChangedHandler_id = _display displayAddEventHandler["MouseZChanged", {_this call A_doors_fnc_doors_MouseZChangedHandler}];
};