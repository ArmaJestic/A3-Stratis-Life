// A_player_fnc_update_bounty

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_bounty);

private["_current_bounty"];

_current_bounty = [_player] call A_player_fnc_get_bounty;
private["_new_bounty"];
_new_bounty = (_current_bounty + _bounty);
_new_bounty = if (_new_bounty < 0) then {0} else {_new_bounty};

[_player, _new_bounty] call A_player_fnc_set_bounty;
