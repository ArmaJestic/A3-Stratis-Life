// A_camera_fnc_enabled

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


private["_player"];
ARGV(0,_player);

private["_camera"];
_camera = [_player, "camera"] call A_object_fnc_getVariable;
!(undefined(_camera))
