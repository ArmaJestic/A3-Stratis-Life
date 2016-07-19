// A_stun_fnc_shot_far

#include "..\..\includes\macro.h"


player groupChat format["A_stun_fnc_shot_far %1", _this];
ARGV(0,_unit);
ARGV(1,_shooter);
ARGV(2,_selection);
ARGV(3,_damage);
ARGV(4,_armor);
ARGV(5,_veh);
ARGV(6,_inveh);
ARGV(7,_distance);

[[_unit, _shooter], "A_stun_fnc_announce", true, false] call BIS_fnc_MP;

_armor = [_unit, "stun_armor"] call A_object_fnc_getVariable;

if (undefined(_armor)) then {
	[_unit, "stun_armor", "none", true] call A_object_fnc_setVariable;
	_armor = [_unit, "stun_armor"] call A_object_fnc_getVariable;
};

//stun armor only protects at long range
if (not(_armor == "none")) exitWith {};

[_unit, StunTimePerHit] spawn A_stun_fnc_effects_light;
