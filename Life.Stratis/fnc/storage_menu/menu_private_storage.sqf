// A_storage_menu_fnc_menu_private_storage

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private["_private_storage_name", "_player_storage_name"];
_private_storage_name = "private_storage";
_player_storage_name = ([_player] call A_player_fnc_object_storage_name);

private["_left_button_code", "_right_button_code", 
		"_left_label_code", "_right_label_code", 
		"_left_list_code", "_right_list_code", 
		"_right_selection_code", "_left_selection_code"];
		

private["_left_title", "_right_title"];
_left_title = "Private Storage";
_right_title = "Inventory Storage";

_left_list_code = [_player, _private_storage_name] call A_storage_menu_fnc_menu_generate_list_code;
_right_list_code = [_player, _player_storage_name] call A_storage_menu_fnc_menu_generate_list_code;

_left_selection_code = ["Take"] call A_storage_menu_fnc_menu_generate_selection_code;
_right_selection_code = ["Put"] call A_storage_menu_fnc_menu_generate_selection_code;

_left_button_code = compile (
'	ARGV(0,_item);' +
'	ARGV(1,_count);' +
'	if (_count <= 0) exitWith {null};'+
'	[' + str(_player) + ', ' + str(_private_storage_name) + ', _item, -(_count)] call A_interaction_fnc_generic_storage;' 
);

_right_button_code = compile (
'	player groupChat format["%1", _this];' +
'	ARGV(0,_item);' +
'	ARGV(1,_count);' +
'	if (_count <= 0) exitWith {null};' +
'	[' + str(_player) + ', ' + str(_private_storage_name) + ', _item, _count] call A_interaction_fnc_generic_storage;'
);


_left_label_code = compile (
'	private["_class", "_player", "_max_weight", "_weight"];' +
'	_player = ' + str(_player) + ';' +
'	_storage = ' + str(_private_storage_name) + ';' +
'	_weight = [_player, _storage] call A_inventory_fnc_get_storage_weight;' +
'	("" + strM(_weight) + "/Unlimited" )'
);

_right_label_code = compile (
'	private["_class", "_player", "_max_weight", "_weight"];' +
'	_player = ' + str(_player) + ';' +
'	_storage = ' + str(_player_storage_name) + ';' +
'	_weight = [_player, _storage] call A_inventory_fnc_get_storage_weight;' +
'	_max_weight = A_inventory_var_INV_CarryingCapacity;' +
'	("" + strM(_weight) + "/" + strM(_max_weight))'
);

[
	_left_title, _left_button_code, _left_selection_code, _left_list_code, _left_label_code,
	_right_title, _right_button_code, _right_selection_code, _right_list_code, _right_label_code
] call A_storage_menu_fnc_generic_storage_menu;
