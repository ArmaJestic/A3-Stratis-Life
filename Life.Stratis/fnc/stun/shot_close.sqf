// A_stun_fnc_shot_close

#include "../../includes/macro.h"


player groupChat format["A_stun_fnc_shot_close %1", _this];
ARGV(0,_unit);
ARGV(1,_shooter);
ARGV(2,_selection);
ARGV(3,_damage);
ARGV(4,_armor);
ARGV(5,_veh);
ARGV(6,_inveh);
ARGV(7,_distance);


if (_inveh) then {
	_unit action ["eject", _veh];
	sleep 0.01;
};

[_unit, StunTimePerHit] spawn A_stun_fnc_effects_full;
