// A_vehicle_fnc_toggle_lock

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

private["_state"];
_state = locked _vehicle;

if (_state == 2) then {
	_state = 0;
}
else { if (_state == 0 || _state == 1) then {
	_state = 2;
}
else {
	_state = 0;
};};

_state = if (_state == 2) then {true} else {false};

[_vehicle, "locked", _state, true] call A_object_fnc_setVariable;
format["%1 lock %2", _vehicle, _state] call broadcast;
_state
