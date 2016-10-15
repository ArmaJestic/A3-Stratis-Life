// A_bases_fnc_bunker_traverse_door2

#include "header.h"


params["_player","_bunker_door_data"];

private _heading = _bunker_door_data select BUNKER_INDEX_DOOR_TARGET_HEADING;
private _offset_human = _bunker_door_data select BUNKER_INDEX_DOOR_TARGET_OFFSET_HUMAN;
private _offset_vehicle = _bunker_door_data select BUNKER_INDEX_DOOR_TARGET_OFFSET_VEHICLE;

private _offset = _offset_human;
if ((vehicle _player) != _player) then {
	_offset = _offset_vehicle;
};

(vehicle _player) allowDamage false;
(vehicle _player) enableSimulation false;

[(vehicle _player), _target, _offset, _heading] call A_object_fnc_fake_attach;
detach (vehicle _player);

(vehicle _player) enableSimulation true;

[_player,{
	if([_this] call A_bases_fnc_underground_player_inside)exitwith{!(sunOrMoon > 0)};
	true
},{
	cutText["","BLACK IN",3];
	(vehicle _player) allowDamage true;
	(vehicle _player) setVelocity [0,0,0];
}] call A_frame_fnc_waitUntil;