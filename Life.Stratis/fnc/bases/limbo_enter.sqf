// A_bases_fnc_limbo_enter

#include "header.h"


params["_player"];

if (!([_player] call A_object_fnc_exists)) exitWith {};

private _respawn = respawn_limbo_proxy;
private _rad = 8;
_rad = (random _rad);
private _dir = random(360);

private _pos = _respawn modelToWorld [0,0,0];
	
//convert from polar coordinates to X, Y
private _xr = _rad * cos(_dir);
private _yr = _rad * sin(_dir);


detach _player;	
_player attachTo [_respawn, [_xr,_yr,0.1]];
detach _player;

private _animation = "amovpercmstpsnonwnondnon";

 //(don't do this one inside the loop, because it's sent across the network)
_player playMoveNow _animation;
waitUntil {
	_player switchMove _animation;
	((animationState _player) == _animation)
};