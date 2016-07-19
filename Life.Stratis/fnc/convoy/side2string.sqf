// A_convoy_fnc_side2string

#include "../../includes/macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_side);

if (_side == east) exitWith {"Opfor"};
if (_side == west) exitWith {"Cop"};
if (_side == civilian) exitWith {"Civilian"};
if (_side == resistance) exitWith {"Insurgent"};
"Neither"
