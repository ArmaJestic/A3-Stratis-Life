// A_doors_fnc_doors_remove_MouseZChanged

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


disableSerialization;
    _display = findDisplay 46;
if (not(undefined(A_doors_var_doors_MouseZChangedHandler_id))) then {
	_display displayRemoveEventHandler  ["MouseZChanged", A_doors_var_doors_MouseZChangedHandler_id];
	A_doors_var_doors_MouseZChangedHandler_id = null;
};
