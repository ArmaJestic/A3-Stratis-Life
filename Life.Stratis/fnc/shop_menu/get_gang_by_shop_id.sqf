// A_shop_menu_fnc_get_gang_by_shop_id

#include "header.h"


ARGV(0,_shop_id);
private["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {null};

private["_gang_id", "_gang"];
_gang_id = [_shop_cache, "control"] call A_object_fnc_getVariable;
if (UNDEFINED(_gang_id)) exitWith {null};
if (typeName _gang_id  != "STRING") exitWith {null};
if (_gang_id == "") exitWith {null};

([_gang_id] call A_gang_fnc_lookup_id)
