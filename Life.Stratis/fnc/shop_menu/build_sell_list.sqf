// A_shop_menu_fnc_build_sell_list

#include "header.h"


params[["_shop_id",null,[0]]];
if UNDEFINED(_shop_id) exitWith {null};

private _shop = (A_inv_var_itemshops select _shop_id);
private _logic = (_shop select INV_INDEX_SHOP_LOGIC);
private _logic = [_logic,""] select UNDEFINED(_logic);
private _item_sell_list = (_shop select INV_INDEX_SHOP_SELLLIST);
private _shop_sell_list = [];

{
	private _item = _x;
	private _infos = _item call A_inventory_fnc_get_item_array;
	private _price = _infos call A_inventory_fnc_get_item_sell_cost;
	private _name =  (MASTER_ARRAY_ITEM_NAME(_infos));

	private _isItem = (_infos call A_inventory_fnc_get_item_type == "Item");
	private _isDroppable = if (_isItem) then {(_item call A_inventory_fnc_get_item_droppable)} else { false };
	private _class = if(!(_isItem)) then { _infos call A_inventory_fnc_get_item_class } else { "" };
	private _type = _infos call A_inventory_fnc_get_item_type;
	private _kind = _infos call A_inventory_fnc_get_item_kind;
	private _kind = if (UNDEFINED(_kind)) then { "" } else { _kind };
	private _icon = [_item, _class, _type] call A_object_fnc_icon;
	
	private _weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)] } else { "" };
	private _label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
	
	private _data = [];
	_data set[INDEX_SELL_KEY, _item];
	_data set[INDEX_SELL_PRICE, ([_price] call A_encoding_fnc_encode_number)];
	_data set[INDEX_SELL_INDEX, _forEachIndex];
	_data set[INDEX_SELL_LABEL, _label];
	_data set[INDEX_SELL_SHOP_ID, _shop_id];
	_data set[INDEX_SELL_NAME, _name];
	_data set[INDEX_SELL_LOGIC_NETID, (netId _logic)];
	_data set[INDEX_SELL_CLASS, _class];
	_data set[INDEX_SELL_TYPE, _type];
	_data set[INDEX_SELL_KIND, _kind];
	_data set[INDEX_SELL_ICON, _icon];
	
	_shop_sell_list pushBack _data;
} forEach _item_sell_list;

[_shop_id, _shop_sell_list] call A_shop_menu_fnc_set_sell_items;