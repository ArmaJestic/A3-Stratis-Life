// A_storage_menu_fnc_menu_factory_storage

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_storage_menu_fnc_menu_factory_storage %1", _this];
ARGV(0,_player);
ARGV(1,_factory_storage_name);
if (not([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_factory_storage_name)) exitWith {null};
if (typeName _factory_storage_name != "STRING") exitWith {null};

private["_factory"];
_factory = [_factory_storage_name] call A_factory_fnc_lookup_storage;

if(undefined(_factory)) exitWith{null};

private["_factory_name"];
_factory_name = _factory select factory_name;

private["_left_title", "_right_title"];
_left_title =  format["%1 Storage", _factory_name];
_right_title = "Inventory Storage";

private["_player_storage_name"];
_player_storage_name = ([_player] call A_player_fnc_object_storage_name);

private["_left_button_code", "_right_button_code", 
		"_left_label_code", "_right_label_code", 
		"_left_list_code", "_right_list_code", 
		"_right_selection_code", "_left_selection_code"];
		
_left_list_code = [_player, _factory_storage_name] call A_storage_menu_fnc_menu_generate_list_code;
_right_list_code = [_player, _player_storage_name] call A_storage_menu_fnc_menu_generate_list_code;

_left_selection_code = ["Take"] call A_storage_menu_fnc_menu_generate_selection_code;
_right_selection_code = ["Put"] call A_storage_menu_fnc_menu_generate_selection_code;

_left_button_code = compile (
'ARGV(0,_item);' +
'ARGV(1,_count);' +
"if (_count <= 0) exitWith {null}; " +
format['[%1, "%2", _item, -(_count)] call A_interaction_fnc_factory_storage; ', _player, _factory_storage_name]);

_right_button_code = compile (
'ARGV(0,_item);' +
'ARGV(1,_count);' +
"if (_count <= 0) exitWith {null}; "+
format['[%1, "%2", _item, _count] call A_interaction_fnc_factory_storage;', _player, _factory_storage_name]);

_left_label_code = compile (format['
	private["_class", "_player", "_max_weight", "_weight"];
	_player = %1;
	_storage = "%2";
	_weight = [_player, _storage] call A_inventory_fnc_get_storage_weight;
	(strM(_weight) + "/Unlimited" )
', _player, _factory_storage_name]);

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
