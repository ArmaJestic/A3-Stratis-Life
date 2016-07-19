// A_gang_fnc_player_disconnected

#include "..\..\includes\macro.h"


player groupChat format["A_gang_fnc_player_disconnected %1", _this];
ARGV(0,_player);
private["_gang_player_uid"];
_A_gang_fnc_player_uid = [_player] call A_gang_fnc_player_uid;

private["_gang"];
_gang = [_gang_player_uid] call A_gang_fnc_lookup_player_uid;
if (undefined(_gang)) exitWith {null};

private["_gang_id"];
_A_gang_var_id = _gang select A_gang_var_id;

[_gang_id, _gang_player_uid] call A_gang_fnc_remove_member;
