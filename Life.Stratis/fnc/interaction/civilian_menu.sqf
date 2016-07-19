// A_interaction_fnc_civilian_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

private["_buttons"];
_buttons = [
	["Rob Player", A_interaction_fnc_rob_handler, [_player, _target]],
	["Frisk Player", A_interaction_fnc_frisk_handler, [_player, _target]]
];

[toUpper("Interaction Menu"), _buttons] call A_main_menu_fnc_setup;
