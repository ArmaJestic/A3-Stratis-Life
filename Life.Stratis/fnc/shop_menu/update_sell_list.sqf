// A_shop_menu_fnc_update_sell_list

#include "header.h"


disableSerialization;
lbClear sell_items_list_idc;
call A_shop_menu_fnc_reset_sell_labels;


params[["_shop_id",(call A_shop_menu_fnc_get_current_shop_id)]];

private _shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {};

private _hide_items = [_shop_id] call A_shop_menu_fnc_get_sell_cb;
private _items = [_shop_cache] call A_shop_menu_fnc_get_sell_items;
private _count = (count _items);
[_shop_id] call A_shop_menu_fnc_refresh_sell_cb;

{
	if (isNull(findDisplay shop_dialog_idd)) exitwith {};
	if ([([_shop_id] call A_shop_menu_fnc_get_sell_cb), _hide_items] call A_shop_menu_fnc_BNE) exitWith {};
	
	private _data = _x;
	private _valid = if (_hide_items) then {
		private["_out"]; _out = [_data, true] call A_shop_menu_fnc_sell_item_validate_data; (DEFINED(_out))
	}else{true};

	if (_valid) then {
		private _index = lbAdd [sell_items_list_idc, (_data select INDEX_SELL_LABEL)];
		lbSetData [sell_items_list_idc, _index, format["%1", _data]];
		lbSetPicture [sell_items_list_idc, _index, (_data select INDEX_SELL_ICON)];
	};
} forEach _items;