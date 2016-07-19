// A_pos_fnc_is_facing

#include "..\..\includes\macro.h"


ARGV(0,_unit1);
ARGV(1,_unit2);

private ["_return"];
_return = [getpos _unit1, getdir _unit1, 45, getpos _unit2] call A_pos_fnc_angle_sector;
_return;
