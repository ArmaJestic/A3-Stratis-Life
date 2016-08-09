// A_bunker_fnc_player_near

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player grouPChat format["A_bunker_fnc_player_near %1", _this];
ARGV(0,_player);
if (undefined(_player)) exitWith {null};
if (!([_player] call A_object_fnc_exists)) exitWith {null};

private["_near_objects"];
_near_objects = nearestObjects [_player, ["Land_Bunker_F"], 5];
if (count(_near_objects) == 0) exitWith {null};

private["_object"];
_object = _near_objects select 0;	

private["_bunker_door_data"];
_bunker_door_data = [_object, "bunker_door_data"] call A_object_fnc_getVariable;
//player groupChat format["_bunker_door_data = %1", _bunker_door_data];
if (undefined(_bunker_door_data)) exitWith {null};


private["_offset", "_distance"];
_distance = _bunker_door_data select A_bunker_var_door_data_distance;
_offset = _bunker_door_data select A_bunker_var_door_data_offset;

private["_position"];
_position = _object modelToWorld _offset;
if ((_position distance _player) > _distance) exitWith {null};	
if (!([_player, _object] call A_bunker_fnc_player_looking)) exitWith {null};

(netId _object)
