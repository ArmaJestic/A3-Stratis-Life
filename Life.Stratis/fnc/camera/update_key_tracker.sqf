// A_camera_fnc_update_key_tracker

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_down);
ARGV(1,_key);

if (not(_key in (actionKeys "MoveForward") || 
	_key in (actionKeys "MoveBack") ||
	_key in (actionKeys "TurnLeft") ||
	_key in (actionKeys "TurnRight") ||
	_key in (actionKeys "HeliUp") ||
	_key in (actionKeys "HeliDown"))) exitWith {};

if (_down && {(A_camera_var_key_tracker find _key) == -1}) then {
	A_camera_var_key_tracker set [count(A_camera_var_key_tracker), _key];
};

if (not(_down) && {(A_camera_var_key_tracker find _key) >= 0}) then {
	A_camera_var_key_tracker = A_camera_var_key_tracker - [_key];
};
