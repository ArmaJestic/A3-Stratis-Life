// A_inventory_fnc_add_item

#include "header.h"


//player groupChat format["A_inventory_fnc_add_item %1", _this];
ARGV(0,_object);
ARGV(1,_item);
ARGV(2,_amount);

private["_info"];
_info = _item call A_inventory_fnc_get_item_array;

if (count(_info) == 0) exitWith {};

private["_total_weight", "_own_weight", "_item_weight"];
_own_weight = (call A_inventory_fnc_get_own_weight);
_item_weight = ITEM_DATA_WEIGHT(_info);
_total_weight = (_own_weight + (_amount * _item_weight));

if (_amount == 0) exitWith {false};
if (_total_weight > A_inventory_var_carrying_capacity && _amount > 0) exitWith {false};

([_object, _item, _amount, ([_object] call A_player_fnc_object_storage_name)] call A_inventory_fnc_storage_add_item)
