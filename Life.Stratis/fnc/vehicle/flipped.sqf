// A_vehicle_fnc_flipped

#include "header.h"


ARGV(0,_vehicle);
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {};

private["_pos"];
_pos = getPos _vehicle;

private["_snormal", "_vnormal"];
_snormal = surfaceNormal _pos;
_vnormal = vectorUp _vehicle;

private["_angle"];
_angle = [_snormal, _vnormal] call A_vector_fnc_angle;

//player groupChat format["_angle = %1", _angle];
(_angle > 15)
