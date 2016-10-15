// A_gang_fnc_generate_id

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

private["_uid"];
_uid = [_player] call A_gang_fnc_player_uid;

private["_restart_count", "_gang_id"];
_restart_count = server getVariable "restart_count";
_gang_id = format["gang_%1_%2_%3", _uid, _restart_count, round(time)];
(_gang_id)
