// A_gang_fnc_set_list

#include "header.h"


ARGV(0,_gangs_list);
if (UNDEFINED(_gangs_list)) exitWith {null};
if (typeName _gangs_list != "ARRAY") exitWith {null};
server setVariable["gangs_list", _gangs_list, true];
