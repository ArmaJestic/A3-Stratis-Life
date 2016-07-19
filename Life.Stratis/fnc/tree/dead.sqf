// A_tree_fnc_dead

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_tree);
if (undefined(_tree)) exitWith {false};
(missionNamespace getVariable [format["%1_dead", netId(_tree)], false])
