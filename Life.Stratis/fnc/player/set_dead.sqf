// A_player_fnc_set_dead

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_dead);
private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));
[_player, format["isdead_%1", _side], _dead] call A_player_fnc_set_bool;
