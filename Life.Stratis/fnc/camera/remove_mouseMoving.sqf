// A_camera_fnc_remove_mouseMoving

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


disableSerialization;
    _display = findDisplay 46;
if (!(UNDEFINED(camera_mouseMoving_id))) then {
	_display displayRemoveEventHandler  ["mouseMoving", camera_mouseMoving_id];
	camera_mouseMoving_id = null;
};
