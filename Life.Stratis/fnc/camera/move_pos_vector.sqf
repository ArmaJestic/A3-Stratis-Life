// A_camera_fnc_move_pos_vector

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_pos);
ARGV(1,_data);
ARGV(2,_velocity);

private["_direction", "_angle", "_pitch"];
_direction = _data select 0;
_angle = _data select 1;
_pitch = _data select 2;

_vecdx = (sin(_direction) * cos(_angle)) * _velocity;
_vecdy = (cos(_direction) * cos(_angle)) * _velocity;
_vecdz = (sin(_angle)) * _velocity;

_pos = [((_pos select 0) + _vecdx), ((_pos select 1) + _vecdy), ((_pos select 2) + _vecdz)];
_pos
