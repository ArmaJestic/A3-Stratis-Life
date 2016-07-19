// A_player_fnc_dead_wait_time

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_minimum_deadtime"];
_minimum_deadtime = call A_player_fnc_minimum_dead_time;
_maximum_deadtime = call A_player_fnc_maximum_dead_time;

private["_extradeadtime", "_deadtime"];
_extradeadtime = [_player, "extradeadtime"] call A_player_fnc_get_scalar;
_deadtime = _extradeadtime + _minimum_deadtime;
_deadtime = ((_maximum_deadtime) min (_deadtime));

_deadtime
