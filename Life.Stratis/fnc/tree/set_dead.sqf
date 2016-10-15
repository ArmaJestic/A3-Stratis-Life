// A_tree_fnc_set_dead

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_tree);
ARGV(1,_state);
if (UNDEFINED(_tree)) exitWith {};
missionNamespace setVariable[format["%1_dead", netId(_tree)], _state];
