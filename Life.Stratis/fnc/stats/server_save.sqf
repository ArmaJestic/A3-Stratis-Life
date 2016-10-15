// A_stats_fnc_server_save
//Method intended to be run on server-side, it is used for saving SERVER specific variables (can be run on client side as well)
//Arguments are [key,value]

#include "header.h"


params[["_variable",null,[""]], ["_value",null]];

if (UNDEFINED(_variable)) exitWith {null};
if (UNDEFINED(_value)) exitWith {null};

[VAR_SERVER_UID, _variable, _value] call A_stats_fnc_save;