// A_interaction_fnc_inventory_actions_allowed

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
(not([_player] call A_player_fnc_vulnerable))
