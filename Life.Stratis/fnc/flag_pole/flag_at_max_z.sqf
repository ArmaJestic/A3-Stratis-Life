// A_flag_pole_fnc_flag_at_max_z

#include "header.h"


params[["_pole",null,[[]]]];
if (UNDEFINED(_pole)) exitWith {false};

private _offset = _pole select INDEX_FLAG_OFFSET;
private _z_offset = _offset select 2;
private _max_z = _pole select INDEX_MAX_Z;
(_z_offset >= _max_z)