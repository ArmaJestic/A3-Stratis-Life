// A_shop_menu_fnc_build_buy_list

#include "header.h"


ARGV(0,_shop_id);
if (UNDEFINED(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private ["_item_buy_list", "_shop", "_crate", "_logic"];
_shop = (A_inv_var_itemshops select _shop_id);
_item_buy_list   = ( _shop select INV_INDEX_SHOP_BUYLIST);
_shop_needs_license =  (_shop select INV_INDEX_SHOP_LICENSE);
_crate = (_shop select INV_INDEX_SHOP_CRATE);
_crate = if (UNDEFINED(_crate) ) then { "" } else { _crate };
_logic = (_shop select INV_INDEX_SHOP_LOGIC);
_logic = if (UNDEFINED(_logic) ) then { "" } else { _logic };


private["_i", "_shop_buy_list", "_count"];
_shop_buy_list = [];
_count = count _item_buy_list;
_i = 0;
while { _i < _count } do {
	private ["_data", "_item", "_infos", "_price", "_name", "_isItem", "_weight_str", "_label", 
			"_license_1", "_license_2", "_icon", "_class", "_type", "_kind", "_icon"];
	_item = _item_buy_list select _i;
	_infos = _item call A_inventory_fnc_get_item_array;
	_price = _infos call A_inventory_fnc_get_item_buy_cost;
	_name  = (MASTER_ARRAY_ITEM_NAME(_infos));
	_isItem = ((_infos call A_inventory_fnc_get_item_type) == "Item");
	_license_1 = _infos call A_inventory_fnc_get_license_1;
	_license_2 = _infos call A_inventory_fnc_get_license_2;
	_class = if(!(_isItem)) then { _infos call A_inventory_fnc_get_item_class } else {""};
	_type = _infos call A_inventory_fnc_get_item_type;
	_kind = _infos call A_inventory_fnc_get_item_kind;
	_kind = if (UNDEFINED(_kind)) then { "" } else { _kind };
	_icon = [_item, _class, _type] call A_object_fnc_icon;
	//player groupChat format["_icon = %1", _icon];
	
 
	_weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)]} else {""};
	_label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
	
	_data = [];
	_data set [INDEX_BUY_KEY, _item];
	_data set [INDEX_BUY_PRICE, [_price] call A_encoding_fnc_encode_number];
	_data set [INDEX_BUY_INDEX, _i];
	_data set [INDEX_BUY_LABEL, _label];
	_data set [INDEX_BUY_SHOP_ID, _shop_id];
	_data set [INDEX_BUY_NAME, _name];
	_data set [INDEX_BUY_LICENSE_1, _license_1];
	_data set [INDEX_BUY_LICENSE_2, _license_2];
	_data set [INDEX_BUY_NEEDS_LICENSE, _shop_needs_license];
	_data set [INDEX_BUY_CRATE_NETID, (netId _crate)];
	_data set [INDEX_BUY_LOGIC_NETID, (netId _logic)];
	_data set [INDEX_BUY_CLASS, _class];
	_data set [INDEX_BUY_TYPE, _type];
	_data set [INDEX_BUY_KIND, _kind];
	_data set [INDEX_BUY_ICON, _icon];
	_shop_buy_list set [_i, _data];
	_i = _i + 1;
};

[_shop_id, _shop_buy_list] call A_shop_menu_fnc_set_buy_items;
