// A_player_fnc_president

#include "header.h"


ARGV(0,_player);
private["_uid"];
_uid = getPlayerUID _player;
if (_uid == "") exitWith {false};
(_uid == (server getVariable ["president_uid", "(unknown)"]))
