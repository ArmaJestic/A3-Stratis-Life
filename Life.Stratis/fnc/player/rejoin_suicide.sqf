// A_player_fnc_rejoin_suicide

#include "header.h"

diag_log "A_player_fnc_rejoin_suicide: start";

player_rejoin_suicide_active = true;
player setPosATL[0,0,0];
player setDamage 1;

diag_log "A_player_fnc_rejoin_suicide: waiting for player_rejoin_camera_complete";

waitUntil {!(isNil "player_rejoin_camera_complete") && {player_rejoin_camera_complete}};

diag_log "A_player_fnc_rejoin_suicide: ending";