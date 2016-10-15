// A_input_fnc_animation_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {false};
if(arrested) exitWith{false};

if (([player, (vehicle player)] call A_mounted_fnc_player_inside)) exitWith {false};

if(dialog) exitWith {closeDialog 0; true};
[player] call A_interaction_fnc_animations_menu;
true