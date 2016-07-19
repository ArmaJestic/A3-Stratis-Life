// A_towing_fnc_line_create_request_receive

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_variable);
ARGV(1,_this);

ARGV(0,_object);
if (undefined(_object)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};

private["_towing_line"];
_towing_line = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_towing_line hideObject true;

[_towing_line, "towing", _object] call A_towing_fnc_line_setup_endpoint;
[_towing_line, "towed", _object] call A_towing_fnc_line_setup_endpoint; 


[_towing_line] spawn A_towing_fnc_line_cleanup_wait;
