// A_shop_menu_fnc_set_sell_cb

#include "header.h"


ARGV(0,_shop_id);
ARGV(1,_state);

private ["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {null};

if (UNDEFINED(_state)) then { _state = false; };
if (typeName _state != "BOOL") then { _state = false;};
	
[_shop_cache, "hide_sell_items", _state] call A_object_fnc_setVariable; 
