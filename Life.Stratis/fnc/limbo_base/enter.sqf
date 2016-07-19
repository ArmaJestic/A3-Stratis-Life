// A_limbo_base_fnc_enter

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (not(isClient)) exitWith {};
ARGV(0,_player);

if (not([_player] call A_object_fnc_exists)) exitWith {};

private["_respawn"];
_respawn = respawn_limbo_proxy;

	
private["_rad", "_dir"];
_rad = 8;
_rad = (random _rad);
_dir = random(360);

private["_pos"];
_pos = _respawn modelToWorld [0,0,0];
	
//convert from polar coordinates to X, Y
private["_xr", "_yr"];
_xr = _rad * cos(_dir);
_yr = _rad * sin(_dir);


detach _player;	
_player attachTo [_respawn, [_xr,_yr,0.1]];
detach _player;
private["_animation"];
_animation = "amovpercmstpsnonwnondnon";

_player playMoveNow _animation; //(don't do this one inside the loop, because it's sent across the network)
waitUntil {
	_player switchMove _animation;
	((animationState _player) == _animation)
};

