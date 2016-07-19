// A_player_fnc_save_side_inventory

#include "..\..\includes\macro.h"


//diag_log format["A_player_fnc_save_side_inventory %1", _this];
ARGV(0,_player);

private["_inventory_name"];
_inventory_name = [_player] call A_player_fnc_inventory_name;
_inventory = [_player] call A_player_fnc_get_inventory;
diag_log format["_inventory = %1", _inventory];
[_player, _inventory_name, _inventory, false] call A_player_fnc_set_array_checked;
