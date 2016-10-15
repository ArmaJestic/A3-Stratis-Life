// A_player_fnc_side

#include "header.h"


params["_player"];
if ([_player] call A_player_fnc_human) exitWith {
	([_player] call A_player_fnc_human_side)
};
([_player] call A_player_fnc_ai_side)