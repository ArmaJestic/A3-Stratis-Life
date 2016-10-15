// A_camera_fnc_remove_MouseButtonDown

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


disableSerialization;
private["_display"];
    _display = findDisplay 46;
if (!(UNDEFINED(camera_MouseButtonDown_id))) then {
	_display displayRemoveEventHandler  ["MouseButtonDown", camera_MouseButtonDown_id];
	camera_MouseButtonDown_id = null;
};
