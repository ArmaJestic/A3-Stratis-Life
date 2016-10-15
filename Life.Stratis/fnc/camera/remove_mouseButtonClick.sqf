// A_camera_fnc_remove_mouseButtonClick

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


disableSerialization;
private["_control"];
    _control = call A_camera_fnc_map_control;
if (!(UNDEFINED(camera_mouseButtonClick_id))) then {
	_control ctrlRemovEeventHandler  ["MouseButtonClick", camera_mouseButtonClick_id];
	camera_mouseButtonClick_id = null;
};
