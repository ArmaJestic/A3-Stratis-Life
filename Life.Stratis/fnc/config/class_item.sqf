// A_config_fnc_class_item

#include "..\..\includes\macro.h"


ARGV(0,_item_id);
if (UNDEFINED(_item_id)) exitWith {false};
if (typeName _item_id != "STRING") exitWith {false};
if (_item_id == "") exitWith {false};
if (!(isClass(configFile >> "CfgWeapons" >> _item_id))) exitWith {false};
if (!(isClass(configFile >> "CfgWeapons" >> _item_id >> "ItemInfo"))) exitWith {false};
true
