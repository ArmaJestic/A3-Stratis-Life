// A_input_fnc_breakout_vehicle_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
if (A_main_var_keyblock) exitWith {false};
[player, (vehicle player)] spawn A_interaction_fnc_vehicle_breakout;
true
