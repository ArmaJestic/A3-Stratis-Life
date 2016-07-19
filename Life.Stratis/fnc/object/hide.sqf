// A_object_fnc_hide

#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_state);
if (undefined(_object)) exitWith {};
if (undefined(_state)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (typeName _state != "BOOL") exitWith {};

_object hideObject _state;
