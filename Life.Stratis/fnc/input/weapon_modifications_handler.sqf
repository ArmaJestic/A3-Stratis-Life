// A_input_fnc_weapon_modifications_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
if ([player] call A_player_fnc_get_dead) exitWith {false};

[player] call A_interaction_fnc_weapon_modifications_menu;

true
