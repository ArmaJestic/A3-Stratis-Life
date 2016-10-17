// A_arr_fnc_exists
// return if given item exists in array
#include "header.h"


params[["_arr",null,[[]]],["_item",null,[]]];
if UNDEFINED(_arr) exitwith {false};
if UNDEFINED(_item) exitwith {false};


private _count = {_x isEqualTo _item} count _arr;

(_count > 0)