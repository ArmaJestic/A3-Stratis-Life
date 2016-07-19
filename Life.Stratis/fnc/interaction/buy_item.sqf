// A_interaction_fnc_buy_item

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
ARGV(1,_item);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_item)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};

if (A_interaction_var_interact_buy_item_active) exitWith {
	player groupChat format["ERROR: You are already buying an item"];
};
A_interaction_var_interact_buy_item_active = true;

private["_player_money", "_item_cost", "_item_name", "_infos"];
_infos = _item call A_inventory_fnc_get_item_array;
_item_cost = _infos call A_inventory_fnc_get_item_buy_cost;
_item_name = (MASTER_ARRAY_ITEM_NAME(_infos));
_player_money = [_player, "money"] call A_inventory_fnc_get_item_amount;

if (_player_money < _item_cost) exitWith {
	player groupChat format["%1-%2, you do not have enough money to buy %3", (_player), (name _player), _item_name];
	A_interaction_var_interact_buy_item_active = false;
}; 

private["_space_available"];
_space_available = [_player, _item, 1] call A_interaction_fnc_player_inventory_space;
if (_space_available <= 0) exitWith {
	player groupChat format["%1-%2, you do not have enough space in your inventory for %3",  (_player), (name _player), (_item_name)];
	A_interaction_var_interact_buy_item_active = false;
}; 

[_player, "money", -(_item_cost)] call A_inventory_fnc_add_item;
[_player, _item, 1] call A_inventory_fnc_add_item;
player groupChat format["%1-%2, you bought one %3 for $%4", (_player), (name _player), _item_name, _item_cost];
sleep 3;

A_interaction_var_interact_buy_item_active = false
