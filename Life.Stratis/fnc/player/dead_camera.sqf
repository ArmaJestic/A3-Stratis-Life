// A_player_fnc_dead_camera

#include "../../includes/macro.h"


if (defined(player_rejoin_suicide_active)) exitWith {
	player_rejoin_suicide_active = nil;
};

ARGV(0,_player);

if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_pos"];


_pos = (getPosATL _player);
_camera = "camera" camCreate [(_pos select 0), (_pos select 1), ((_pos select 2) + 3)];
_camera camPrepareTarget player;
_camera cameraEffect ["Internal", "LEFT"];

if (not((_pos select 2) > 5000 || ((_pos select 1) < -1000))) then {
	_camera camPreparePos [(_pos select 0), (_pos select 1), ((_pos select 2) + 40)];
};
_camera camPrepareFOV 1;

if (not(sunOrMoon > 0)) then {
	camUseNVG true;
};
 
_camera camCommitPrepared 10;
_blackOut_message = call A_player_fnc_dead_camera_blackout_message;
cutText [_blackOut_message, "black out", 9.5];
waitUntil { camCommitted _camera };


//DESTROY THE CAMERA
camDestroy _camera;
camUseNVG false;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 5;