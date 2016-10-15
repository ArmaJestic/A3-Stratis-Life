// A_police_menu_fnc_vehicle_menu_create

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_prison_button"];
_prison_button = ["Prison Menu", A_interaction_fnc_warrants_menu];

private["_warrants_button"];
_warrants_button = ["Warrants Menu", A_interaction_fnc_warrants_menu];

private["_crimes_button"];
_crimes_button = ["Crime Log", A_main_menu_fnc_handle_crimes];

private["_markers_button"];
_markers_button = ["Side Markers (ON/OFF)", A_interaction_fnc_toggle_side_markers];

private["_prison_camera_button"];
_prison_camera_button = ["Prison Camera", A_police_menu_fnc_menu_prison_camera_handler];

private["_civilian_camera_button"];
_civilian_camera_button = ["Civilian Camera", A_interaction_fnc_civilian_camera_menu];

private["_satellite_camera_button"];
_satellite_camera_button = ["Satellite Camera", A_police_menu_fnc_menu_satellite_camera_handler];

private["_buttons_data"];

_buttons_data = [
	_prison_button,
	_warrants_button,
	_prison_camera_button,
	_civilian_camera_button,
	_satellite_camera_button,
	_crimes_button,
	_markers_button
	];

[toUpper("Police Vehicle Menu"), _buttons_data] call A_main_menu_fnc_setup;
