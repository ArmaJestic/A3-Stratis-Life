// A_interaction_fnc_disarm_handler

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(2,_this);
ARGV(0,_player);
ARGV(1,_target);

[_player,_target] call A_interaction_fnc_disarm;
