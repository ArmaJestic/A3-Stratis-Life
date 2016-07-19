// A_camera_fnc_setup_keyDown

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( undefined(camera_keyDownHandler_id) ) then {
	A_camera_fnc_keyDownHandler_id = _display displayAddEventHandler  ["keyDown", format["[_this, %1] call A_camera_fnc_keyDownHandler", _data]];
};
