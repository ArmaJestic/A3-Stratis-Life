// A_shop_menu_fnc_sort_list_by_distance

#include "header.h"


ARGV(0,_location);
ARGV(1,_unsorted_shop_list);

if (UNDEFINED(_unsorted_shop_list)) exitWith {null};
if (typeName _unsorted_shop_list != "ARRAY") exitWith {null};
if (UNDEFINED(_location)) exitWith {_unsorted_shop_list};
if (typeName _location != "ARRAY") exitWith {_unsorted_shop_list};
if ((count _location) != 3) exitWith {_unsorted_shop_list};

private["_list_to_sort", "_i", "_count"];
_list_to_sort = [];
_i = 0;
_count = count _unsorted_shop_list;
private["_shop_object", "_shop_id", "_distance", "_shop", "_element"];
while {_i < _count} do {
	_shop_id = _i;
	_shop = _unsorted_shop_list select _i;
	_shop_object = _shop select INV_INDEX_SHOP_OBJECT;
	_distance = _location distance _shop_object;
	_element = [];
	_element set[A_QSORT_INDEX_KEY, _distance];
	_element set[A_QSORT_INDEX_DATA, _shop_id];
	_list_to_sort set[_i, _element];
	_i = _i + 1;
};

_list_to_sort call A_quicksort_fnc_quicksort;
_list_to_sort