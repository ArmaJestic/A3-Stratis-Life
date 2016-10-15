// A_object_fnc_remote_hideObject

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_state);
if (UNDEFINED(_object)) exitWith {};
if (UNDEFINED(_state)) exitWith {};
_object hideObject _state;
