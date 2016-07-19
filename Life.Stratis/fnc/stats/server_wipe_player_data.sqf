// A_stats_fnc_server_wipe_player_data

#include "..\..\includes\macro.h"

private["_player_variable"]; 
_player_variable = _this select 0;
_player = [_player_variable] call A_stats_fnc_get_mission_variable;
if (undefined(_player)) exitWith {null};

private["_uid"];
_uid = [_player] call A_stats_fnc_get_uid;
if (undefined(_uid)) exitWith {null};
[_uid] call A_invokeJava_fnc_wipePlayerVariables;
