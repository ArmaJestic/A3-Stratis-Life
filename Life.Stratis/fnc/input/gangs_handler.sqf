// A_input_fnc_gangs_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
if (!(isciv)) exitWith {false};
[player] call A_interaction_fnc_gang_menu;
true
