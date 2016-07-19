// A_quicksort_fnc_swap
#include "../../includes/macro.h"

ARGV(0,_array);
ARGV(1,_left);
ARGV(2,_right);

private["_temp"];
_temp = _array select _left;
_array set [_left, (_array select _right)];
_array set [_right, _temp];
