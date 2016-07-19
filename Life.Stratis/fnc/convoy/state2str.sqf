// A_convoy_fnc_state2str

#include "../../includes/macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_state);

if (_state == UNKNOWN) exitWith {"UNKNOWN"};
if (_state == INITIAL) exitWith {"INITIAL"};
if (_state == STUCK) exitWith {"STUCK"};
if (_state == MOVING) exitWith {"MOVING"};
"INVALID"
