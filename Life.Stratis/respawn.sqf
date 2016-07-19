#include "Awesome\Functions\macro.h"
if (not(undefined(respawn_functions_defined))) exitWith {null};

["player_rejoin_camera_complete"] call A_player_fnc_wait;;
[player] call A_interaction_fnc_stranded_check;
[player, true] call A_player_fnc_spawn;

respawn_functions_defined = true;
