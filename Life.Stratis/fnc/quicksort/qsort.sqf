// A_quicksort_fnc_qsort
#include "../../includes/macro.h"

ARGV(0,_array);
ARGV(1,_left);
ARGV(2,_right);

if (not(_left < _right)) exitWith { _array };
		
private["_pivot"];			
_pivot = floor((_left + _right)/2);
_pivot = ([_array, _left, _right, _pivot] call A_quicksort_fnc_qsort_partition);

[_array, _left, (_pivot - 1)] call A_quicksort_fnc_qsort;
[_array, (_pivot + 1), _right] call A_quicksort_fnc_qsort;
