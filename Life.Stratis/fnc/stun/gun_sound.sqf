// A_stun_fnc_gun_sound

#include "..\..\includes\macro.h"


ARGV(0,_unit);
if (!([_unit] call A_player_fnc_blufor)) exitWith {};

[[_unit], "A_stun_fnc_gun_sound_receive", true, false] call BIS_fnc_MP;
