// A_shop_menu_fnc_lookup

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_shop_id);
_shop_key = [_shop_id] call A_shop_menu_fnc_make_key;
if (undefined(_shop_key)) exitWith {null};

_shop_cache = server getVariable _shop_key;
_shop_cache
