// A_mounted_fnc_set_heading

#include "header.h"


ARGV(0,_object);
ARGV(1,_data);

private["_direction", "_angle", "_pitch"];

_direction = _data select 0;
_angle = _data select 1;
_pitch = _data select 2;

_vecdx = sin(_direction) * cos(_angle);
_vecdy = cos(_direction) * cos(_angle);
_vecdz = sin(_angle);

_vecux = cos(_direction) * cos(_angle) * sin(_pitch);
_vecuy = sin(_direction) * cos(_angle) * sin(_pitch);
_vecuz = cos(_angle) * cos(_pitch);

[_object, "heading", _data] call A_object_fnc_setVariable;
_object setVectorDirAndUp [ [_vecdx,_vecdy,_vecdz], [_vecux,_vecuy,_vecuz] ];
