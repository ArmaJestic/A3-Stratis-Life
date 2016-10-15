// A_input_fnc_breakout_vehicle_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {false};
if (A_main_var_keyblock) exitWith {false};
[player, (vehicle player)] spawn A_interaction_fnc_vehicle_breakout;
true
