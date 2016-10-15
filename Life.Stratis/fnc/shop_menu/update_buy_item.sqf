// A_shop_menu_fnc_update_buy_item

#include "header.h"


private ["_data"];
_data = call A_shop_menu_fnc_get_buy_item_data;
_data = [_data] call A_shop_menu_fnc_buy_item_validate_data;
if (UNDEFINED(_data)) exitWith {null};
ctrlEnable [buy_button_idc, true];
buttonSetAction [buy_button_idc,  "call A_shop_menu_fnc_buy;"];
_data
