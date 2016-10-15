// A_doors_fnc_house_owner_uid

#include "header.h"


ARGV(0,_object);
if (UNDEFINED(_object)) exitWith {null};
(_object getVariable ["owner_uid", null])
