// A_camera_fnc_setup_mouseButtonClick

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


private["_data"];
_data = _this;
disableSerialization;
private["_control"];
    _control = call A_camera_fnc_map_control;
if ( UNDEFINED(camera_mouseButtonClick_id) ) then {
	camera_mouseButtonClick_id = _control ctrlAddEventHandler  ["MouseButtonClick", format["[_this, %1] call A_camera_fnc_mouseButtonClick_handler", _data]];
	//player groupChat format["camera_mouseButtonClick_id = %1",camera_mouseButtonClick_id];
};
