// A_shop_menu_fnc_get_drug_list

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);

private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {[]};

private["_list"];
_list = [_shop_cache, "drugList"] call A_object_fnc_getVariable;
if (undefined(_list)) exitWith {[]};
if (typeName _list != "ARRAY") exitWith {[]};

_list
