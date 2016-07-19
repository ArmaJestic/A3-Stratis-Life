// A_camera_fnc_setup_mouseMoving

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_data"];
_data = _this;
disableSerialization;
    _display = findDisplay 46;
if ( undefined(camera_mouseMoving_id) ) then {
	camera_mouseMoving_id = _display displayAddEventHandler  ["mouseMoving", format["[_this, %1] call A_camera_fnc_mouseMoving_handler", _data]];
};
