// A_vector_fnc_resize
#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

private["_v1", "_len"];
_v1 = _this select 0;
_len = _this select 1;

private["_n"];
_n = [_v1] call A_vector_fnc_normalize;
([(_n select 0)*(_len), (_n select 1)*(_len), (_n select 2)*(_len)])
