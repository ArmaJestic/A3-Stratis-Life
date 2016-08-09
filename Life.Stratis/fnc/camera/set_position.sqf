// A_camera_fnc_set_position

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_position);

[_player, _position] call A_camera_fnc_save_position;
_position = [_player] call A_camera_fnc_get_position;

private["_target"];
_target = [_player, "A_camera_fnc_target"] call A_object_fnc_getVariable;

private["_camera"];
_camera = [_player, "camera"] call A_object_fnc_getVariable;
if (undefined(_camera)) exitWith {null};

if (undefined(_target)) then {
	_camera setPos _position;
	//_camera camSetPos _position;
	//_camera camCommit 0.3;
}else{
	_camera attachTo [(vehicle _target), _position];
};

if (undefined(camera_rabbit)) exitWith {};
camera_rabbit attachTo [_camera, [0,0,0]];
