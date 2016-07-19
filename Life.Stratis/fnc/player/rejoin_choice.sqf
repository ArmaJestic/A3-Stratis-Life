// A_player_fnc_rejoin_choice

#include "../../includes/macro.h"


player groupChat format["A_player_fnc_rejoin_choice %1", _this];
ARGV(0,_countdown);
A_player_var_rejoin_choice_active = true;
titleText ["", "BLACK OUT", 0.0001];
private["_pos"];
player setDamage 1;
//waitUntil {not(isNil "player_rejoin_camera_complete") && {player_rejoin_camera_complete}};

waitUntil { not(alive player)};
setPlayerRespawnTime _countdown;
[player, 0] call BIS_fnc_respawnMenuPosition;
waitUntil {(alive player)};
player groupChat format["Spawn ... complete."];
[player] call A_player_fnc_teleport_respawn_position;
setPlayerRespawnTime 30;
player groupChat format["Rejoin choice complete!"];
titleText ["", "BLACK IN", 5];
A_player_var_rejoin_choice_active = false;
