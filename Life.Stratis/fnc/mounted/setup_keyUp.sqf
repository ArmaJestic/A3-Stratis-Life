// A_mounted_fnc_setup_keyUp

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_data"];
_data = _this;

disableSerialization;
    _display = findDisplay 46;
if ( undefined(mounted_keyUpHandler_id) ) then {
	A_mounted_fnc_keyUpHandler_id = _display displayAddEventHandler  ["keyUp", format["[_this, %1] call A_mounted_fnc_keyUpHandler", _data]];
};
