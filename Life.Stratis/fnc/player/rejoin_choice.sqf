// A_player_fnc_rejoin_choice
// useless until menu works

#include "header.h"


diag_log format["A_player_fnc_rejoin_choice: %1", _this];

params["_countdown"];
A_player_var_rejoin_choice_active = true;
cutText["","BLACK OUT",0.0001];
private["_pos"];


// player setDamage 1;
// waitUntil {!(isNil "player_rejoin_camera_complete") && {player_rejoin_camera_complete}};

// waitUntil {!(alive player)};
// setPlayerRespawnTime _countdown;
// [player, 0] call BIS_fnc_respawnMenuPosition;
// waitUntil {(alive player)};

diag_log format["A_player_fnc_rejoin_choice: Spawn ... complete."];

[player] call A_player_fnc_teleport_respawn_position;
// setPlayerRespawnTime 30;

diag_log format["A_player_fnc_rejoin_choice: Rejoin choice complete!"];

if (forcedMap select 0) then {
	diag_log "A_player_fnc_rejoin_choice: forcedMap[0] true";
	forceMap false;
};
if (forcedMap select 1) then {
	diag_log "A_player_fnc_rejoin_choice: forcedMap[1] true";
	openMap[false,false];
};

cutText["", "BLACK IN", 5];
A_player_var_rejoin_choice_active = false;