// A_frisk_menu_fnc_show_inventory

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_title);
ARGV(1,_player);
ARGV(2,_this);

ARGV(0,_target);

if (undefined(_target)) exitWith {};

private["_title", "_list"];
_title = format["%1's Inventory", (name _player)];
_list = [_title, 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;

lbClear (ctrlIDC _list);

private["_i","_inventory"];
_inventory = [_target] call A_player_fnc_get_inventory;
_i = 0;
while {_i < (count _inventory)} do {
	private["_object", "_object_name", "_amount"];
	_object = ((_inventory select _i) select 0);
	_object_name = (MASTER_ARRAY_ITEM_NAME(_object));
	_amount = [((_inventory select _i) select 1)] call A_encoding_fnc_decode_number;
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
