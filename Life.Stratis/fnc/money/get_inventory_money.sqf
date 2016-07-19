// A_money_fnc_get_inventory_money

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {0};

([_player, "money"] call A_inventory_fnc_get_item_amount)
