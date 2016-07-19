// A_bunker_fnc_door_sound

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_player);
[[_player], "A_bunker_fnc_door_sound_handler", true] call BIS_fnc_MP;
};
