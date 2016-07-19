// A_inventory_fnc_get_player_weight

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);

private["_inventory_name"];
_inventory_name = [_player] call A_player_fnc_object_storage_name;
([_player, _inventory_name] call A_inventory_fnc_get_storage_weight)	
