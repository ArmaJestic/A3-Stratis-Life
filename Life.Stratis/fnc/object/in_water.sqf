// A_object_fnc_in_water

#include "..\..\includes\macro.h"


ARGV(0,_object);
if (!([_object] call A_object_fnc_exists)) exitWith {false};

private["_pos"];
_pos = _object modelToWorld [0,0,0];

if (!(surfaceIsWater _pos)) exitWith {false};
if ((_pos select 2) >= 0) exitWith {false};
true
