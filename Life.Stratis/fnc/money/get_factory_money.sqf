// A_money_fnc_get_factory_money

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {0};

private["_money"];
_money = 0;
{
	_factory_array = _x;
	_factory_name = _factory_array select 7;
	_factory_money = [_player, "money", _factory_name] call A_inventory_fnc_get_storage_amount;
	_money = _money + _factory_money;
} foreach all_factories;

_money
