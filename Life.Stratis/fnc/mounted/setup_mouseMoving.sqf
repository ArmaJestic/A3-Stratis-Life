// A_mounted_fnc_setup_mouseMoving

#include "header.h"


private["_data"];
_data = _this;
disableSerialization;
    _display = findDisplay 46;
if ( UNDEFINED(mounted_mouseMoving_id) ) then {
	mounted_mouseMoving_id = _display displayAddEventHandler  ["mouseMoving", format["[_this, %1] call A_mounted_fnc_mouseMoving_handler", _data]];
};
