// A_shop_menu_fnc_make_key

#include "header.h"


ARGV(0,_shop_id);
if (UNDEFINED(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};
_shop_key = format["shop_id_%1", _shop_id];	
_shop_key
