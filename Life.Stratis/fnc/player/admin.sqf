// A_player_fnc_admin

#include "..\..\includes\macro.h"


ARGV(0,_player);
private["_uid"];
_uid = getPlayerUID _player;
(["admin_list", _uid] call A_list_fnc_contains_key)
