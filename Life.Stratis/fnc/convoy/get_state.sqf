// A_convoy_fnc_get_state

#include "header.h"



ARGV(0,_truck);

private["_state"];
_state = [_truck, "state"] call A_object_fnc_getVariable;
_state = if (UNDEFINED(_state)) then {CONVOY_ST_UNKNOWN} else {_state};
_state
