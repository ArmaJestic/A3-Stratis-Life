// A_gang_fnc_flag_at_max

#include "header.h"


ARGV(0,_anchor);

if (UNDEFINED(_anchor)) exitWith {false};
if (typeName _anchor != "OBJECT") exitWith {false};
if (isNull _anchor) exitWith {false};

private["_banner"];
_banner = [_anchor, "banner"] call A_object_fnc_getVariable;

if (UNDEFINED(_banner)) exitWith {null};
([_banner] call A_flag_pole_fnc_flag_at_max_z)
