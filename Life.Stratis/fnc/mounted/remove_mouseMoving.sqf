// A_mounted_fnc_remove_mouseMoving

#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


disableSerialization;
    _display = findDisplay 46;
if (not(undefined(mounted_mouseMoving_id))) then {
	_display displayRemoveEventHandler  ["mouseMoving", mounted_mouseMoving_id];
	mounted_mouseMoving_id = null;
};
