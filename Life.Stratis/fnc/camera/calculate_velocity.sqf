// A_camera_fnc_calculate_velocity

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_shift);

private["_velocity", "_max_velocity", "_delta"];
_delta = 0.05;

_velocity = [_player] call A_camera_fnc_get_velocity;
_max_velocity = [_player] call A_camera_fnc_get_max_velocity;

if (_velocity < _max_velocity) then {
	_velocity = (_velocity + _delta);
	_velocity = (_velocity) min (_max_velocity);
} 
else {
	_velocity = (_velocity - _delta);
	_velocity = (_velocity) max (_max_velocity);
};

[_player, _velocity] call A_camera_fnc_set_velocity;
private["_left_click_target"];
_left_click_target = [_player] call A_camera_fnc_get_left_click_target;
_velocity = if (_shift && {isNull _left_click_target}) then {_velocity + 5} else {_velocity};
(_velocity)
