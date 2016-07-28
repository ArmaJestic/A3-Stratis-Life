// A_input_fnc_animation_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith { false };
if(arrested) exitWith{ false };
private["_player"];
_player = player;
if (([_player, (vehicle _player)] call A_mounted_fnc_player_inside)) exitWith { false };

if(dialog) exitWith {closeDialog 0;};
[_player] call A_interaction_fnc_animations_menu;
true
