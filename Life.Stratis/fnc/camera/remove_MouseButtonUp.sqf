// A_camera_fnc_remove_MouseButtonUp

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


disableSerialization;
private["_display"];
    _display = findDisplay 46;
if (not(undefined(camera_MouseButtonUp_id))) then {
	_display displayRemoveEventHandler  ["MouseButtonUp", camera_MouseButtonUp_id];
	camera_MouseButtonUp_id = null;
};
