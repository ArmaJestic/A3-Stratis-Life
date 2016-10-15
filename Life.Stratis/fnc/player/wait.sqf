// A_player_fnc_wait

#include "header.h"


diag_log format['A_player_fnc_wait: %1', _this];

ARGV(0,_flag_name);

if (UNDEFINED(_flag_name)) exitWith {diag_log format['A_player_fnc_wait %1: exit1', _this]; null};
if (typeName _flag_name != "STRING") exitWith {diag_log format['A_player_fnc_wait %1: exit2', _this]; null};

private _flag_variable = missionNamespace getVariable _flag_name;
if (UNDEFINED(_flag_variable)) exitWith {diag_log format['A_player_fnc_wait %1: exit3', _this]; null};

waitUntil {missionNamespace getVariable _flag_name};