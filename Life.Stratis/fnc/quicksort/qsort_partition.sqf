// A_quicksort_fnc_qsort_partition

#include "header.h"


params["_array","_left","_right","_pivot"];

private _pivot_value = (_array select _pivot) select A_QSORT_INDEX_KEY;

[_array, _pivot, _right] call A_quicksort_fnc_qsort_swap;


private _store_index = _left;
private _i = _left;
while { _i <= (_right - 1) } do {
	if (((_array select _i) select A_QSORT_INDEX_KEY) < _pivot_value) then {
		[_array, _i, _store_index] call A_quicksort_fnc_qsort_swap;
		_store_index = _store_index + 1;
	};
	_i = _i + 1;
};

[_array, _store_index, _right] call A_quicksort_fnc_qsort_swap;
_store_index