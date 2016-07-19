// A_mounted_fnc_remove_keyUp

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


disableSerialization;
    _display = findDisplay 46;
if (not(undefined(mounted_keyUpHandler_id))) then {
	_display displayRemoveEventHandler  ["keyUp", mounted_keyUpHandler_id];
	mounted_keyUpHandler_id = null;
};
