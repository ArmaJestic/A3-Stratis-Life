// A_shop_menu_fnc_open_dialog

#include "header.h"



disableSerialization;
ARGV(0,_shop_id);
if (UNDEFINED(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

if (!([_shop_id] call A_shop_menu_fnc_is_open)) exitWith {
	player groupChat "This shop is not open";
};

if (!(createDialog "shops_menu")) exitWith {
	player groupChat format["ERROR: Could not create shops menu dialog"];
};

[_shop_id] call A_shop_menu_fnc_set_current_shop_id;
[_shop_id] spawn A_shop_menu_fnc_update_buy_list;
[_shop_id] spawn A_shop_menu_fnc_update_sell_list;

[] call A_shop_menu_fnc_menu_setup;