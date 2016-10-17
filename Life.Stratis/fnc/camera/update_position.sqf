// A_camera_fnc_update_position

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


params["_player","_key","_shift"];

private _position = [_player] call A_camera_fnc_get_position;
private _velocity = [_player, _shift] call A_camera_fnc_calculate_velocity;
private _heading = [_player] call A_camera_fnc_get_heading;
_heading params["_direction","_angle","_bank"];

if (_key in (actionKeys "MoveForward")) then {
	_position = [_position, [_direction, _angle, _bank], _velocity] call A_camera_fnc_move_pos_vector;
};

if (_key in (actionKeys "MoveBack")) then {
	_angle = _angle + 180;
	_angle = if (_angle > 360) then {_angle - 360} else {_angle};
	_position = [_position, [_direction, _angle, _bank], _velocity] call A_camera_fnc_move_pos_vector;
};

if (_key in (actionKeys "TurnLeft") || _key in (actionKeys "MoveLeft")) then {
	_direction = _direction - 90;
	_direction = if (_direction < 0) then { 360 - abs(_direction) } else {_direction};
	_position = [_position, [_direction, 0, _bank], _velocity] call A_camera_fnc_move_pos_vector;
};

if (_key in (actionKeys "TurnRight") || _key in (actionKeys "MoveRight")) then {
	_direction = _direction + 90;
	_direction = if (_direction > 360) then {_direction - 360} else {_direction};
	_position = [_position, [_direction, 0, _bank], _velocity] call A_camera_fnc_move_pos_vector;
};

if (_key == DIK_Q) then {
	_angle = _angle + 90;
	_angle = if (_angle > 360) then { _angle - 360 } else {_angle};
	_position = [_position, [_direction, _angle, _bank], _velocity] call A_camera_fnc_move_pos_vector;
};

if (_key == DIK_Z)  then {
	_angle = _angle - 90;
	_angle = if (_angle < 0) then { 360 - abs(_angle) } else {_angle};
	_position = [_position, [_direction, _angle, _bank], _velocity] call A_camera_fnc_move_pos_vector;
};

[_player, _position] call A_camera_fnc_set_position;
