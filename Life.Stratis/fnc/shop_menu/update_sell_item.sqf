// A_shop_menu_fnc_update_sell_item

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private ["_data"];
_data = call A_shop_menu_fnc_get_sell_item_data;
_data = [_data] call A_shop_menu_fnc_sell_item_validate_data;
if (undefined(_data)) exitWith {null};
ctrlEnable [sell_button_idc, true];
buttonSetAction [sell_button_idc,  "call A_shop_menu_fnc_sell;"];
_data