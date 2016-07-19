// A_camera_menu_fnc_create

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_player);
ARGV(1,_objects);

if (not([_player] call A_player_fnc_exists)) exitWith {null};

if (not(createDialog "camera_menu")) exitWith {
	player groupChat format["ERROR: cannot create camera menu dialog"];
};

//populate the object list
{
	private["_object", "_object_netid"];
	_object = _x;
	_object_netid = netId _object;
	
	private["_index"];
	_index = lbAdd[camera_menu_object_field_idc, format["%1", _object]];
	lbSetData [camera_menu_object_field_idc, _index, _object_netid];
} forEach _objects;

lbSetCurSel [camera_menu_object_field_idc, 0];



//populate the list of commands
private["_actions"];
_actions = call A_camera_menu_fnc_camera_actions_list;

{
	private["_text", "_code", "_index"];
	_text = _x select 0;
	_code = _x select 1;
	_index = lbAdd [camera_menu_command_field_idc, _text];
	lbSetData [camera_menu_command_field_idc, _index, str(_code)];
} forEach _actions;

lbSetCurSel [camera_menu_command_field_idc, 0];
buttonSetAction [camera_menu_execute_button_idc, 
	('[' + str(_player) + ', ' +
	'(call A_camera_menu_fnc_action), ' +
	'(call A_camera_menu_fnc_input_text), ' +
	'(call A_camera_menu_fnc_selected_object)] call A_camera_menu_fnc_camera_activate_command;')];
[] call A_camera_menu_fnc_setup;
