// A_config_fnc_class_item_mass

#include "..\..\includes\macro.h"


ARGV(0,_item_id);
if (not([_item_id] call A_config_fnc_class_item)) exitWith {0};

private["_itemInfo"];
_itemInfo = (configFile >> "CfgWeapons" >> _item_id >> "ItemInfo");

(getNumber(_itemInfo >> "mass"))
