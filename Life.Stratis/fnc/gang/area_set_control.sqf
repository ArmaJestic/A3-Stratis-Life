// A_gang_fnc_area_set_control

#include "header.h"


ARGV(0,_gang_area);
ARGV(1,_gang_id);

if (UNDEFINED(_gang_area)) exitWith {null};
if (typeName _gang_area != "OBJECT") exitWith {null};
if (UNDEFINED(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

[_gang_area, "control", _gang_id, true] call A_object_fnc_setVariable;
