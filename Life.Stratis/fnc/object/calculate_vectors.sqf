// A_object_fnc_calculate_vectors

#include "..\..\includes\macro.h"


diag_log format['A_object_fnc_calculate_vectors(%1): starting',_this];
params["_data"];
_data params["_direction","_angle","_pitch"];

diag_log format['A_object_fnc_calculate_vectors(%1): _data-%2, _direction-%3, _angle-%4, _pitch-%5',_this,_data,_direction,_angle,_pitch];

// direction (yaw)
// angle (bank/roll)
// pitch (pitch)

private _vecdx = sin(_direction) * cos(_angle);
private _vecdy = cos(_direction) * cos(_angle);
private _vecdz = sin(_angle);

private _vecux = cos(_direction) * cos(_angle) * sin(_pitch);
private _vecuy = sin(_direction) * cos(_angle) * sin(_pitch);
private _vecuz = cos(_angle) * cos(_pitch);

private _dir_vector = [_vecdx,_vecdy,_vecdz];
private _up_vector = [_vecux,_vecuy,_vecuz];

([_dir_vector, _up_vector])