// A_tree_fnc_dead

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_tree);
if (UNDEFINED(_tree)) exitWith {false};
(missionNamespace getVariable [format["%1_dead", netId(_tree)], false])
