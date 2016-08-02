// A_convoy_fnc_state2str

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_state);

if (_state == CONVOY_ST_UNKNOWN) exitWith {"CONVOY_ST_UNKNOWN"};
if (_state == CONVOY_ST_INITIAL) exitWith {"CONVOY_ST_INITIAL"};
if (_state == CONVOY_ST_STUCK) exitWith {"CONVOY_ST_STUCK"};
if (_state == CONVOY_ST_MOVING) exitWith {"CONVOY_ST_MOVING"};
"INVALID"
