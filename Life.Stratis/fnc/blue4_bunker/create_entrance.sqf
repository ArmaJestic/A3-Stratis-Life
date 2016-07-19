// A_blue4_bunker_fnc_create_entrance

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_bunker_data);

if (undefined(_bunker_data)) exitWith {};

private["_ref"];
_ref = object_attach_reference;

private["_cv"];
//generic function for placing composition objects
_cv = A_object_fnc_editor_create;

private["_id"];
_id = "";


["Land_Bunker_F",[2255.8,5645.79,0.917077],[85.2553,0,0],true,true,true,"blue4_bunker_door_m",true,_id,true,_ref] call _cv;
["Land_Bunker_F",[2259.95,5688.95,1.03708],[461.732,0,0],false,true,true,"blue4_bunker_door_l",true,_id,true,_ref] call _cv;
["Land_Bunker_F",[2260.66,5589.62,0.997076],[61.3999,0,0],true,true,true,"blue4_bunker_door_r",true,_id,true,_ref] call _cv;


private["_objects"];
_objects = [];



private["_doors"];
_doors = [blue4_bunker_door_l, blue4_bunker_door_m, blue4_bunker_door_r];

{
	private["_door_data"];
	_door_data = [];
	_door_data set [A_bunker_var_door_data_action_label, format["Enter %1", (_bunker_data select A_bunker_var_data_name)]];
	_door_data set [A_bunker_var_door_data_action_callback, "A_bunker_fnc_enter"];
	_door_data set [A_bunker_var_door_data_offset, [0,-2,0]];
	_door_data set [A_bunker_var_door_data_distance, 3];
	_door_data set [A_bunker_var_door_data_target_heading, [180, 0,0]];
	_door_data set [A_bunker_var_door_data_target_offset_human, [0,-2,-1]];
	_door_data set [A_bunker_var_door_data_target_offset_vehicle, [0,-8,0.5]];
	_door_data set [A_bunker_var_door_data_source_netid, (netId _x)];

	[_x, "bunker_door_data", _door_data, true] call A_object_fnc_setVariable;
}  forEach(_doors);

{ detach _x; } forEach _objects;
_doors
