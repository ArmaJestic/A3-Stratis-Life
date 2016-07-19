// A_player_fnc_set_inventory

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_inventory);

if (undefined(_inventory)) exitWith {null};
if (typeName _inventory != "ARRAY") exitWith {null};

private["_inventory_name"];
_inventory_name = [_player] call A_player_fnc_inventory_name;
if (_inventory_name == "") exitWith {null};

[_player, _inventory_name, _inventory, true] call A_object_fnc_setVariable;
