// A_shop_menu_fnc_get_buy_item_data

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private["_index", "_data", "_data_str"];
_index = lbCurSel buy_items_list_idc;
_index = if (undefined(_index)) then { -1 } else { _index };
if (_index < 0) exitWith {null};
_data_str =  lbData[buy_items_list_idc, _index];
_data = (call compile _data_str);
_data
