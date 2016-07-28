// A_input_fnc_setup_mousebuttondown

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_data"];
_data = _this;
disableSerialization;
private["_display"];
    _display = findDisplay 46;
if ( undefined(mouseButtonDown_id) ) then {
	mouseButtonDown_id = _display displayAddEventHandler  ["MouseButtonDown", format["[_this, %1] call A_input_fnc_mousebuttondown_handler", _data]];
	player groupChat format["mouseButtonDown_id = %1",mouseButtonDown_id];
};
