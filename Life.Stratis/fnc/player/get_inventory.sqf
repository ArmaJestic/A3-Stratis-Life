// A_player_fnc_get_inventory

#include "header.h"


ARGV(0,_player);

private["_inventory_name"];
_inventory_name = [_player] call A_player_fnc_inventory_name;
if (_inventory_name == "") exitWith {[]};

private["_inventory"];
_inventory = [_player, _inventory_name] call A_object_fnc_getVariable;
(_inventory)