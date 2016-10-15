// A_bases_fnc_bunker_create_entrance

#include "header.h"


params["_bunker_data","_ref","_offset","_heading"];

private _objects = [];

private _bunker1 = createVehicle ["Land_Bunker_F", [0,0,0], [], 0, "CAN_COLLIDE"];
[_bunker1,_ref, [0,1.95,-0.02],[0,0,0]] call A_object_fnc_fake_attach;
_bunker1 setVehicleVarname "_bunker1";
_bunker1 allowDamage false;
_objects pushBack _bunker1;

[[_bunker1,_ref], "A_bases_fnc_bunker_cleanup_walls"] call A_jip_fnc_register;


private _bunker2 = createVehicle ["Land_Bunker_F", [0,0,0], [], 0, "CAN_COLLIDE"];
[_bunker2,_bunker1, [-7.5,0,-0.16],[0,0,0]] call A_object_fnc_fake_attach;
_bunker2 setVehicleVarname "_bunker2";
_bunker2 allowDamage false;
_objects = _objects + [_bunker2];

[[_bunker2,_ref], "A_bases_fnc_bunker_cleanup_walls"] call A_jip_fnc_register;


bunkerobjs = _objects;


private _doors = [_bunker1,_bunker2];
{
	private["_door_data"];
	_door_data = [];
	_door_data set [BUNKER_INDEX_DOOR_ACTION_LABEL, format["Enter %1", (_bunker_data select BUNKER_INDEX_DATA_NAME)]];
	_door_data set [BUNKER_INDEX_DOOR_ACTION_CALLBACK, "A_bases_fnc_bunker_enter"];
	_door_data set [BUNKER_INDEX_DOOR_OFFSET, [0,-2,0]];
	_door_data set [BUNKER_INDEX_DOOR_DISTANCE, 3];
	_door_data set [BUNKER_INDEX_DOOR_TARGET_HEADING, [180, 0,0]];
	_door_data set [BUNKER_INDEX_DOOR_TARGET_OFFSET_HUMAN, [0,-2,-1]];
	_door_data set [BUNKER_INDEX_DOOR_TARGET_OFFSET_VEHICLE, [0,-8,0.5]];
	_door_data set [BUNKER_INDEX_DOOR_SOURCE_NETID, (netId _x)];

	[_x, "bunker_door_data", _door_data, true] call A_object_fnc_setVariable;
}  forEach(_doors);

{detach _x;} forEach _objects;
_doors