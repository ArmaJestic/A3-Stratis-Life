// A_money_fnc_get_private_storage_money

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {0};

([_player, "money", "private_storage"] call A_inventory_fnc_get_storage_amount)
