// A_shop_menu_fnc_update_sell_list

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


disableSerialization;
private [ "_items",  "_dialog", "_shop_id", "_shop_cache", "_items", "_count", "_i", "_hide_items"];

lbClear sell_items_list_idc;
call A_shop_menu_fnc_reset_sell_labels;

_this = if (undefined(_this)) then { [] } else { _this };
_shop_id = if (count _this > 0) then { _this select 0 } else { call A_shop_menu_fnc_get_current_shop_id };

_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {null};

_hide_items = [_shop_id] call A_shop_menu_fnc_get_sell_cb;

_items = [_shop_cache] call A_shop_menu_fnc_get_sell_items;


_count = (count _items);
[_shop_id] call A_shop_menu_fnc_refresh_sell_cb;

_i = 0;
while { _i < _count && not(isNull(findDisplay shop_dialog_idd))} do {
	private["_index", "_data", "_valid"];
	//exit early if the state of the checkbox changes
	if ([([_shop_id] call A_shop_menu_fnc_get_sell_cb), _hide_items] call A_shop_menu_fnc_BNE ) exitWith {null};
	_data = _items select _i;
	_valid = if (_hide_items) then { private["_out"]; _out = [_data, true] call A_shop_menu_fnc_sell_item_validate_data; not(undefined(_out)) } else { true };

	if (_valid) then {
		_index = lbAdd [sell_items_list_idc, (_data select A_shop_menu_var_sell_item_label)];
		lbSetData [sell_items_list_idc, _index, format["%1", _data]];
		 lbSetPicture [sell_items_list_idc, _index, (_data select A_shop_menu_var_sell_item_icon)];
	};
	_i = _i + 1;
};
