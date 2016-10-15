// A_player_fnc_prison_reset

#include "header.h"


ARGV(0,_player);
[_player, false] call A_player_fnc_set_arrest;
[_player, "jailtimeleft", 0] call A_player_fnc_set_scalar;
[_player, 0] call A_player_fnc_set_bail;
[_player] call A_player_fnc_reset_warrants;
