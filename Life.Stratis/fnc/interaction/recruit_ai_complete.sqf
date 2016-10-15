// A_interaction_fnc_recruit_ai_complete

#include "header.h"


ARGV(0,_player);
ARGV(1,_unit);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_unit] call A_player_fnc_exists)) exitWith {null};
if (_player != player) exitWith {null};

[_unit] joinSilent (group _player);
