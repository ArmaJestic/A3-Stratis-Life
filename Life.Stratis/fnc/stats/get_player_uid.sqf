// A_stats_fnc_get_player_uid

#include "header.h"


params["_player"];
	
private _uid = [_player, VAR_STATS_UID] call A_object_fnc_getVariable;
if DEFINED(_uid) exitWith {_uid};

_uid = getPlayerUID _player;
if (_uid == "") exitWith {""};
	
[_player, "real_uid", _uid, true] call A_object_fnc_setVariable;
[_player, "name", (name _player), true] call A_object_fnc_setVariable;
[_player, VAR_STATS_UID, _uid, true] call A_object_fnc_setVariable;
_uid