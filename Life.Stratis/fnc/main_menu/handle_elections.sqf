// A_main_menu_fnc_handle_elections

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_title);

private["_president_button"];
_president_button = ["President", A_voting_menu_fnc_menu_president];

private["_police_button"];
_police_button = ["Police Chief", A_voting_menu_fnc_menu_police];

private["_buttons_data"];

_buttons_data = [
	_president_button,
	_police_button
];

[toUpper("Elections Menu"), _buttons_data] call A_main_menu_fnc_setup;
