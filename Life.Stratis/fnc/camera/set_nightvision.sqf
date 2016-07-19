// A_camera_fnc_set_nightvision

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_nightvision);

[_player, "camera_nightvision", _nightvision] call A_object_fnc_setVariable;
(_nightvision)
