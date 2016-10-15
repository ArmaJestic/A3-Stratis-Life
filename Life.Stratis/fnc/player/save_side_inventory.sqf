// A_player_fnc_save_side_inventory

#include "header.h"


diag_log format['A_player_fnc_save_side_inventory %1: start',_this];


params["_player"];
private["_inventory_name","_inventory_name"];
_inventory_name = [_player] call A_player_fnc_inventory_name;
_inventory = [_player] call A_player_fnc_get_inventory;

diag_log format['A_player_fnc_save_side_inventory %1: inventory-%2',_this,_inventory];
[_player, _inventory_name, _inventory, false] call A_player_fnc_set_array_checked;


diag_log format['A_player_fnc_save_side_inventory %1: end',_this];