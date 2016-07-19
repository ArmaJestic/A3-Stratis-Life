// A_tree_fnc_set_dead

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_tree);
ARGV(1,_state);
if (undefined(_tree)) exitWith {};
missionNamespace setVariable [format["%1_dead", netId(_tree)], _state];
