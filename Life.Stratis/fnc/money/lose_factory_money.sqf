// A_money_fnc_lose_factory_money

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {0};
if (undefined(_amount)) exitWith {0};
if (typeName _amount != "SCALAR") exitWith {0};

private["_lost_amount"];
_lost_amount = 0;
{
	_factory_array = _x;
	_factory_name = _factory_array select 7;
	_factory_money = [_player, "money", _factory_name] call A_inventory_fnc_get_storage_amount;
	
	_lost_amount = (_factory_money) min (_amount);
	[_player, "money", -(_lost_amount), _factory_name] call A_inventory_fnc_storage_add_item;
	_amount = _amount - _lost_amount;

	if (_amount <= 0) exitWith {_amount = 0;};
} foreach all_factories;

[_player] call A_factory_fnc_save_storage;
_amount
