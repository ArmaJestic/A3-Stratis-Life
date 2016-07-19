// A_inventory_fnc_has_item

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_item);

private["_return"];
_return = false;

//Object item
if ((typeName _item) == "STRING") then {
	if(([_object, _item] call A_inventory_fnc_get_item_amount) > 0) exitWith{_return = true;};
};
if ((typeName _item) == "ARRAY") then {
	{
		if(([_object, _x] call A_inventory_fnc_get_item_amount) > 0) exitWith{_return = true;};
	} foreach _item;
};
_return
