// A_doors_fnc_doors_setup_KeyUp

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = call A_doors_fnc_doors_wait_display;
if ( undefined(A_doors_var_doors_KeyUpHandler_id) ) then {
	A_doors_var_A_doors_fnc_doors_KeyUpHandler_id = _display displayAddEventHandler  ["KeyUp", format["[_this, %1] call A_doors_fnc_doors_KeyUpHandler", _data]];
};
