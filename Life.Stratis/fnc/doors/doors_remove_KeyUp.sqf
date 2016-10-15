// A_doors_fnc_doors_remove_KeyUp

#include "header.h"


disableSerialization;
private _display = (findDisplay 46);
if DEFINED(A_doors_var_doors_KeyUpHandler_id) then {
	_display displayRemoveEventHandler  ["KeyUp", A_doors_var_doors_KeyUpHandler_id];
	A_doors_var_doors_KeyUpHandler_id = null;
};