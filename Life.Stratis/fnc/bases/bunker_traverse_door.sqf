// A_bases_fnc_bunker_traverse_door

#include "header.h"


params["_player","_bunker_door_data"];
if (UNDEFINED(_player)) exitWith {};
if (UNDEFINED(_bunker_door_data)) exitWith {};

private _netid = _bunker_door_data select BUNKER_INDEX_DOOR_TARGET_NETID;
private _target = objectFromNetId _netid;
if (UNDEFINED(_target)) exitWith {};

private _target_door_data = [_target, "bunker_door_data"] call A_object_fnc_getVariable;

cutText["","BLACK OUT",1];
[_player] call A_bases_fnc_bunker_door_sound;	


[2,[_player,_bunker_door_data],A_bases_fnc_bunker_traverse_door2] call A_frame_fnc_wait;