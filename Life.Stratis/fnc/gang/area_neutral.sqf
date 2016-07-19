// A_gang_fnc_area_neutral

#include "../../includes/macro.h"


ARGV(0,_gang_area);

private["_control"];
_control = [_gang_area] call A_gang_fnc_area_get_control;
(_control == "")
