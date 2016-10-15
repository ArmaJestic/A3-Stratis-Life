// A_stats_fnc_set_variables_list

#include "header.h"


params[["_object",objNull,[objNull]], ["_variables_list",null,[[]]]];

if (isNull _object) exitWith {null};
if (UNDEFINED(_variables_list)) exitWith {null};

[_object, VAR_STATS_LIST, _variables_list] call A_object_fnc_setVariable;