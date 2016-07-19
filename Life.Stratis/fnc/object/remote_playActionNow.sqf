// A_object_fnc_remote_playActionNow

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_action);
if (undefined(_player)) exitWith {};
if (undefined(_action)) exitWith {};

_player playActionNow _action;
