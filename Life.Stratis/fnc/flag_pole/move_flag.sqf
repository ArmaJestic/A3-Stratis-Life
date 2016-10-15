// A_flag_pole_fnc_move_flag

#include "header.h"


params[["_pole",null,[[]]],["_amount",null,[0]]];
if (UNDEFINED(_pole)) exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};


private _mast = _pole select INDEX_MAST_OBJECT;
private _flag = _pole select INDEX_FLAG_OBJECT;
private _max_z = _pole select INDEX_MAX_Z;
private _min_z = _pole select INDEX_MIN_Z;

private _offset = _pole select INDEX_FLAG_OFFSET;
private _z_offset = _offset select 2;

private _new_z = _z_offset + _amount;

if (_new_z < _min_z) then {
	_new_z = _min_z;
};

if (_new_z > _max_z) then {
	_new_z = _max_z;
};

_offset set [2, _new_z];

_flag attachTo [_mast, _offset];