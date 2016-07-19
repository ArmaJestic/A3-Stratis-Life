// A_config_fnc_class_item_max_load

#include "../../includes/macro.h"


//player groupChat format["A_config_fnc_class_item_max_load = %1", _this];
ARGV(0,_item_id);
if (not([_item_id] call A_config_fnc_class_item)) exitWith {0};

if (not(isClass(configFile >> "CfgWeapons" >> _item_id))) exitWith {0};

private["_itemInfo"];
_itemInfo = (configFile >> "CfgWeapons" >> _item_id >> "ItemInfo");

if (not(isText(_itemInfo >> "containerclass"))) exitWith {0};

private["_container_id"];
_container_id = getText(_itemInfo >> "containerclass");


([_container_id] call A_config_fnc_class_container_max_load)
