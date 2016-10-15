// A_shop_menu_fnc_set_drug_list

#include "header.h"


ARGV(0,_shop_id);
ARGV(1,_list);

private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {null};
if (UNDEFINED(_list)) exitWith {[]};
if (typeName _list != "ARRAY") exitWith {[]};

[_shop_cache, "drugList", _list, true] call A_object_fnc_setVariable; 
_list
