// A_mounted_fnc_setup_keyUp

#include "header.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( UNDEFINED(mounted_keyUpHandler_id) ) then {
	A_mounted_fnc_keyUpHandler_id = _display displayAddEventHandler  ["keyUp", format["[_this, %1] call A_mounted_fnc_keyUpHandler", _data]];
};
