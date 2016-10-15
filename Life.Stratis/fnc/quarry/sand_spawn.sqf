// A_quarry_fnc_sand_spawn

#include "header.h"


//player groupChat format["A_quarry_fnc_sand_spawn %1", _this];
ARGV(0,_item);
ARGV(1,_amount);
ARGV(2,_position);
ARGV(3,_radius);

if (UNDEFINED(_item)) exitWith {};
if (UNDEFINED(_amount)) exitWith {};
if (UNDEFINED(_position)) exitWith {};
if (UNDEFINED(_radius)) exitWith {};
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
[_object, _item, _amount] call A_object_fnc_item_set_data;
