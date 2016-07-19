// A_shop_menu_fnc_buy_fort

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


_this spawn {
	ARGV(0,_data);

	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	private ["_kind", "_total_due", "_item_name", "_class", "_logic", "_sleep_time"];
	_item_name = _data select A_shop_menu_var_buy_item_name;
	_logic = objectFromNetId(_data select A_shop_menu_var_buy_item_logic_netid);
	_total_due = [(_data select A_shop_menu_var_buy_item_total_due)] call A_encoding_fnc_decode_number;
	_kind = _data select A_shop_menu_var_buy_item_kind;
	_class = _data select A_shop_menu_var_buy_item_class;
	_sleep_time = 5;
	
	player groupChat format ["You bought a %1 for $%2. Please wait %3 seconds until the vehicle spawns.", _item_name, strM(_total_due), _sleep_time];
	[_sleep_time] call A_shop_menu_fnc_set_busy;
	sleep _sleep_time;
	[_logic, _class, _kind] spawn INV_CreateFort;
};
