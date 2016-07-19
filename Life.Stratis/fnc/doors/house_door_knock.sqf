// A_doors_fnc_house_door_knock

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_this);
ARGV(0,_player);
[[_player], "A_doors_fnc_house_door_knock_handler", true] call BIS_fnc_MP;
