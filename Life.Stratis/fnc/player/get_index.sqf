// A_player_fnc_get_index

#include "..\..\includes\macro.h"


ARGV(0,_player);

if (not([_player] call A_player_fnc_human)) exitWith {-1};

private["_player_index"];

_player_index = (playerstringarray find (str(_player)));
_player_index
