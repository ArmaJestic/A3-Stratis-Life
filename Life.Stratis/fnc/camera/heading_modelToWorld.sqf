// A_camera_fnc_heading_modelToWorld

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_target);
ARGV(1,_heading);

//player groupChat format["_heading2_before = %1", _heading];
private["_tdir"];
_tdir = getDir _target;

private["_dir"];
_dir = _heading select 0;
_dir = _dir + _tdir;
_dir = if (_dir > 360) then { _dir - 360 } else { _dir };
_heading set [0, _dir];
//player groupChat format["_heading2_after = %1", _heading];
_heading
