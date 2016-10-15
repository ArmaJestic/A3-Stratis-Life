// A_camera_fnc_setup_keyDown

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


disableSerialization;
private["_data", "_display"];
_data = _this;
_display = findDisplay 46;
if (UNDEFINED(camera_keyDownHandler_id)) then {
	A_camera_fnc_keyDownHandler_id = _display displayAddEventHandler["keyDown", format["[_this, %1] call A_camera_fnc_keyDownHandler", _data]];
};