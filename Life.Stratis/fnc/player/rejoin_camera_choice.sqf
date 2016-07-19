// A_player_fnc_rejoin_camera_choice

#include "..\..\includes\macro.h"


player groupChat format["A_player_fnc_rejoin_camera_choice %1", _this];
ARGV(0,_timeout);
ARGV(1,_countdown);
ARGV(2,_transition);

if (undefined(_transition)) then {
	_transition = 0;
};

player groupChat format["Waiting ..."];
waitUntil {(time > (_timeout - _countdown))};
player groupChat format["Waiting ... complete."];
setPlayerRespawnTime _countdown;
[player, _transition] call BIS_fnc_respawnMenuPosition;
waitUntil {(alive player)};
player groupChat format["Spawn ... complete."];
[player] call A_player_fnc_teleport_respawn_position;
setPlayerRespawnTime 30;
