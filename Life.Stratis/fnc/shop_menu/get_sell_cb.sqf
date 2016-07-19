// A_shop_menu_fnc_get_sell_cb

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);

private ["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith { false };

private ["_state"];
_state = [_shop_cache, "hide_sell_items"] call A_object_fnc_getVariable;	
if (undefined(_state)) exitWith { false };
if (typeName _state != "BOOL") exitWith { false };
_state
