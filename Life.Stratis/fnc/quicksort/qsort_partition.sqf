// A_quicksort_fnc_qsort_partition
#include "..\..\includes\macro.h"

ARGV(0,_array);
ARGV(1,_left);
ARGV(2,_right);
ARGV(3,_pivot);

private["_pivot_value"];
_pivot_value = (_array select _pivot) select A_quicksort_v_sort_key;

[_array, _pivot, _right] call A_quicksort_fnc_qsort_swap;

private["_i", "_store_index"];
_store_index = _left;
_i = _left;
while { _i <= (_right - 1) } do {
	if (((_array select _i) select A_quicksort_v_sort_key) < _pivot_value) then {
		[_array, _i, _store_index] call A_quicksort_fnc_qsort_swap;
		_store_index = _store_index + 1;
	};
	_i = _i + 1;
};

[_array, _store_index, _right] call A_quicksort_fnc_qsort_swap;
_store_index
