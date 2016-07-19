// A_inventory_fnc_set_item_amount

#include "../../includes/constants.h"
#include "../../includes/macro.h"


//player groupChat format["A_inventory_fnc_set_item_amount %1", _this];
ARGV(0,_object);
ARGV(1,_item);
ARGV(2,_number);

private["_array_name"];
_array_name = ([_object] call A_player_fnc_object_storage_name);

([_object, _item, _number, _array_name] call A_inventory_fnc_set_storage_amount)
