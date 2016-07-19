// A_player_fnc_drop_item_init_handler_persistent

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_item);
ARGV(2,_name);

if (undefined(_object)) exitWith {};
if (undefined(_item)) exitWith {};
if (undefined(_name)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (isNull _object) exitWith {};
if (typeName _item != "STRING") exitWith {};
if (typeName _name != "STRING") exitWith {};

_object setVehicleVarName _name;
missionNamespace setVariable [_name, _object];
[_object, _item] call A_mine_fnc_ore_init_handler_persistent;
