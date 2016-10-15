// A_inventory_fnc_get_item_amount

#include "header.h"


ARGV(0,_object);
ARGV(1,_item);

([_object, _item, ([_object] call A_player_fnc_object_storage_name)] call A_inventory_fnc_get_storage_amount)	
