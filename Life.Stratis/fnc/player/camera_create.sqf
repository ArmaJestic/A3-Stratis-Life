// A_player_fnc_camera_create

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

private["_pos"];
_pos = (getPosATL _player);
_camera = "camera" camCreate [(_pos select 0), (_pos select 1), ((_pos select 2) + 3)];
_camera cameraEffect ["Internal", "LEFT"];
_camera setPos _pos;
_camera camSetFoV 1;
showCinemaBorder false;
[_player, "self_camera", _camera] call A_object_fnc_setVariable;

//hook for disabling camera when player dies
[] spawn { 
	waitUntil {not(alive player)};
	[player] call A_player_fnc_camera_destroy;
};
_camera
