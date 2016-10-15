// A_player_fnc_admin

#include "header.h"


params["_player"];
private _uid = getPlayerUID _player;
diag_log format['A_player_fnc_admin(%1): uid-%2, list-%3, contains-%4',_player,_uid,(["admin_list", _uid] call A_list_fnc_contains_key)];
(["admin_list", _uid] call A_list_fnc_contains_key)