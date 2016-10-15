// A_doors_fnc_house_available

#include "header.h"


ARGV(0,_object);

private["_owner_uid"];
_owner_uid = [_object] call A_doors_fnc_house_owner_uid;
(UNDEFINED(_owner_uid))
