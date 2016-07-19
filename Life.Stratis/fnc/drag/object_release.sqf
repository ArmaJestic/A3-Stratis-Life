// A_drag_fnc_object_release

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_this);
ARGV(0,_player);

[_player, "held_target", nil, true] call A_object_fnc_setVariable;
