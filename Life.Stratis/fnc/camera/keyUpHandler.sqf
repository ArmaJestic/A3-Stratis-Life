// A_camera_fnc_keyUpHandler

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_keyUpHandler %1", _this];
ARGV(0,_this);

ARGV(0,_display);
ARGV(1,_key);
ARGV(2,_shift);
ARGV(3,_control);
ARGV(4,_alt);

private["_player", "_left_click_target"];
_player = camera_unit;
_left_click_target = [_player] call A_camera_fnc_get_left_click_target;

[false, _key] call A_camera_fnc_update_key_tracker;

if (_shift) then {
	A_camera_var_shift_held = false;
	[_left_click_target] call A_camera_fnc_reset_target_offsets;
};

if (_control) then {
	A_camera_var_control_held = false;
};

if (_alt) then {
	A_camera_var_alt_held = false;
	[_left_click_target] call A_camera_fnc_reset_target_offsets;
};

if (_key == DIK_LWIN) then {
	[_left_click_target] call A_camera_fnc_reset_target_offsets;
	A_camera_var_lwin_held = false;
};

if (_key == DIK_SPACE) then {
	A_camera_var_space_held = false;
	A_camera_var_space_hold_reset = false;
};

if (_key == DIK_T && {!(isNull _left_click_target)}) then {
	private["_tracked"];
	_tracked = _left_click_target getVariable ["tracked", false];
	_tracked = !(_tracked);
	_left_click_target setVariable ["tracked", _tracked, true];
	
	private["_in_list"];
	_in_list = _left_click_target in A_camera_var_tracked_objects;
	if (!(_tracked) && {_in_list}) then {
		A_camera_var_tracked_objects = A_camera_var_tracked_objects - [_left_click_target];
	};
	
	if (_tracked && {!(_in_list)}) then {
		A_camera_var_tracked_objects = A_camera_var_tracked_objects + [_left_click_target];
	};
};

if (_key == DIK_E) then {
	[player] call A_camera_fnc_export_tracked;
};

if (_key == DIK_R && !(undefined(_left_click_target))) then {
	A_camera_var_export_reference_object = _left_click_target;
};

if (_key == DIK_J) then {
	private["_damage"];
	_damage = _left_click_target getVariable ["damage", false];
	_damage = !(_damage);
	_left_click_target setVariable ["damage", _damage, true];
};

if (_key == DIK_K) then {
	private["_simulation"];
	_simulation = simulationEnabled _left_click_target;
	_simulation = !(_simulation);
	_left_click_target enableSimulation _simulation;
};

if (_key == DIK_L) then {
	private["_objects"];
	_objects = [_left_click_target];
	_objects = _objects - [objNull];
	[_player, _objects] call A_camera_menu_fnc_create;
};

if (_key == DIK_H) then {
	private["_hidden"];
	_hidden = [_left_click_target, "hidden", false] call A_object_fnc_getVariable;
	_hidden = !(_hidden);
	[_left_click_target, "hidden", _hidden, true] call A_object_fnc_setVariable;
};

if (_key == DIK_G) then {
	private["_attached"];
	_attached = [_left_click_target, "attached", false] call A_object_fnc_getVariable;
	_attached = !(_attached);
	[_left_click_target, "attached", _attached, true] call A_object_fnc_setVariable;
};

if ((_key in (actionKeys "MoveForward") || 
	_key in (actionKeys "MoveBack") ||
	_key in (actionKeys "TurnLeft") ||
	_key in (actionKeys "TurnRight") ||
	_key in (actionKeys "HeliUp") ||
	_key in (actionKeys "HeliDown")) &&
	(count(A_camera_var_key_tracker) == 0)) then {
	[_player, 0] call A_camera_fnc_set_velocity;
};

false
