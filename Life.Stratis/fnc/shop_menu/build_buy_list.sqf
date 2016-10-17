// A_shop_menu_fnc_build_buy_list

#include "header.h"


params[["_shop_id",null,[0]]];
if UNDEFINED(_shop_id) exitWith {null};

private _shop = (A_inv_var_itemshops select _shop_id);
private _item_buy_list= ( _shop select INV_INDEX_SHOP_BUYLIST);
private _shop_needs_license =  (_shop select INV_INDEX_SHOP_LICENSE);
private _crate = (_shop select INV_INDEX_SHOP_CRATE);
_crate = [_crate,""] select UNDEFINED(_crate);
private _logic = (_shop select INV_INDEX_SHOP_LOGIC);
_logic = [_logic,""] select UNDEFINED(_logic);


private _shop_buy_list = [];
{
	private _item = _x;
	private _infos = _item call A_inventory_fnc_get_item_array;
	private _price = _infos call A_inventory_fnc_get_item_buy_cost;
	private _name = MASTER_ARRAY_ITEM_NAME(_infos);
	private _isItem = ((_infos call A_inventory_fnc_get_item_type) == "Item");
	private _license_1 = _infos call A_inventory_fnc_get_license_1;
	private _license_2 = _infos call A_inventory_fnc_get_license_2;
	private _class = if(!_isItem) then {_infos call A_inventory_fnc_get_item_class }else{""};
	private _type = _infos call A_inventory_fnc_get_item_type;
	private _kind = _infos call A_inventory_fnc_get_item_kind;
	private _kind = [_kind,""] select UNDEFINED(_kind);
	private _icon = [_item, _class, _type] call A_object_fnc_icon;
	
	private _weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)]} else {""};
	private _label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
	
	_data = [];
	_data set[INDEX_BUY_KEY, _item];
	_data set[INDEX_BUY_PRICE, [_price] call A_encoding_fnc_encode_number];
	_data set[INDEX_BUY_INDEX, _forEachIndex];
	_data set[INDEX_BUY_LABEL, _label];
	_data set[INDEX_BUY_SHOP_ID, _shop_id];
	_data set[INDEX_BUY_NAME, _name];
	_data set[INDEX_BUY_LICENSE_1, _license_1];
	_data set[INDEX_BUY_LICENSE_2, _license_2];
	_data set[INDEX_BUY_NEEDS_LICENSE, _shop_needs_license];
	_data set[INDEX_BUY_CRATE_NETID, (netId _crate)];
	_data set[INDEX_BUY_LOGIC_NETID, (netId _logic)];
	_data set[INDEX_BUY_CLASS, _class];
	_data set[INDEX_BUY_TYPE, _type];
	_data set[INDEX_BUY_KIND, _kind];
	_data set[INDEX_BUY_ICON, _icon];
	
	_shop_buy_list pushBack _data;
} forEach _item_buy_list;

[_shop_id, _shop_buy_list] call A_shop_menu_fnc_set_buy_items;
