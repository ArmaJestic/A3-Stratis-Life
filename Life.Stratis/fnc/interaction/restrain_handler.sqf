// A_interaction_fnc_restrain_handler

#include "header.h"


ARGV(2,_this);
ARGV(0,_player);
ARGV(1,_target);

[_player, _target] call A_interaction_fnc_toggle_restrains;
closeDialog 0;
