// A_tree_fnc_sort_by_distance

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_location);
ARGV(1,_unsorted_tree_list);

if (undefined(_unsorted_tree_list)) exitWith {};
if (typeName _unsorted_tree_list != "ARRAY") exitWith {};
if (undefined(_location)) exitWith {_unsorted_tree_list};
if (typeName _location != "ARRAY") exitWith {_unsorted_tree_list};
if ((count _location) != 3) exitWith {_unsorted_tree_list};

private["_list_to_sort", "_i", "_count"];
_list_to_sort = [];
_i = 0;
_count = count _unsorted_tree_list;
while {_i < _count} do {
	private["_tree_id", "_distance", "_object"];
	_tree_id = _unsorted_tree_list select _i;
	_object = objectFromNetId _tree_id;
	_distance = _location distance _object;
	_element = [];
	_element set [A_quicksort_var_sort_key, _distance];
	_element set [A_quicksort_var_sort_data, _object];
	_list_to_sort set[_i, _element];
	_i = _i + 1;
};

_list_to_sort call A_quicksort_fnc_quicksort;
_list_to_sort
