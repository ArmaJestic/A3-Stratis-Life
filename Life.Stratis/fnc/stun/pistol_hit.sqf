// A_stun_fnc_pistol_hit

#include "..\..\includes\macro.h"


ARGV(0,_unit);
ARGV(1,_man);
ARGV(2,_time);

[_unit, _man] call A_stun_fnc_annouce_hit;
[_man, _time] spawn A_stun_fnc_effects_light;
