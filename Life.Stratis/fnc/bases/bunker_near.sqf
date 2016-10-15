// A_bases_fnc_bunker_near

#include "header.h"


params["_player"];
if (UNDEFINED(_player)) exitWith {null};
if (!([_player] call A_object_fnc_exists)) exitWith {null};

private _near_objects = nearestObjects [_player, ["Land_Bunker_F"], 5];
if (count(_near_objects) == 0) exitWith {null};

private _object = _near_objects select 0;	

private _bunker_door_data = [_object, "bunker_door_data"] call A_object_fnc_getVariable;
if (UNDEFINED(_bunker_door_data)) exitWith {null};

private _distance = _bunker_door_data select BUNKER_INDEX_DOOR_DISTANCE;
private _offset = _bunker_door_data select BUNKER_INDEX_DOOR_OFFSET;

private _position = _object modelToWorld _offset;
if ((_position distance _player) > _distance) exitWith {null};	
if (!([_player, _object] call A_bases_fnc_bunker_looking)) exitWith {null};

(netId _object)