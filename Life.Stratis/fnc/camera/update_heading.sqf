// A_camera_fnc_update_heading

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_xc);
ARGV(2,_yc);;

private["_heading"];
_heading = [_player] call A_camera_fnc_get_heading;

private["_dir"];
_dir = _heading select 0;
_dir = _dir + _xc;
_dir = if (_dir > 360) then { _dir - 360 } else { _dir };
_dir = if (_dir < 0) then { 360 - abs(_dir) } else { _dir};

private["_angle"];
_angle = _heading select 1;
_angle = if (undefined(_angle)) then {0} else {_angle};
_angle =  _angle - _yc;
_angle = if (_angle > 360) then { _angle - 360 } else { _angle };
_angle = if (_angle < 0) then { 360 - abs(_angle) } else { _angle};

private["_bank"];
_bank = _heading select 2;

_heading = [_dir, _angle, _bank];
//player groupChat format["_update_heading = %1", _heading];
[_player, _heading] call A_camera_fnc_set_heading;
