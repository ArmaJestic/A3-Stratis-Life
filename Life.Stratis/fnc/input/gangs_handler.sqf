// A_input_fnc_gangs_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
if (not(isciv)) exitWith {false};
[player] call A_interaction_fnc_gang_menu;
true
