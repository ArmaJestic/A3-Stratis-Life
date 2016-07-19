// A_shop_menu_fnc_update_buy_list

#include "../../includes/constants.h"
#include "../../includes/macro.h"


disableSerialization;
private [ "_items",  "_dialog", "_shop_id", "_shop_cache", "_items", "_count", "_i"];

lbClear buy_items_list_idc;
call A_shop_menu_fnc_reset_buy_labels;

_this = if (undefined(_this)) then { [] } else { _this };
_shop_id = if (count _this > 0) then { _this select 0 } else { call A_shop_menu_fnc_get_current_shop_id };

_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {null};

_items = [_shop_cache] call A_shop_menu_fnc_get_buy_items;

_i = 0;
_count = (count _items);
while { _i < _count } do {
	private["_index", "_data"];
	_data = _items select _i;
	_index = lbAdd [buy_items_list_idc, (_data select A_shop_menu_var_buy_item_label)];
	lbSetData [buy_items_list_idc, _index, format["%1", _data]];
	lbSetPicture [buy_items_list_idc, _index, (_data select A_shop_menu_var_buy_item_icon)];
	//lbSetPicture [buy_items_list_idc, _index, "img\icons\zipties.paa"];
	  
	_i = _i + 1;
};

[_shop_id] call A_shop_menu_fnc_refresh_put_gear_cb;
