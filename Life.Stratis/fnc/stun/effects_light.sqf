// A_stun_fnc_effects_light

#include "..\..\includes\macro.h"


player groupChat format["A_stun_fnc_effects_light %1", _this];
ARGV(0,_unit);
ARGV(1,_time);

[_unit, _time] spawn A_stun_fnc_blur_effect_wait;
