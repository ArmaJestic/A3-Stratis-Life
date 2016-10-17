// A_mounted_fnc_set_heading

#include "header.h"


params["_object","_data"];
_data params["_direction","_angle","_pitch"];

private _vecdx = sin(_direction) * cos(_angle);
private _vecdy = cos(_direction) * cos(_angle);
private _vecdz = sin(_angle);

private _vecux = cos(_direction) * cos(_angle) * sin(_pitch);
private _vecuy = sin(_direction) * cos(_angle) * sin(_pitch);
private _vecuz = cos(_angle) * cos(_pitch);

[_object, "heading", _data] call A_object_fnc_setVariable;
_object setVectorDirAndUp [ [_vecdx,_vecdy,_vecdz], [_vecux,_vecuy,_vecuz] ];