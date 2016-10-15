// A_quicksort_fnc_swap

#include "header.h"


params["_array","_left","_right"];

private _temp = _array select _left;
_array set[_left, (_array select _right)];
_array set[_right, _temp];