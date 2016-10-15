// A_player_fnc_pmc

#include "header.h"


ARGV(0,_player);
private["_uid"];
_uid = getPlayerUID _player;
(["pmc_whitelist", _uid] call A_list_fnc_contains_key)
