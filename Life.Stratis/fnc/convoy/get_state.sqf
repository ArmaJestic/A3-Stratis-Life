// A_convoy_fnc_get_state

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_truck);

private["_state"];
_state = [_truck, "state"] call A_object_fnc_getVariable;
_state = if (undefined(_state)) then {UNKNOWN} else {_state};
_state
