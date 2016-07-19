// A_interaction_fnc_buy_insurance

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
([_player, "bankinsurance"] call A_interaction_fnc_buy_item)
