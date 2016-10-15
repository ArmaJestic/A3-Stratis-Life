// A_mounted_fnc_set_stance

#include "header.h"


ARGV(0,_player);
ARGV(1,_stance_sequence);
[_this, "A_mounted_fnc_set_stance_handler", true, false] call BIS_fnc_MP;
