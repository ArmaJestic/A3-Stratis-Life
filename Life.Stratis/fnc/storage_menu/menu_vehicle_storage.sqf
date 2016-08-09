// A_storage_menu_fnc_menu_vehicle_storage

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_vehicle);

if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

private["_left_title", "_right_title"];
_left_title = "Vehicle Trunk Storage";
_right_title = "Inventory Storage";

private["_vehicle_storage_name", "_player_storage_name"];
_vehicle_storage_name = ([_vehicle] call A_player_fnc_object_storage_name);
_player_storage_name = ([_player] call A_player_fnc_object_storage_name);

private["_left_button_code", "_right_button_code", 
		"_left_label_code", "_right_label_code", 
		"_left_list_code", "_right_list_code", 
		"_right_selection_code", "_left_selection_code"];
		
_left_list_code = [_vehicle, _vehicle_storage_name] call A_storage_menu_fnc_menu_generate_list_code;
_right_list_code = [_player, _player_storage_name] call A_storage_menu_fnc_menu_generate_list_code;

_left_selection_code = ["Take"] call A_storage_menu_fnc_menu_generate_selection_code;
_right_selection_code = ["Put"] call A_storage_menu_fnc_menu_generate_selection_code;

_left_button_code = compile (
'ARGV(0,_item);' +
'ARGV(1,_count);' +
"if (_count <= 0) exitWith {null};" +
format['[%1, _item, -(_count)] call A_interaction_fnc_vehicle_storage;', _vehicle]);

_right_button_code = compile (
'ARGV(0,_item);' +
'ARGV(1,_count);' +
"if (_count <= 0) exitWith {null};" +
format['[%1, _item, _count] call A_interaction_fnc_vehicle_storage;', _vehicle]);

_left_label_code = compile (format['
	private["_class", "_vehicle", "_max_weight", "_weight"];
	_vehicle = %1;
	_storage = "%2";
	_class = typeOf _vehicle;
	_weight = [_vehicle, _storage] call A_inventory_fnc_get_storage_weight;
	_max_weight = _class call A_inventory_fnc_get_vehicle_max_kg;
	(strM(_weight) + "/" + strM(_max_weight))
', _vehicle, _vehicle_storage_name]);

_right_label_code = compile (format['
	private["_class", "_player", "_max_weight", "_weight"];
	_player = %1;
	_storage = "%2";
	_weight = [_player, _storage] call A_inventory_fnc_get_storage_weight;
	_max_weight = A_inventory_var_INV_CarryingCapacity;
	(strM(_weight) + "/" + strM(_max_weight))
', _player, _player_storage_name]);

[
	_left_title, _left_button_code, _left_selection_code, _left_list_code, _left_label_code,
	_right_title, _right_button_code, _right_selection_code, _right_list_code, _right_label_code
] call A_storage_menu_fnc_generic_storage_menu;
