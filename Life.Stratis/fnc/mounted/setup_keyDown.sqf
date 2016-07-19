// A_mounted_fnc_setup_keyDown

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( undefined(mounted_keyDownHandler_id) ) then {
	A_mounted_fnc_keyDownHandler_id = _display displayAddEventHandler  ["keyDown", format["[_this, %1] call A_mounted_fnc_keyDownHandler", _data]];
};
