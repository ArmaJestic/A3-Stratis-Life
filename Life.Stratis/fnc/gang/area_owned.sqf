// A_gang_fnc_area_owned

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_gang_area);
if (not([_player] call A_player_fnc_human)) exitWith {false};

private["_gang", "_player_uid"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (undefined(_gang)) exitWith {false};

private["_gang_id"];
_A_gang_var_id = _gang select A_gang_var_id;

private["_control"];
_control = [_gang_area] call A_gang_fnc_area_get_control;

(_control == _gang_id)
