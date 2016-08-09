// A_input_fnc_admin_menu_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
if (!([player] call A_player_fnc_admin)) exitWith {false};

[player] call A_interaction_fnc_admin_menu;
true
