// A_gang_fnc_area_get_control

#include "header.h"


ARGV(0,_gang_area);
if (UNDEFINED(_gang_area)) exitWith {""};
if (typeName _gang_area != "OBJECT") exitWith {""};

private["_control"];
_control = [_gang_area, "control"] call A_object_fnc_getVariable;
if (UNDEFINED(_control)) exitWith {""};
if (typeName _control != "STRING") exitWith {""};

if (UNDEFINED(_control)) exitWith {null};
_control
