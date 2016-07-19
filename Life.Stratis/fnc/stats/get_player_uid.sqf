// A_stats_fnc_get_player_uid

#include "../../includes/macro.h"

private["_player", "_uid"];
_player = _this select 0;
	
_uid = [_player, "stats_uid"] call A_object_fnc_getVariable;
if (not(undefined(_uid))) exitWith {_uid};

_uid = getPlayerUID _player;
if (undefined(_uid)) exitWith {""};
if (typeName _uid != "STRING") exitWith {""};
if (_uid == "") exitWith {""};
	
[_player, "real_uid", _uid, true] call A_object_fnc_setVariable;
[_player, "name", (name _player), true] call A_object_fnc_setVariable;
[_player, "stats_uid", _uid, true] call A_object_fnc_setVariable;
_uid	
