// A_player_fnc_update_warrants

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_reason);
ARGV(2,_bounty);

[_player, true] call A_player_fnc_set_wanted;
[_player, _reason] call A_player_fnc_update_reason;
[_player, _bounty] call A_player_fnc_update_bounty;
