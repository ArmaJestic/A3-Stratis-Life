// A_frisk_menu_fnc_show_weapons

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_title);
ARGV(1,_player);
ARGV(2,_this);

ARGV(0,_target);

if (undefined(_target)) exitWith {};


private["_title", "_list"];
_title = format["%1's Weapons", (name _player)];
_list = [_title, 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;

lbClear (ctrlIDC _list);

private["_i","_licenses"];
_weapons = weapons _target;
_i = 0;
while {_i < (count _weapons)} do {
	private["_object", "_script_name", "_object_name"];
	_object = _weapons select _i;
	_script_name = _object call A_inventory_fnc_get_script_from_class_weap;
	_object_name = (MASTER_ARRAY_ITEM_NAME(_script_name));
	_list lbAdd format ["%1", _object_name];
	_i = _i + 1;
};
