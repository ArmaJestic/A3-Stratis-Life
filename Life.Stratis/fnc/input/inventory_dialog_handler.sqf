// A_input_fnc_inventory_dialog_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
[player] spawn A_interaction_fnc_inventory_menu;
true
