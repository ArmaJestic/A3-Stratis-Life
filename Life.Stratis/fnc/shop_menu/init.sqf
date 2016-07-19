// A_shop_menu_fnc_init

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);
ARGV(1,_shop_cache);

if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};
if (undefined(_shop_cache)) exitWith {null};


[_shop_cache, "open", false] call A_object_fnc_setVariable;
[_shop_cache, "buy_items", []] call A_object_fnc_setVariable;
[_shop_cache, "sell_items", []] call A_object_fnc_setVariable;
[_shop_cache, "id", _shop_id] call A_object_fnc_setVariable;
[_shop_cache, "put_gear", false] call A_object_fnc_setVariable;
[_shop_cache, "hide_sell_items", true] call A_object_fnc_setVariable;
_shop_key = ([_shop_id] call A_shop_menu_fnc_make_key);
server setVariable [_shop_key, _shop_cache];
