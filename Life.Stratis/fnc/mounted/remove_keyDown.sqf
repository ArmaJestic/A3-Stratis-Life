// A_mounted_fnc_remove_keyDown

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


disableSerialization;
    _display = findDisplay 46;
if (not(undefined(mounted_keyDownHandler_id))) then {
	_display displayRemoveEventHandler  ["keyDown", mounted_keyDownHandler_id];
	mounted_keyDownHandler_id = null;
};
