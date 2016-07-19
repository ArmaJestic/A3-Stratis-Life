// A_camera_fnc_heading2vectors

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_heading);

private["_direction", "_angle", "_bank"];
_direction = _heading select 0;
_angle = _heading select 1;
_bank = _heading select 2;

_vecdx = sin(_direction) * cos(_angle);
_vecdy = cos(_direction) * cos(_angle);
_vecdz = sin(_angle);

_vecux = cos(_direction) * cos(_angle) * sin(_bank);
_vecuy = sin(_direction) * cos(_angle) * sin(_bank);
_vecuz = cos(_angle) * cos(_bank);

([ [_vecdx,_vecdy,_vecdz], [_vecux,_vecuy,_vecuz] ])
