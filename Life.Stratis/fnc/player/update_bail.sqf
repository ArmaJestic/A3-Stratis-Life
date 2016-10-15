// A_player_fnc_update_bail

#include "header.h"


ARGV(0,_player);
ARGV(1,_bail);

private["_current_bail"];

_current_bail = [_player] call A_player_fnc_get_bail;
private["_new_bail"];
_new_bail = (_current_bail + _bail);
_new_bail = if (_new_bail < 0) then {0} else {_new_bail};

[_player, _new_bail] call A_player_fnc_set_bail;
