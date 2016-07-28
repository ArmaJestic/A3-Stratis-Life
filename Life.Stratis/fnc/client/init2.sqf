// A_client_fnc_init2

#include "..\..\includes\macro.h"

// from respawn.sqf
["player_rejoin_camera_complete"] call A_player_fnc_wait;;
[player] call A_interaction_fnc_stranded_check;
[player, true] call A_player_fnc_spawn;
