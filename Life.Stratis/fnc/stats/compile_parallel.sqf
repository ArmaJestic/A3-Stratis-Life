// A_stats_fnc_compile_parallel

#include "..\..\includes\macro.h"

private["_data", "_object"];
_data = _this select 0;
_object = _this select 1;
[_data, _object, false, false] call A_stats_fnc_compile;
