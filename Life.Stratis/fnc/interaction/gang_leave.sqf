// A_interaction_fnc_gang_leave

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

private["_player_uid", "_gang"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (undefined(_gang)) exitWith {
	player groupChat format["%1-%2, you are not in any gang", _player, (name _player)];
};

private["_gang_id"];
_A_gang_var_id = _gang select A_gang_var_id;
format['["%1", "%2"] call A_gang_fnc_remove_member;', _gang_id, _player_uid] call A_broadcast_fnc_broadcast;
player groupChat format["%1-%2, you have left gang %3", _player, (name _player), (_gang select A_gang_var_name)];
