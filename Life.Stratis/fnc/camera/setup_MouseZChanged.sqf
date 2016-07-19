// A_camera_fnc_setup_MouseZChanged

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


private["_data"];
_data = _this;
disableSerialization;
private["_control"];
    _control = findDisplay 46;
if ( undefined(camera_MouseZChanged_id) ) then {
	camera_MouseZChanged_id = _control displayAddEventHandler  ["MouseZChanged", format["[_this, %1] call A_camera_fnc_MouseZChanged_handler", _data]];
	//player groupChat format["camera_MouseZChanged_id = %1",camera_MouseZChanged_id];
};
