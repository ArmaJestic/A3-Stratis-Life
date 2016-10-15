// A_shop_menu_fnc_get_sell_item_data

#include "header.h"


private["_index", "_data", "_data_str"];
_index = lbCurSel sell_items_list_idc;
_index = if (UNDEFINED(_index)) then { -1 } else { _index };
if (_index < 0) exitWith {null};
_data_str =  lbData[sell_items_list_idc, _index];
_data = (call compile _data_str);
_data
