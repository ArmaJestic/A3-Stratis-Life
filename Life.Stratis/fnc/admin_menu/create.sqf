// A_admin_menu_fnc_create

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_player);

if (not([_player] call A_player_fnc_exists)) exitWith {null};

if (not(createDialog "admin_menu")) exitWith {
	player groupChat format["ERROR: cannot create admin menu dialog"];
};

//populate the list of player
{
	private["_variable_name", "_variable_value"];
	_variable_name = _x;
	_variable_value = missionNamespace getVariable [_variable_name, null];
	
	if ([_variable_value] call A_player_fnc_exists) then {
		player groupChat format["_variable_value = %1", _variable_value];
		private["_index"];
		_index = lbAdd[admin_menu_player_field_idc, format["%1 - (%2)", _variable_value, (name _variable_value)]];
		lbSetData [admin_menu_player_field_idc, _index, _variable_value];
	};
} forEach playerstringarray;

lbSetCurSel [admin_menu_player_field_idc, 0];


//populate the list of commands
private["_actions"];
_actions = call A_admin_menu_fnc_admin_actions_list;

{
	private["_text", "_code", "_index"];
	_text = _x select 0;
	_code = _x select 1;
	_index = lbAdd [admin_menu_command_field_idc, _text];
	lbSetData [admin_menu_command_field_idc, _index, str(_code)];
} forEach _actions;

lbSetCurSel [admin_menu_command_field_idc, 0];


buttonSetAction [admin_menu_execute_button_idc,  
			"["+str(_player)+"," +
			"(call A_interaction_fnc_admin_menu_selected_action)," +
			"(call A_interaction_fnc_admin_menu_input_text)," +
			"(call A_interaction_fnc_admin_menu_selected_player)" +
			"] call A_admin_menu_fnc_admin_activate_command;"];
			
[] call A_admin_menu_fnc_setup;
