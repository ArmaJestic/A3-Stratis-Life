// A_camera_fnc_setup_MouseButtonUp

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


private["_data"];
_data = _this;
disableSerialization;
private["_display"];
    _display = findDisplay 46;
if ( UNDEFINED(camera_MouseButtonUp_id) ) then {
	camera_MouseButtonUp_id = _display displayAddEventHandler  ["MouseButtonUp", format["[_this, %1] call A_camera_fnc_MouseButtonUp_handler", _data]];
	//player groupChat format["camera_MouseButtonUp_id = %1",camera_MouseButtonUp_id];
};
