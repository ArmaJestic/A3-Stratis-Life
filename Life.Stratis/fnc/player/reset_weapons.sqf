// A_player_fnc_reset_weapons
// removes weapon/magazines from unit

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

// remove weapons
removeAllWeapons _player;

// remove magazines
{player removeMagazine _x} forEach (magazines _player);
