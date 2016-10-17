// A_object_fnc_setVectorUp

#include "..\..\includes\macro.h"


params["_object",["_vector",null,[[]]]];
if (!([_object] call A_object_fnc_exists)) exitWith {};
if UNDEFINED(_vector) exitWith {};

_object setVectorUp _vector;