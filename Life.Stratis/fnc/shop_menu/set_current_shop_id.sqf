// A_shop_menu_fnc_set_current_shop_id

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_shop_id);
if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

[player, "current_shop_id", _shop_id] call A_object_fnc_setVariable;
