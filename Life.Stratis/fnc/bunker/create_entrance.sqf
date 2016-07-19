// A_bunker_fnc_create_entrance

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_bunker_data);
ARGV(1,_ref);
ARGV(2,_offset);
ARGV(3,_heading);

if (undefined(_bunker_data)) exitWith {};
if (undefined(_object)) exitWith {};
if (undefined(_offset)) exitWith {};
if (undefined(_heading)) exitWith {};

private["_objects"];
_objects = [];

private["_bunker1"];
_bunker1 = createVehicle ["Land_Bunker_F", [0,0,0], [], 0, "CAN_COLLIDE"];
[_bunker1,_ref, [0,1.95,-0.02],[0,0,0]] call A_object_fnc_fake_attach;
_bunker1 setVehicleVarname "_bunker1";
_bunker1 allowDamage false;
_objects = _objects + [_bunker1];


[[_bunker1,_ref], "A_bunker_fnc_cleanup_walls", true, true] call A_jip_fnc_register;


private["_bunker2"];
_bunker2 = createVehicle ["Land_Bunker_F", [0,0,0], [], 0, "CAN_COLLIDE"];
[_bunker2,_bunker1, [-7.5,0,-0.16],[0,0,0]] call A_object_fnc_fake_attach;
_bunker2 setVehicleVarname "_bunker2";
_bunker2 allowDamage false;
_objects = _objects + [_bunker2];

/*
private["_sphere2"];
_sphere2 = createVehicle ["Sign_Sphere100cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
[_sphere2,_bunker1, [0,-2,0],[0,0,0]] call A_object_fnc_fake_attach;
_sphere2 setVehicleVarname "_sphere2";
_sphere2 allowDamage false;
_objects = _objects + [_sphere2];
_sphere2 hideObject true;
*/


[[_bunker2,_ref], "A_bunker_fnc_cleanup_walls", true, true] call A_jip_fnc_register;

bunkerobjs = _objects;



private["_doors"];
_doors = [_bunker1,_bunker2];

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
