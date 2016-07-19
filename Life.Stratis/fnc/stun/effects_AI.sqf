// A_stun_fnc_effects_AI

#include "..\..\includes\macro.h"


ARGV(0,_unit);
ARGV(1,_time);

[[_unit], "A_stun_fnc_drop_weapons", _unit, false] call BIS_fnc_MP; 

sleep _time;

format['%1 switchmove "amovppnemstpsnonwnondnon";',_unit] call broadcast;
