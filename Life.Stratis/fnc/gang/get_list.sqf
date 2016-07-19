// A_gang_fnc_get_list

#include "../../includes/macro.h"


private["_gangs_list"];
_gangs_list = server getVariable "gangs_list";
if (undefined(_gangs_list)) exitWith {[]};
if (typeName _gangs_list != "ARRAY") exitWith {[]};
(_gangs_list)
