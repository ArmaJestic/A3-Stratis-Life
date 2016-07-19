// A_object_fnc_calcualte_vectors

#include "..\..\includes\macro.h"


ARGV(0,_data);
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

private["_dir_vector"];
private["_up_vector"];
_dir_vector = [_vecdx,_vecdy,_vecdz];
_up_vector = [_vecux,_vecuy,_vecuz];

([_dir_vector, _up_vector])
