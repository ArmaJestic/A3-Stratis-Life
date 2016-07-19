// A_player_fnc_isleep

#include "../../includes/macro.h"


ARGV(0,_sleep);
_sleep = serverTime + _sleep;
waitUntil { _sleep < serverTime };
