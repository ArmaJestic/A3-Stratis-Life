// A_vector_fnc_angle
#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params["_v1","_v2"];

private _v1m = [_v1] call A_vector_fnc_magnitude;
private _v2m = [_v2] call A_vector_fnc_magnitude;
private _vdp = [_v1, _v2] call A_vector_fnc_dotp;

private _m = (_v1m * _v2m);
if (_m == 0) exitWith {0};

(acos(_vdp / _m))