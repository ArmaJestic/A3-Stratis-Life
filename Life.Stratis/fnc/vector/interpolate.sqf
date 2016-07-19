// A_vector_fnc_interpolate
#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

private["_v1", "_v2", "_p"];
_v1 = _this select 0;
_v2 = _this select 1;
_p = _this select 2;
private["_V1x", "_V1y", "_V1z", "_V2x", "_V2y", "_V2z"];
_V1x = _v1 select 0;
_V1y = _v1 select 1;
_V1z = _v1 select 2;

_V2x = _v2 select 0;
_V2y = _v2 select 1;
_V2z = _v2 select 2;

[ (_V1x + ((_V2x - _V1x)*_p)), (_V1y + ((_V2y - _V1y)*_p)),  (_V1z + ((_V2z - _V1z)*_p))]
