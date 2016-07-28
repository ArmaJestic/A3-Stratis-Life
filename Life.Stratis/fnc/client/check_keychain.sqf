// A_client_fnc_check_keychain

#include "..\..\includes\macro.h"


private["_player"];
_player = player;
if (([_player, "keychain"] call A_inventory_fnc_get_item_amount) == 1) exitWith {null};	
[_player, "keychain", 1] call A_inventory_fnc_set_item_amount;
