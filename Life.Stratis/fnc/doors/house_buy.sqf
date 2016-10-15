// A_doors_fnc_house_buy

#include "header.h"


ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_object);

if (UNDEFINED(_player)) exitWith {};
if (UNDEFINED(_object)) exitWith {};


[_player, "house_id", (netId _object), true] call A_object_fnc_setVariable;
_object setVariable["owner_uid", (getPlayerUID _player), true];
player groupChat format["You bought this house for $%1", strM(BUY_PRICE)];

[_player, _object] call A_doors_fnc_house_add_spawn_data;