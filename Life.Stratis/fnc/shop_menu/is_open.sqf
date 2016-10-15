// A_shop_menu_fnc_is_open

#include "header.h"


ARGV(0,_shop_id);

private ["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith { false };

private ["_open"];
_open = [_shop_cache, "open"] call A_object_fnc_getVariable;
if (UNDEFINED(_open)) exitWith { false };
if (typeName _open != "BOOL") exitWith {   false };
_open	
