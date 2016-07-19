// A_flag_pole_fnc_flag_at_min_z

#include "..\..\includes\macro.h"


ARGV(0,_pole);
if (undefined(_pole)) exitWith {false};
if (typeName _pole != "ARRAY") exitWith {false};


private["_min_z", "_offset", "_z_offset"];
_offset = _pole select A_flag_pole_var_flag_object_offset;
_z_offset = _offset select 2;
_min_z = _pole select A_flag_pole_var_min_z;

(_z_offset <= _min_z)
