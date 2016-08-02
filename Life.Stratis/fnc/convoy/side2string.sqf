// A_convoy_fnc_side2string

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_side);

if (_side == east) exitWith {"Opfor"};
if (_side == west) exitWith {"Cop"};
if (_side == civilian) exitWith {"Civilian"};
if (_side == resistance) exitWith {"Insurgent"};
"Neither"
