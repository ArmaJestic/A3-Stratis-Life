// A_trunk_fnc_user

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);

private["_cname"];
_cname = [_vehicle, "trunk_user_name"] call A_object_fnc_getVariable;

if (undefined(_cname)) exitWith { "Unknown-A" };
if (typeName _cname != "STRING") exitWith { "Unknown-B" };
_cname
