// A_player_fnc_update_reason

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_reason);

private["_reasons"];
_reasons = [_player] call A_player_fnc_get_reason;

if (_reason in _reasons) exitWith {null};
_reasons = _reasons + [_reason];
[_player, _reasons] call A_player_fnc_set_reason;
