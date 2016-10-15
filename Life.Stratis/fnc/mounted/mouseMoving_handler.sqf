// A_mounted_fnc_mouseMoving_handler

#include "header.h"


ARGV(1,_data);
ARGV(0,_this);

ARGV(1,_mouse_delta);
ARGV(2,_mouse_y_delta);

//player groupChat format["_mouse_y_delta = %1", _mouse_y_delta];
private["_player", "_vehicle", "_slot_id", "_r_delta", "_y_delta"];
_r_delta = abs(_mouse_delta);
_y_delta = abs(_mouse_y_delta);
_player = _data select 0;

if (dialog) exitWith {null};
if (A_input_var_lookingaround) exitWith {null};

if ([_player] call A_camera_fnc_enabled) exitWith {null};

private ["_direction", "_heading", "_direction_min", "_direction_max", "_angle_min", "_angle_max"];

_direction_min = _data select 3;
_direction_max = _data select 4;
_pitch_min = _data select 5;
_pitch_max = _data select 6;
	
_heading = [_player, "heading"] call A_object_fnc_getVariable;
if (UNDEFINED(_heading)) then {
	_heading = [(getDir _player),0,0];
	[_player, "heading", _heading] call A_object_fnc_setVariable;
};

_direction = _heading select 0;
//player groupChat format["_direction = %1", _direction];

private["_changed"];
_changed = false;

if (_mouse_delta >= 0) then {
	_direction = _direction + _r_delta;
	
	if (_direction >= _direction_max) then {
		_direction = _direction_max;
	};
	
	if (_direction > 360 ) then {
		_direction = (_direction - 360);
	};
	_heading set[0, _direction];
	[_player, "heading", _heading] call A_object_fnc_setVariable;
	_changed = true;
};

if (_mouse_delta <= 0) then {
	_direction = _direction - _r_delta;
	
	if (_direction <= _direction_min) then {
		_direction = _direction_min;
	};
	
	if ( _direction < 0 ) then {
		_direction = 360 + _direction;
	};
	_heading set [0, _direction];
	[_player, "heading", _heading] call A_object_fnc_setVariable;
	_changed = true;
};


private["_pitch"];
_pitch = _heading select 1;
if (UNDEFINED(_pitch)) then {
	_pitch = 45;
};

if (_mouse_y_delta < 0) then {
	_pitch = _pitch + abs(_mouse_y_delta);
	
	if (_pitch >= _pitch_max) then {
		_pitch = _pitch_max;
	};
	
	_heading set [1, _pitch];
	[_player, "heading", _heading] call A_object_fnc_setVariable;
	_changed = true;
};

if (_mouse_y_delta > 0) then {

	if (_pitch <= _pitch_min) then {
		_pitch = _pitch_min;
	};
	
	_pitch = _pitch - abs(_mouse_y_delta);
	_heading set [1, _pitch];
	[_player, "heading", _heading] call A_object_fnc_setVariable;
	_changed = true;
};

if (_changed) then {
	[_player, _heading] call A_mounted_fnc_set_heading;
};

false
