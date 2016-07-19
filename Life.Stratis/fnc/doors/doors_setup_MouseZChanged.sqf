// A_doors_fnc_doors_setup_MouseZChanged

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( undefined(A_doors_var_doors_MouseZChangedHandler_id) ) then {
	A_doors_var_A_doors_fnc_doors_MouseZChangedHandler_id = _display displayAddEventHandler  ["MouseZChanged", format["[_this, %1] call A_doors_fnc_doors_MouseZChangedHandler", _data]];
};
