// A_player_fnc_get_dead

#include "../../includes/macro.h"


ARGV(0,_player);
private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));
([_player, format["isdead_%1", _side]] call A_player_fnc_get_bool)
