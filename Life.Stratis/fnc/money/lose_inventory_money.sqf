// A_money_fnc_lose_inventory_money

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_lost_amount);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_lost_amount)) exitWith {null};
if (typeName _lost_amount != "SCALAR") exitWith {null};

[_player, 'money', -(_lost_amount)] call A_inventory_fnc_add_item;
