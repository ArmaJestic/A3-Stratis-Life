// A_police_menu_fnc_field_menu_create

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_prison_button"];
_prison_button = ["Prison Menu", A_interaction_fnc_warrants_menu];

private["_warrants_button"];
_warrants_button = ["Warrants Menu", A_interaction_fnc_warrants_menu];

private["_markers_button"];
_markers_button = ["Side Markers (on/off)", A_interaction_fnc_toggle_side_markers];

private["_crimes_button"];
_crimes_button = ["Crime Log", A_main_menu_fnc_handle_crimes];

private["_buttons_data"];

_buttons_data = [
	_prison_button,
	_warrants_button,
	_markers_button,
	_crimes_button
	];

[toUpper("Police Field Menu"), _buttons_data] call A_main_menu_fnc_setup;
