// A_object_fnc_exists

#include "../../includes/macro.h"


ARGV(0,_object);
if (undefined(_object)) exitWith {false};
if (typeName _object != "OBJECT") exitWith {false};
if (isNull _object) exitWith {false};
true
