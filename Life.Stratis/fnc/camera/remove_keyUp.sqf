// A_camera_fnc_remove_keyUp

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


disableSerialization;
    _display = findDisplay 46;
if (not(undefined(camera_keyUpHandler_id))) then {
	_display displayRemoveEventHandler  ["keyUp", camera_keyUpHandler_id];
	camera_keyUpHandler_id = null;
};
