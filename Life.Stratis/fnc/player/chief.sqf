// A_player_fnc_chief

#include "header.h"


ARGV(0,_player);
private["_uid"];
_uid = getPlayerUID _player;
if (_uid == "") exitWith {false};
(_uid == (server getVariable ["chief_uid", "(unknown)"]))
