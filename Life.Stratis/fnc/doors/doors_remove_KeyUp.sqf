// A_doors_fnc_doors_remove_KeyUp

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


disableSerialization;
     _display = call A_doors_fnc_doors_wait_display;
if (not(undefined(A_doors_var_doors_KeyUpHandler_id))) then {
	_display displayRemoveEventHandler  ["KeyUp", A_doors_var_doors_KeyUpHandler_id];
	A_doors_var_doors_KeyUpHandler_id = null;
};
