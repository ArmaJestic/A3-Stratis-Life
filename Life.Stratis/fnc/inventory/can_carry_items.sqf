// A_inventory_fnc_can_carry_items

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_item);
ARGV(1,_count);

private["_data"];
_data = ITEM_DATA(_item);
if (count(_data) == 0) exitWith {true};


private["_items_weight", "_own_weight", "_remain_weight"];

_items_weight = (ITEM_DATA_WEIGHT(_data)*_count);
_own_weight = (call A_inventory_fnc_get_own_weight);
_remain_weight = (A_inventory_var_INV_CarryingCapacity - _own_weight);

(_remain_weight <  _items_weight)
