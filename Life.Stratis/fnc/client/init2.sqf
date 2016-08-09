// A_client_fnc_init2

#include "..\..\includes\macro.h"

if (isServer) exitwith {};

// from respawn.sqf
["player_rejoin_camera_complete"] call A_player_fnc_wait;
[player] call A_interaction_fnc_stranded_check;
[player, true] call A_player_fnc_spawn;

player addEventHandler ["fired", {_this call A_player_fnc_handle_fired}];
player addEventHandler ["HandleDamage", {_this call A_player_fnc_handle_damage}];

[] spawn A_client_fnc_loop;