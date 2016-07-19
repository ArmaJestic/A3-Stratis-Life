// A_player_fnc_side

#include "../../includes/macro.h"


ARGV(0,_player);
if ([_player] call A_player_fnc_human) exitWith {
	([_player] call A_player_fnc_human_side)
};
([_player] call A_player_fnc_ai_side)
