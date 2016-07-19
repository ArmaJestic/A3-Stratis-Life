// A_camera_fnc_vectorDir2heading

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_vectorDir2heading %1", _this];
ARGV(0,_vectorDir);

private["_vecdz", "_vecdy", "_vecdx"];
_vecdx = _vectorDir select 0;
_vecdy = _vectorDir select 1;
_vecdz = _vectorDir select 2;

private["_angle"];
_angle = asin(_vecdz);
_direction = asin(_vecdx / cos(_angle)); 

_angle = if (_angle < 0) then {360 - abs(_angle)} else {_angle};
_direction = if (_direction < 0) then {360 - abs(_direction)} else {_direction};

private["_heading"];
_heading = [_direction, _angle, 0];

//player groupChat format["_convert = %1", _heading];
_heading	
