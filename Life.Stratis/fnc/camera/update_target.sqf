// A_camera_fnc_update_target

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_key);
ARGV(2,_shift);

private["_target", "_previous_target"];
_target =  [_player, "A_camera_fnc_target"] call A_object_fnc_getVariable;
_previous_target = _target;

private["_handled"];
_handled = false;
if (_shift && _key in (actionKeys "NextChannel")) then {
	_target = [+1, _target] call A_camera_fnc_next_target;
	camera_unit groupChat format["Camera target set to %1-%2", _target, (name _target)];
	private["_pos"];
	_pos = if (UNDEFINED(_previous_target)) then {null} else {[_player] call A_camera_fnc_get_position};
	[_player, _pos] call A_camera_fnc_set_position;
	
	private["_heading"];
	_heading = if (UNDEFINED(_previous_target)) then {[0,0,0]} else {[_player] call A_camera_fnc_get_heading};
	[_player, _heading] call A_camera_fnc_set_heading;
	
	_handled = true;
};

if (_shift && _key in (actionKeys "PrevChannel")) then {
	_target = [-1, _target] call A_camera_fnc_next_target;
	camera_unit groupChat format["Camera target set to %1-%2", _target, (name _target)];
	private["_pos"];
	_pos = if (UNDEFINED(_previous_target)) then {null} else {[_player] call A_camera_fnc_get_position};
	[_player, _pos] call A_camera_fnc_set_position;
	
	private["_heading"];
	_heading = if (UNDEFINED(_previous_target)) then {[0,0,0]} else {[_player] call A_camera_fnc_get_heading};
	[_player, _heading] call A_camera_fnc_set_heading;
	
	_handled = true;
};

if (_shift && _key in (actionKeys "Chat")) then {
	camera_unit groupChat format["Detaching form camera target"];

	detach _camera;
	[_player, "A_camera_fnc_target", null] call A_object_fnc_setVariable;
	
	private["_heading"];
	_heading = if (UNDEFINED(_previous_target)) then {null} else {[_previous_target, ([_player] call A_camera_fnc_get_heading)] call A_camera_fnc_heading_modelToWorld;};
	[_player, _heading] call A_camera_fnc_set_heading;
	
	private["_pos"];
	_pos = if (UNDEFINED(_previous_target)) then {null} else {_previous_target modelToWorld ([_player] call A_camera_fnc_get_position)};
	[_player, _pos] call A_camera_fnc_set_position;
	
	_handled = true;
};

_handled
