// A_interaction_fnc_player_inventory_space

#include "header.h"


//player groupChat format["A_interaction_fnc_player_inventory_space %1", _this];
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {0};
if (UNDEFINED(_item)) exitWith {0};
if (UNDEFINED(_amount)) exitWith {0};
if (typeName _item != "STRING") exitWith {0};
if (typeName _amount != "SCALAR") exitWith {0};

if (_amount <= 0) then {0};


private["_item_info","_item_weight", "_player_weight", "_item_total_weight", "_available_weight"];
_item_info = _item call A_inventory_fnc_get_item_array;
_item_weight = ITEM_DATA_WEIGHT(_item_info);
_player_weight = [_player] call A_inventory_fnc_get_player_weight;
_item_total_weight = _item_weight * _amount;
_available_weight = A_inventory_var_INV_CarryingCapacity - _player_weight;

private["_pickup_amount"];
_pickup_amount = _amount;

if ((_available_weight < _item_total_weight) && _item_weight > 0) then {
	_pickup_amount = floor(_available_weight / _item_weight);
};

//player groupChat format["_amount = %1, _pickup_amount = %2", _amount, _pickup_amount];
(_pickup_amount)
