// A_stats_fnc_server_wipe_player_data

#include "header.h"


params["_player_variable"]; 
_player = [_player_variable] call A_stats_fnc_get_mission_variable;
if (UNDEFINED(_player)) exitWith {};

private _uid = [_player] call A_stats_fnc_get_uid;
if (UNDEFINED(_uid)) exitWith {};
[_uid] call A_invokeJava_fnc_wipePlayerVariables;