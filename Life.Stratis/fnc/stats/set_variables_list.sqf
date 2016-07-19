// A_stats_fnc_set_variables_list

#include "..\..\includes\macro.h"

private["_object", "_variables_list"];
_object = _this select  0;
_variables_list = _this select 1;

if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};
if (undefined(_variables_list)) exitWith {null};
if (typeName _variables_list != "ARRAY") exitWith {null};

[_object, "stats_variables_list", _variables_list] call A_object_fnc_setVariable;
