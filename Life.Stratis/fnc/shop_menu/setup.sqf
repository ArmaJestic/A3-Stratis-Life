// A_shop_menu_fnc_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_unsorted_shops);

private[ "_i", "_count", "_sorted_item_shops"];
_sorted_item_shops = [(getPos player), _unsorted_shops] call A_shop_menu_fnc_sort_list_by_distance;
_count = count _sorted_item_shops;

//initialize and close all the shops
_i = 0;
while { _i < _count } do {
	private["_element", "_shop", "_shop_object"];
	_element = _sorted_item_shops select _i;
	_shop_id = _element select A_quicksort_v_sort_data;
	_shop_object = (_unsorted_shops select _shop_id) select A_inv_var_itemshops_object;
	
	[_shop_id, _shop_object] call A_shop_menu_fnc_init;
	[_shop_id] call A_shop_menu_fnc_close;
	_i = _i + 1;
};


_i = 0;
_count = count _sorted_item_shops;
//build the list for each shop, and open them
while { _i < _count } do {
	private["_element", "_shop", "_shop_object"];
	_element = _sorted_item_shops select _i;
	_shop_id = _element select A_quicksort_v_sort_data;
	_shop_object = (_unsorted_shops select _shop_id) select A_inv_var_itemshops_object;
	
	[_shop_id] call A_shop_menu_fnc_build_buy_list;
	[_shop_id] call A_shop_menu_fnc_build_sell_list;
	[_shop_id] call A_shop_menu_fnc_open;
	
	_i = _i + 1;
	A_shop_menu_var_setup_progress = floor((_i/_count)*100);
};
