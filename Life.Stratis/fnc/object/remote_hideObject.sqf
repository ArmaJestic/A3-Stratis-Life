// A_object_fnc_remote_hideObject

#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_state);
if (undefined(_object)) exitWith {};
if (undefined(_state)) exitWith {};
_object hideObject _state;
