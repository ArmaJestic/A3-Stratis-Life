// A_shop_menu_fnc_get_drug_list

#include "header.h"


ARGV(0,_shop_id);

private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {[]};

private["_list"];
_list = [_shop_cache, "drugList"] call A_object_fnc_getVariable;
if (UNDEFINED(_list)) exitWith {[]};
if (typeName _list != "ARRAY") exitWith {[]};

_list
