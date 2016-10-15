// A_quicksort_fnc_qsort

#include "header.h"


params["_array","_left","_right"];

if (!(_left < _right)) exitWith { _array };
		
private _pivot = floor((_left + _right)/2);
_pivot = ([_array, _left, _right, _pivot] call A_quicksort_fnc_qsort_partition);

[_array, _left, (_pivot - 1)] call A_quicksort_fnc_qsort;
[_array, (_pivot + 1), _right] call A_quicksort_fnc_qsort;