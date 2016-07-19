// A_camera_fnc_setup_keyUp

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( undefined(camera_keyUpHandler_id) ) then {
	A_camera_fnc_keyUpHandler_id = _display displayAddEventHandler  ["keyUp", format["[_this, %1] call A_camera_fnc_keyUpHandler", _data]];
};
