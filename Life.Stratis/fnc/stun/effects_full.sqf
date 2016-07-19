// A_stun_fnc_effects_full

#include "..\..\includes\macro.h"


player groupChat format["A_stun_fnc_effects_full %1", _this];
ARGV(0,_unit);
ARGV(1,_time);

[[_unit], "A_stun_fnc_drop_weapons", _unit, false] call BIS_fnc_MP; 
[_unit, _time] spawn A_stun_fnc_blur_effect_wait;
