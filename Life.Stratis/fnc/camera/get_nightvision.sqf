// A_camera_fnc_get_nightvision

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);

private["_nightvision"];
_nightvision = [_player, "camera_nightvision"] call A_object_fnc_getVariable;
_nightvision = if (UNDEFINED(_nightvision)) then {0} else {_nightvision};
_nightvision
