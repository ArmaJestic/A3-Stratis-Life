// A_bases_fnc_bunker_blf_create_entrance

#include "header.h"


params["_bunker_data"];
if (UNDEFINED(_bunker_data)) exitWith {};

private _ref = object_attach_reference;

//generic function for placing composition objects
private _cv = A_object_fnc_editor_create;

private _id = "";

["Land_Bunker_F",[2255.8,5645.79,0.917077],[85.2553,0,0],true,true,true,"blue4_bunker_door_m",true,_id,true,_ref] call _cv;
["Land_Bunker_F",[2259.95,5688.95,1.03708],[461.732,0,0],false,true,true,"blue4_bunker_door_l",true,_id,true,_ref] call _cv;
["Land_Bunker_F",[2260.66,5589.62,0.997076],[61.3999,0,0],true,true,true,"blue4_bunker_door_r",true,_id,true,_ref] call _cv;

private _objects = [];

private _doors = [blue4_bunker_door_l, blue4_bunker_door_m, blue4_bunker_door_r];

{
	private _door_data = [];
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