// A_camera_fnc_remove_keyDown

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


disableSerialization;
    _display = findDisplay 46;
if (not(undefined(camera_keyDownHandler_id))) then {
	_display displayRemoveEventHandler  ["keyDown", camera_keyDownHandler_id];
	camera_keyDownHandler_id = null;
};
