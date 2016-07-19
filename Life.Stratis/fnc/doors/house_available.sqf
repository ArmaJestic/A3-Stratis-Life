// A_doors_fnc_house_available

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_object);

private["_owner_uid"];
_owner_uid = [_object] call A_doors_fnc_house_owner_uid;
(undefined(_owner_uid))
