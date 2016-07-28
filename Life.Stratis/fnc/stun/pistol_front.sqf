// A_stun_fnc_pistol_front

#include "..\..\includes\macro.h"


ARGV(0,_unit);
ARGV(1,_man);

[[_unit,_man, A_main_var_stunpistolfront], "A_stun_fnc_pistol_hit", _man, false] call BIS_fnc_MP;	
