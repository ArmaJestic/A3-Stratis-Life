// A_mounted_fnc_remove_keyDown

#include "header.h"


disableSerialization;
    _display = findDisplay 46;
if (!(UNDEFINED(mounted_keyDownHandler_id))) then {
	_display displayRemoveEventHandler  ["keyDown", mounted_keyDownHandler_id];
	mounted_keyDownHandler_id = null;
};
