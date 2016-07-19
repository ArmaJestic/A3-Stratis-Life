// A_player_fnc_reset_warrants

#include "../../includes/macro.h"


ARGV(0,_player);
[_player, false] call A_player_fnc_set_wanted;
[_player, 0] call A_player_fnc_set_bounty;
[_player, []] call A_player_fnc_set_reason;
