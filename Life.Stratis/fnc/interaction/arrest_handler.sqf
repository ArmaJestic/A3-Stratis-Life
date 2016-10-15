// A_interaction_fnc_arrest_handler

#include "header.h"


ARGV(2,_this);
ARGV(0,_player);
ARGV(1,_target);

[_player,_target] call A_arrest_menu_fnc_create;
