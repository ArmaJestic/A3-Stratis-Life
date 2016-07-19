// A_shop_menu_fnc_set_put_gear_cb

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_shop_id);
ARGV(1,_state);

private ["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {null};

if (undefined(_state)) then { _state = true; };
if (typeName _state != "BOOL") then { _state = true;};
	
[_shop_cache, "put_gear", _state] call A_object_fnc_setVariable; 