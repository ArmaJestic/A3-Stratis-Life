// A_camera_fnc_create_rabbit

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_camera);
camera_rabbit = (group player) createUnit ["B_UAV_AI",  (getPos _camera), [], 0, "FORM"];
camera_rabbit attachTo [_camera, [0,0,0]];
camera_rabbit setVehicleVarName "camera_rabbit";
