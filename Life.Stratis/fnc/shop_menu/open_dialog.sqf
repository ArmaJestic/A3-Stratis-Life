// A_shop_menu_fnc_open_dialog

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"



disableSerialization;
ARGV(0,_shop_id);
if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

if (!([_shop_id] call A_shop_menu_fnc_is_open)) exitWith {
	player groupChat format["This shop is not open yet. All shops are now %1%2 open", A_shop_menu_var_setup_progress, "%"];
};

if (!(createDialog "shops_menu")) exitWith {
	player groupChat format["ERROR: Could not create shops menu dialog"];
};

[_shop_id] call A_shop_menu_fnc_set_current_shop_id;
[_shop_id] spawn A_shop_menu_fnc_update_buy_list;
[_shop_id] spawn A_shop_menu_fnc_update_sell_list;

[] call A_shop_menu_fnc_menu_setup;
