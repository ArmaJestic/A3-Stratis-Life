// A_player_fnc_save_private_storage

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private["_storage_name", "_storage"];
_storage_name = "private_storage";
_storage = [_player, _storage_name] call A_player_fnc_get_array;
[_player, _storage_name, _storage, false] call A_player_fnc_set_array_checked;
