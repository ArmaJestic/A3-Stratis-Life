// A_pos_fnc_is_frontback

#include "..\..\includes\macro.h"


ARGV(0,_unit1);
ARGV(1,_unit2);

private ["_return", "_check"];
_return = "";
_check = [getpos _unit2, getdir _unit2, 180, getpos _unit1] call A_pos_fnc_angle_sector;
if (_check) then {
	_return = "front";
} else {
	_return = "back";
};

_return;
