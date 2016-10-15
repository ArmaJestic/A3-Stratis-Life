// A_shop_menu_fnc_set_sell_items

#include "header.h"


ARGV(0,_shop_id);
ARGV(1,_items);

if (UNDEFINED(_shop_id)) exitWith {null};
if (UNDEFINED(_items)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {null};

[_shop_cache, "sell_items", _items] call A_object_fnc_setVariable;
