// A_player_fnc_human

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith { false};
(isPlayer _player)
