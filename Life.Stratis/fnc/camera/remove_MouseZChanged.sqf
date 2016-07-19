// A_camera_fnc_remove_MouseZChanged

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


disableSerialization;
private["_control"];
    _control = findDisplay 46;
if (not(undefined(camera_MouseZChanged_id))) then {
	_control displayRemovEeventHandler  ["MouseZChanged", camera_MouseZChanged_id];
	camera_MouseZChanged_id = null;
};
