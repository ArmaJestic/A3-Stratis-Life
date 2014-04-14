#include "constants.h"
#include "macro.h"

if(not(undefined(police_menu_functions_defined))) exitWith {};

police_main_menu_handler = {
	player groupChat format["police_main_menu_handler %1", _this];
	[] call main_menu_create;
};

police_menu_prison_camera_handler = {
	player groupChat format["police_menu_prison_camera_handler %1", _this];
	ARGV(0,_title);
	ARGV(1,_player);
	
	[_player, prison_logic] call interact_simple_camera;
};

police_menu_satellite_camera_handler = {
	player groupChat format["police_menu_satellite_camera_handler %1", _this];
	ARGV(0,_title);
	ARGV(1,_player);
	
	[_player, [(getPosATL _player select 0), (getPosATL _player select 1), 200]] call interact_satellite_camera;
};

police_vehicle_menu_create = {
	private["_prison_button"];
	_prison_button = ["Prison Menu", interact_warrants_menu];

	private["_warrants_button"];
	_warrants_button = ["Warrants Menu", interact_warrants_menu];

	private["_crimes_button"];
	_crimes_button = ["Crime Log", main_menu_handle_crimes];
	
	private["_markers_button"];
	_markers_button = ["Side Markers (ON/OFF)", interact_toggle_side_markers];

	private["_prison_camera_button"];
	_prison_camera_button = ["Prison Camera", police_menu_prison_camera_handler];

	private["_civilian_camera_button"];
	_civilian_camera_button = ["Civilian Camera", interact_civilian_camera_menu];

	private["_satellite_camera_button"];
	_satellite_camera_button = ["Satellite Camera", police_menu_satellite_camera_handler];

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

	[toUpper("Police Vehicle Menu"), _buttons_data] call main_menu_setup;
};

police_field_menu_create = {
	private["_prison_button"];
	_prison_button = ["Prison Menu", interact_warrants_menu];

	private["_warrants_button"];
	_warrants_button = ["Warrants Menu", interact_warrants_menu];

	private["_markers_button"];
	_markers_button = ["Side Markers (on/off)", interact_toggle_side_markers];

	private["_crimes_button"];
	_crimes_button = ["Crime Log", main_menu_handle_crimes];

	private["_buttons_data"];

	_buttons_data = [
		_prison_button,
		_warrants_button,
		_markers_button,
		_crimes_button
		];

	[toUpper("Police Field Menu"), _buttons_data] call main_menu_setup;
};

police_menu_functions_defined = true;