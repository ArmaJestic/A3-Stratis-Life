// A_shop_menu_fnc_setup

#include "header.h"


params["_unsorted_shops"];

private _sorted_item_shops = [(getPosATL player), _unsorted_shops] call A_shop_menu_fnc_sort_list_by_distance;

//initialize and close all the shops
{
	private _element = _x;
	private _shop_id = _element select A_QSORT_INDEX_DATA;
	private _shop_object = (_unsorted_shops select _shop_id) select INV_INDEX_SHOP_OBJECT;
	
	[_shop_id, _shop_object] call A_shop_menu_fnc_init_shop;
	[_shop_id] call A_shop_menu_fnc_close;
} forEach _sorted_item_shops;

{
	private _element = _x;
	private _shop_id = _element select A_QSORT_INDEX_DATA;
	private _shop_object = (_unsorted_shops select _shop_id) select INV_INDEX_SHOP_OBJECT;
	
	[_shop_id] call A_shop_menu_fnc_build_buy_list;
	[_shop_id] call A_shop_menu_fnc_build_sell_list;
	[_shop_id] call A_shop_menu_fnc_open;
} forEach _sorted_item_shops;