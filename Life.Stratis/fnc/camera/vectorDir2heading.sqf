// A_camera_fnc_vectorDir2heading

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


params["_vectorDir"];
_vectorDir params["_vecdx","_vecdy","_vecdz"];

private _angle = asin(_vecdz);
_angle = if (_angle < 0) then {360 - abs(_angle)} else {_angle};

private _direction = asin(_vecdx / cos(_angle));
_direction = if (_direction < 0) then {360 - abs(_direction)} else {_direction};

private _heading = [_direction, _angle, 0];

_heading