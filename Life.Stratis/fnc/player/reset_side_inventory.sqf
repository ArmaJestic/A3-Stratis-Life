// A_player_fnc_reset_side_inventory

#include "../../includes/macro.h"


ARGV(0,_player);

private["_inventory_name"];
_inventory_name = [_player] call A_player_fnc_inventory_name;
if (_inventory_name == "") exitWith {null};

private["_empty_inventory"];
_empty_inventory =
[
	["keychain", ([1] call A_encoding_fnc_encode_number)], 
	["handy", ([1] call A_encoding_fnc_encode_number)]
];

[_player, _inventory_name, _empty_inventory, true] call A_object_fnc_setVariable;
