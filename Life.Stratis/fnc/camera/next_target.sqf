// A_camera_fnc_next_target

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_direction);
ARGV(1,_target);

private["_units"];
_units = playableUnits;
_target = if (undefined(_target)) then {_units select 0} else {_target};

private["_index"];
_index = _units find _target;
_index = _index + _direction;
_index = if (_index >= (count(_units))) then {0} else {_index};
_index = if (_index < 0) then { (count _units) - 1} else {_index};
_target = _units select _index;
[_player, "A_camera_fnc_target", _target] call A_object_fnc_setVariable;

(_target)
