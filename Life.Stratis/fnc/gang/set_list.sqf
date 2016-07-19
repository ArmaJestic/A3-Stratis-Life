// A_gang_fnc_set_list

#include "../../includes/macro.h"


ARGV(0,_gangs_list);
if (undefined(_gangs_list)) exitWith {null};
if (typeName _gangs_list != "ARRAY") exitWith {null};
server setVariable ["gangs_list", _gangs_list, true];
