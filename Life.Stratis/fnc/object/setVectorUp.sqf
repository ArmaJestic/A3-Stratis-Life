// A_object_fnc_setVectorUp

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_vector);
if (!([_object] call A_object_fnc_exists)) exitWith {};
if (undefined(_vector)) exitWith {};
if (typeName _vector != "ARRAY") exitWith {};

_object allowDamage false;
_object setVectorUp _vector;
_object allowDamage true;
