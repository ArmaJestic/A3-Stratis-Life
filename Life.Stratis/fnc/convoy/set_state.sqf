// A_convoy_fnc_set_state

#include "../../includes/macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_truck);
ARGV(1,_state);
[_truck, "state", _state, true] call A_object_fnc_setVariable;
