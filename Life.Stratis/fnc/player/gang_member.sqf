// A_player_fnc_gang_member

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {false};

private["_player_gang_uid"];
_player_gang_uid = [_player] call A_gang_fnc_player_uid;

private["_gang"];
_gang = [_player_gang_uid] call A_gang_fnc_lookup_player_uid;
!(undefined(_gang))
