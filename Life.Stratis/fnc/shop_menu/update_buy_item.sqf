// A_shop_menu_fnc_update_buy_item

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private ["_data"];
_data = call A_shop_menu_fnc_get_buy_item_data;
_data = [_data] call A_shop_menu_fnc_buy_item_validate_data;
if (undefined(_data)) exitWith {null};
ctrlEnable [buy_button_idc, true];
buttonSetAction [buy_button_idc,  "call A_shop_menu_fnc_buy;"];
_data
