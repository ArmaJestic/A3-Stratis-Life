// A_shop_menu_fnc_init_shop

#include "header.h"


params[["_shop_id",null,[0]],"_shop_cache"];

if (UNDEFINED(_shop_id)) exitWith {null};
if (UNDEFINED(_shop_cache)) exitWith {null};

[_shop_cache, "open", false] call A_object_fnc_setVariable;
[_shop_cache, "buy_items", []] call A_object_fnc_setVariable;
[_shop_cache, "sell_items", []] call A_object_fnc_setVariable;
[_shop_cache, "id", _shop_id] call A_object_fnc_setVariable;
[_shop_cache, "put_gear", false] call A_object_fnc_setVariable;
[_shop_cache, "hide_sell_items", true] call A_object_fnc_setVariable;

_shop_key = ([_shop_id] call A_shop_menu_fnc_make_key);
server setVariable[_shop_key, _shop_cache];