// A_shop_menu_fnc_buy_fort

#include "header.h"


_this spawn {
	ARGV(0,_data);

	if (UNDEFINED(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	private ["_kind", "_total_due", "_item_name", "_class", "_logic", "_sleep_time"];
	_item_name = _data select INDEX_BUY_NAME;
	_logic = objectFromNetId(_data select INDEX_BUY_LOGIC_NETID);
	_total_due = [(_data select INDEX_BUY_TOTAL_DUE)] call A_encoding_fnc_decode_number;
	_kind = _data select INDEX_BUY_KIND;
	_class = _data select INDEX_BUY_CLASS;
	_sleep_time = 5;
	
	player groupChat format ["You bought a %1 for $%2. Please wait %3 seconds until the vehicle spawns.", _item_name, strM(_total_due), _sleep_time];
	[_sleep_time] call A_shop_menu_fnc_set_busy;
	sleep _sleep_time;
	[_logic, _class, _kind] spawn A_inv_fnc_createfort;
};
