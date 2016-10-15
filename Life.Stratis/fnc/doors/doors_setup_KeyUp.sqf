// A_doors_fnc_doors_setup_KeyUp

#include "header.h"


disableSerialization;
private _display = (findDisplay 46);
if UNDEFINED(A_doors_var_doors_KeyUpHandler_id) then {
	A_doors_var_doors_KeyUpHandler_id = _display displayAddEventHandler  ["KeyUp", {_this call A_doors_fnc_doors_KeyUpHandler}];
};