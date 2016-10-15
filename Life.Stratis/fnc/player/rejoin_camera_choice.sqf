// A_player_fnc_rejoin_camera_choice

#include "header.h"


diag_log format["A_player_fnc_rejoin_camera_choice start: %1", _this];

ARGV(0,_timeout);
ARGV(1,_countdown);
ARGV(2,_transition);

if (UNDEFINED(_transition)) then {
	_transition = 0;
};

diag_log format["A_player_fnc_rejoin_camera_choice: Waiting ..."];

waitUntil {(time > (_timeout - _countdown))};

diag_log format["A_player_fnc_rejoin_camera_choice: Waiting ... complete."];

setPlayerRespawnTime _countdown;
// [player, _transition] call BIS_fnc_respawnMenuPosition;
waitUntil {(alive player)};

diag_log format["A_player_fnc_rejoin_camera_choice: Spawn ... complete."];

[player] call A_player_fnc_teleport_respawn_position;
setPlayerRespawnTime 30;