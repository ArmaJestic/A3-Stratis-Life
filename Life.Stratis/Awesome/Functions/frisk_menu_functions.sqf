#include "constants.h"
#include "macro.h"

if (not(undefined(frisk_menu_functions_defined))) exitWith {};




frisk_show_weapons = {
	ARGV(0,_title);
	ARGV(1,_player);
	ARGV(2,_this);
	
	ARGV(0,_target);
	
	if (undefined(_target)) exitWith {};
	
	
	private["_title", "_list"];
	_title = format["%1's Weapons", (name _player)];
	_list = [_title, 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	
	lbClear (ctrlIDC _list);
	
	private["_i","_licenses"];
	_weapons = weapons _target;
	_i = 0;
	while {_i < (count _weapons)} do {
		private["_object", "_script_name", "_object_name"];
		_object = _weapons select _i;
		_script_name = _object call inventory_get_script_from_class_weap;
		_object_name = (MASTER_ARRAY_ITEM_NAME(_script_name));
		_list lbAdd format ["%1", _object_name];
		_i = _i + 1;
	};
};

frisk_show_licenses = {
	ARGV(0,_title);
	ARGV(1,_player);
	ARGV(2,_this);
	
	ARGV(0,_target);
	
	if (undefined(_target)) exitWith {};
	
	private["_title", "_list"];
	_title = format["%1's Licenses", (name _player)];
	_list = [_title, 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	
	lbClear (ctrlIDC _list);
	
	private["_i","_licenses"];
	_licenses = [_target, "INV_LicenseOwner"] call player_get_array;
	_i = 0;
	while {_i < (count _licenses)} do {
		private["_license"];
		_license = (_licenses select _i);
		_list lbAdd format ["%1", (_license call inventory_get_license_name)];
		_i = _i + 1;
	};
};


frisk_show_magazines = {
	ARGV(0,_title);
	ARGV(1,_player);
	ARGV(2,_this);
	
	ARGV(0,_target);
	
	if (undefined(_target)) exitWith {};
	
		
	private["_title", "_list"];
	_title = format["%1's Magazines", (name _player)];
	_list = [_title, 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	
	lbClear (ctrlIDC _list);
	
	private["_i","_magazines"];
	_magazines = magazines _target;
	_i = 0;
	while {_i < (count _magazines)} do {
		private["_object", "_script_name", "_object_name"];
		_object = _magazines select _i;
		_script_name = _object call inventory_get_script_from_class_mag;
		_object_name = (MASTER_ARRAY_ITEM_NAME(_script_name));
		_list lbAdd format ["%1", _object_name];
		_i = _i + 1;
	};

	
};

frisk_show_inventory = {
	ARGV(0,_title);
	ARGV(1,_player);
	ARGV(2,_this);
	
	ARGV(0,_target);
	
	if (undefined(_target)) exitWith {};
	
	private["_title", "_list"];
	_title = format["%1's Inventory", (name _player)];
	_list = [_title, 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	
	lbClear (ctrlIDC _list);
	
	private["_i","_inventory"];
	_inventory = [_target] call player_get_inventory;
	_i = 0;
	while {_i < (count _inventory)} do {
		private["_object", "_object_name", "_amount"];
		_object = ((_inventory select _i) select 0);
		_object_name = (MASTER_ARRAY_ITEM_NAME(_object));
		_amount = [((_inventory select _i) select 1)] call decode_number;
		if (_amount > 0) then {
			if (_object == "money") then {
				_list lbAdd format ["%1: $%2", _object_name, strM(_amount)];
			 }
			 else {
				_list lbAdd format ["%1: %2", _object_name, _amount];
			 };
		};
		_i = _i + 1;
	};
	
};

frisk_menu_functions_defined = true;