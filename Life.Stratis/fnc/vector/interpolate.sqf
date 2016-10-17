// A_vector_fnc_interpolate
#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params["_v1","_v2","_p"];

_v1 params["_v1x","_v1y","_v1z"];
_v2 params["_v2x","_v2y","_v2z"];

[(_v1x + ((_v2x - _v1x)*_p)), (_v1y + ((_v2y - _v1y)*_p)),  (_v1z + ((_v2z - _v1z)*_p))]