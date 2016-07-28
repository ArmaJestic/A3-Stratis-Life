// A_input_fnc_stun_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
[player] call A_stun_fnc_close_range;
true
