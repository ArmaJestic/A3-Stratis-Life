// A_camera_fnc_update_left_click_target

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_xc);
ARGV(2,_yc);
ARGV(3,_zc);


private["_left_click_target"];
_left_click_target = [_player] call A_camera_fnc_get_left_click_target;
if (isNull(_left_click_target)) exitWith {false};

if (A_camera_var_control_held) exitWith {	
	private["_offset"];
	_offset = [_left_click_target, "offset"] call A_object_fnc_getVariable;
	if (undefined(_offset)) then {
		_offset = _left_click_target modelToWorld [0,0,0];
	};
	
	private["_heading"];
	_heading = [_left_click_target, "heading"] call A_object_fnc_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _left_click_target),0,0];
	};
	
	private["_angle"];
	_angle = (_heading select 1) + _yc;
	_heading set [1, _angle];
	
	[_left_click_target, _offset, _heading] call A_camera_fnc_fake_setPos;
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	[_left_click_target, "heading", _heading] call A_object_fnc_setVariable;
	
	true
};


if (A_camera_var_lwin_held) exitWith {
	private["_offset"];
	_offset = [_left_click_target, "offset"] call A_object_fnc_getVariable;
	if (undefined(_offset)) then {
		_offset = _left_click_target modelToWorld [0,0,0];
	};
	
	
	private["_heading"];
	_heading = [_left_click_target, "heading"] call A_object_fnc_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _left_click_target),0,0];
	};
	
	private["_angle"];
	_angle = (_heading select 2) + _yc;
	_heading set [2, _angle];
	

	[_left_click_target, _offset, _heading] call A_camera_fnc_fake_setPos;
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	[_left_click_target, "heading", _heading] call A_object_fnc_setVariable;
	
	
	true
};

if (A_camera_var_alt_held) exitWith {
	private["_offset"];
	_offset = [_left_click_target, "offset"] call A_object_fnc_getVariable;
	if (undefined(_offset)) then {
		_offset = _left_click_target modelToWorld [0,0,0];
	};
	
	private["_heading"];
	_heading = [_left_click_target, "heading"] call A_object_fnc_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _left_click_target),0,0];
	};
	
	
	private["_direction"];
	_direction = (_heading select 0) + _yc;
	_heading set [0, _direction];
	

	[_left_click_target, _offset, _heading] call A_camera_fnc_fake_setPos;
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	[_left_click_target, "heading", _heading] call A_object_fnc_setVariable;
	
	
	true
};

if (A_camera_var_shift_held) exitWith {
	private["_offset"];
	_offset = [_left_click_target, "offset"] call A_object_fnc_getVariable;
	if (undefined(_offset)) then {
		_offset = _left_click_target modelToWorld [0,0,0];
	};

	//player groupChat format["_zc = %1", _zc];
	_offset = [(_offset select 0), (_offset select 1), ((_offset select 2) - _yc - (_zc / 100))];
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	//_left_click_target setPos _offset;
	
	
	private["_heading"];
	_heading = [_left_click_target, "heading"] call A_object_fnc_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _left_click_target),0,0];
	};
	

	[_left_click_target, _offset, _heading] call A_camera_fnc_fake_setPos;
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	[_left_click_target, "heading", _heading] call A_object_fnc_setVariable;
	
	true
};


if (_zc != 0) exitWith {
	private["_offset"];
	_offset = [_left_click_target, "offset"] call A_object_fnc_getVariable;
	if (undefined(_offset)) then {
		_offset = _left_click_target modelToWorld [0,0,0];
		player groupChat format["Getting it!"];
	};

	//player groupChat format["_zcz = %1", _zc];
	_offset = [(_offset select 0), (_offset select 1), ((_offset select 2) - _yc - (_zc / 100))];
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	//_left_click_target setPos _offset;
	
	
	private["_heading"];
	_heading = [_left_click_target, "heading"] call A_object_fnc_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _left_click_target),0,0];
	};
	

	[_left_click_target, _offset, _heading] call A_camera_fnc_fake_setPos;
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	[_left_click_target, "heading", _heading] call A_object_fnc_setVariable;
	
	true
};


if (A_camera_var_space_held) exitWIth {
	private["_pos", "_offset"];
	_pos = [_left_click_target] call A_camera_fnc_plane_intersect;
	_offset = [((_pos select 0) - offset_x ), ((_pos select 1) - offset_y), ((_pos select 2) - offset_z)];

	private["_heading"];
	_heading = [_left_click_target, "heading"] call A_object_fnc_getVariable;
	if (undefined(_heading)) then {
		_heading = [(getDir _left_click_target),0,0];
	};
	
	[_left_click_target, _offset, _heading] call A_camera_fnc_fake_setPos;
	[_left_click_target, "offset", _offset] call A_object_fnc_setVariable;
	[_left_click_target, "heading", _heading] call A_object_fnc_setVariable;
	false
};

false
