// A_pos_fnc_angle_sector

#include "../../includes/macro.h"


private["_dir1","_dir2","_dir3","_small","_large","_x","_y","_r"];
_r = false;

_small = (_this select 1) - ((_this select 2) / 2);
_large = (_this select 1) + ((_this select 2) / 2);

_x = ((_this select 3) select 0) - ((_this select 0) select 0);
_y = ((_this select 3) select 1) - ((_this select 0) select 1);

_dir1 = _x atan2 _y;

if (_dir1 < 0) then {_dir1 = _dir1 + 360};

_dir2 = _dir1 - 360;
_dir3 = _dir1 + 360;

if ((_dir1 >= _small && _dir1 <= _large) ||
	(_dir2 >= _small && _dir2 <= _large) || 
	(_dir3 >= _small && _dir3 <= _large)) then {
	_r = true
};
_r
