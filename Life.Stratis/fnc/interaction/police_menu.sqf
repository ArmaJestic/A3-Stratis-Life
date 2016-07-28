// A_interaction_fnc_police_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

private["_buttons"];
_buttons = [
	["Disarm", A_interaction_fnc_disarm_handler, [_player,_target]],
	["Drug A_missions_fnc_search", A_interaction_fnc_search_handler, [_player,_target]],
	["Arrest", A_interaction_fnc_arrest_handler, [_player,_target]],
	["Restrain/Release", A_interaction_fnc_restrain_handler, [_player,_target]],
	["Ticket", A_interaction_fnc_ticket_handler, [_player,_target]],
	["Heal", A_interaction_fnc_heal_handler, [_player,_target]],
	["Frisk", A_interaction_fnc_frisk_handler, [_player,_target]]
];

[toUpper("Interaction Menu"), _buttons] call A_main_menu_fnc_setup;
