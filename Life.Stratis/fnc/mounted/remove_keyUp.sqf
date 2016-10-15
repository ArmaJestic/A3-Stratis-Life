// A_mounted_fnc_remove_keyUp

#include "header.h"


disableSerialization;
    _display = findDisplay 46;
if (!(UNDEFINED(mounted_keyUpHandler_id))) then {
	_display displayRemoveEventHandler  ["keyUp", mounted_keyUpHandler_id];
	mounted_keyUpHandler_id = null;
};
