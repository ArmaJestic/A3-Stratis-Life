// A_shop_menu_fnc_set_sell_items

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);
ARGV(1,_items);

if (undefined(_shop_id)) exitWith {null};
if (undefined(_items)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {null};

[_shop_cache, "sell_items", _items] call A_object_fnc_setVariable;
