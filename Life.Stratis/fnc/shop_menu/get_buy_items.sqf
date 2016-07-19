// A_shop_menu_fnc_get_buy_items

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_shop_cache);
if (undefined(_shop_cache)) exitWith {null};

private ["_items"];
_items = [_shop_cache, "buy_items"] call A_object_fnc_getVariable;
_items
