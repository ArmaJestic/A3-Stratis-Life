// A_player_fnc_remove_clothes

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

_player addUniform "None";
_player addVest "None";
_player addHeadgear "None";
_player addGoggles "None";
