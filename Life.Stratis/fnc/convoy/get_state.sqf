// A_convoy_fnc_get_state

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);

private["_state"];
_state = [_truck, "state"] call A_object_fnc_getVariable;
_state = if (undefined(_state)) then {CONVOY_ST_UNKNOWN} else {_state};
_state
