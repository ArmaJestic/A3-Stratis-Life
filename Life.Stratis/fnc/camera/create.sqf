// A_camera_fnc_create

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {};

private["_pos"];
_pos = (getPosATL _player);
_camera = "camera" camCreate [(_pos select 0), (_pos select 1), ((_pos select 2) + 3)];
_camera cameraEffect ["Internal", "LEFT"];
_camera setPos _pos;
_camera camSetFoV 1;
_camera camPrepareFocus [-1,-1];
_camera camCommitPrepared 0;

showCinemaBorder false;
cameraEffectEnableHUD true;
clearRadio;
enableRadio true;
//_camera camCommand "MANUAL ON";
_camera camCommand "INERTIA OFF";

[_player, "camera", _camera] call A_object_fnc_setVariable;
[_player, "A_camera_fnc_target", null] call A_object_fnc_setVariable;
[_player, null] call A_camera_fnc_set_heading;
[_player, null] call A_camera_fnc_set_position;
[_player] call A_camera_fnc_map_close;
[_player, 0] call A_camera_fnc_set_velocity;
[_player, 1] call A_camera_fnc_set_max_velocity;



//hook for disabling camera when player dies
[_camera,_player] spawn {
	ARGV(0,_camera);
	ARGV(1,_player);
	
	[[_player, false], "A_camera_fnc_camere_allowDamage", true, false] call BIS_fnc_MP;
	[_camera] call A_camera_fnc_create_rabbit;
	selectPlayer camera_rabbit;
	camera_unit globalChat format["waiting!"];
	waitUntil {
		(not(alive _player) || (isNull ([_player, "camera", objNull] call A_object_fnc_getVariable)))
	};
	selectPlayer _player;
	[[_player, true], "A_camera_fnc_camere_allowDamage", true, false] call BIS_fnc_MP;
	camera_rabbit setDamage 1;
	[camera_rabbit] call A_player_fnc_despawn;
	[_player] call A_camera_fnc_destroy;
};

_camera
