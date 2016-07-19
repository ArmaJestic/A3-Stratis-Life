// A_stun_fnc_pistol_back

#include "../../includes/macro.h"


ARGV(0,_unit);
ARGV(1,_man);

[[_unit,_man, stunpistolback], "A_stun_fnc_pistol_hit", _man, false] call BIS_fnc_MP;	
