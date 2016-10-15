// A_convoy_fnc_set_state

#include "header.h"



ARGV(0,_truck);
ARGV(1,_state);
[_truck, "state", _state, true] call A_object_fnc_setVariable;
