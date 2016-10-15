// A_player_fnc_get_index

#include "header.h"


ARGV(0,_player);

if (!([_player] call A_player_fnc_human)) exitWith {-1};

private["_player_index"];

_player_index = (A_player_var_playerstringarray find (str(_player)));
_player_index
