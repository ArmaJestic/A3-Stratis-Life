// A_interaction_fnc_item_give_receive

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
//player groupChat format["A_interaction_fnc_item_give_receive %1", _this];
ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_item);
ARGV(3,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};
if (_target != player) exitWith {null};
if (undefined(_item)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_amount < 0) exitWith {null};

[] call A_interaction_fnc_play_pickup_animation;

private["_item_name"];
_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

[_target, _item, (_amount)] call A_inventory_fnc_add_item;
player groupChat format["%1-%2 gave you %3 units of %4", (_player), (name _player), strN(_amount), _item_name];
};
