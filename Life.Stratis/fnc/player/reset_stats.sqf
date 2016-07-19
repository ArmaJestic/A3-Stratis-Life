// A_player_fnc_reset_stats

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};
[_player, "deadtimes", 1] call A_player_fnc_update_scalar;
[_player, "extradeadtime", 30] call A_player_fnc_update_scalar;
