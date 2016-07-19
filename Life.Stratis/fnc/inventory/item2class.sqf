// A_inventory_fnc_item2class

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_item", "_class"];
_item = _this select 0;
_class = "Land_CanisterPlastic_F";

//player groupChat format["item to class %1", _item];
if (undefined(_item)) exitWith {_class};
if (typeName _item != "STRING") exitWith {_class};

private["_info"];
_info = _item call A_inventory_fnc_get_item_array;
if (undefined(_info)) exitWith {_class};

private["_cclass"];

(_info call A_inventory_fnc_get_item_class)
