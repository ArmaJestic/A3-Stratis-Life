// A_camera_fnc_MouseZChanged_handler

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


//player groupChat format["A_camera_fnc_MouseZChanged_handler %1", _this];
ARGV(0,_this);
private["_player"];
_player = camera_unit;

ARGV(1,_zc);

private["_left_click_target"];
_left_click_target = [_player] call A_camera_fnc_get_left_click_target;
if (not(isNull _left_click_target)) exitWith {
	_zc = _zc / (abs(_zc));
	[_player, 0,0,_zc] call A_camera_fnc_update_left_click_target;
};

private["_velocity"]; 
_velocity = [_player] call A_camera_fnc_get_max_velocity;
_velocity = if (_zc > 0) then {_velocity + 0.1} else {_velocity - 0.1};
_velocity = (_velocity) min (5);
_velocity = (_velocity) max (0);
_velocity = (round(_velocity * 100) / 100);
//player groupChat format["Camera max velocity set at %1", _velocity];
[_player, _velocity] call A_camera_fnc_set_max_velocity;

true
