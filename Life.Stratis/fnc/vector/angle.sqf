// A_vector_fnc_angle
#include "../../includes/constants.h"
#include "../../includes/macro.h"

ARGV(0,_v1);
ARGV(1,_v2);

_v1m = [_v1] call A_vector_fnc_magnitude;
_v2m = [_v2] call A_vector_fnc_magnitude;
_vdp = [_v1, _v2] call A_vector_fnc_dotp;

private["_m"];
_m = (_v1m * _v2m);
if (_m == 0) exitWith {0};

(acos(_vdp / _m))
