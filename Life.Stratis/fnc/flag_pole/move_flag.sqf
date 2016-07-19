// A_flag_pole_fnc_move_flag

#include "../../includes/macro.h"


ARGV(0,_pole);
ARGV(1,_amount);
if (undefined(_pole)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _pole != "ARRAY") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

private["_max_z", "_min_z", "_mast", "_flag"];

_mast = _pole select A_flag_pole_var_mast_object;
_flag = _pole select A_flag_pole_var_flag_object;
_max_z = _pole select A_flag_pole_var_max_z;
_min_z = _pole select A_flag_pole_var_min_z;

private["_offset", "_z_offset"];
_offset = _pole select A_flag_pole_var_flag_object_offset;
_z_offset = _offset select 2;


private["_new_z"];
_new_z = _z_offset + _amount;

if (_new_z < _min_z) then {
	_new_z = _min_z;
};

if (_new_z > _max_z) then {
	_new_z = _max_z;
};

_offset set [2, _new_z];

_flag attachTo [_mast, _offset];
