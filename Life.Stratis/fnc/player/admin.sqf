// A_player_fnc_admin

#include "header.h"


params["_player"];
private _uid = getPlayerUID _player;
(["admin_list", _uid] call A_list_fnc_contains_key)