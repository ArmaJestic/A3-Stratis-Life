// A_doors_fnc_house_owner_uid

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_object);
if (undefined(_object)) exitWith {null};
(_object getVariable ["owner_uid", null])
