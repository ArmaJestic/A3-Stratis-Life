// A_mine_fnc_ore_spawn

#include "../../includes/constants.h"
#include "../../includes/macro.h"


player groupChat format["A_mine_fnc_ore_spawn %1", _this];
ARGV(0,_item);
ARGV(1,_amount);
ARGV(2,_position);
ARGV(3,_radius);

if (undefined(_item)) exitWith {};
if (undefined(_amount)) exitWith {};
if (undefined(_position)) exitWith {};
if (undefined(_radius)) exitWith {};
if (typeName _item != "STRING") exitWith {};
if (typename _amount != "SCALAR") exitWith {};
if (typename _position != "ARRAY") exitWith {};
if (typename _radius != "SCALAR") exitWith {};


private["_data"];
_data = ITEM_DATA(_item);
if (count(_data) == 0) exitWith {};

private["_class"];
_class = ITEM_DATA_CLASS(_data);

private["_object"];
_object = createVehicle [_class, _position, [], _radius, "NONE"];
[[_object, _item], "A_mine_fnc_ore_init_handler_persistent", true, true, _object] spawn A_jip_fnc_register;

[_object, _item, _amount] call A_object_fnc_item_set_data;
