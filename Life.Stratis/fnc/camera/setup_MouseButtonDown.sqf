// A_camera_fnc_setup_MouseButtonDown

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_data"];
_data = _this;
disableSerialization;
private["_display"];
    _display = findDisplay 46;
if ( undefined(camera_MouseButtonDown_id) ) then {
	camera_MouseButtonDown_id = _display displayAddEventHandler  ["MouseButtonDown", format["[_this, %1] call A_camera_fnc_MouseButtonDown_handler", _data]];
	//player groupChat format["camera_MouseButtonDown_id = %1",camera_MouseButtonDown_id];
};
