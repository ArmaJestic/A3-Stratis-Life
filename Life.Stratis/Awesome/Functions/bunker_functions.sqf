#include "constants.h"
#include "macro.h"

if (not(undefined(bunker_functions_defined))) exitWith {};


bunker_data_name = 0;

bunker_door_data_action_label = 0;
bunker_door_data_action_callback = 1;
bunker_door_data_offset = 2;
bunker_door_data_distance = 3;
bunker_door_data_source_netid = 4;
bunker_door_data_target_heading = 5;
bunker_door_data_target_offset_human = 7;
bunker_door_data_target_offset_vehicle = 8;
bunker_door_data_target_netid = 9;


bunker_create_underground = {
	ARGV(0,_bunker_data);
	ARGV(1,_object);
	ARGV(2,_offset);
	ARGV(3,_heading);
	
	private["_ref"];
	_ref = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "NONE"];
	[_ref, _object,  _offset, _heading, false] call object_fake_attach;
	[[_ref, true], "remote_hideObject", true, true, _ref] call jip_register;

	bunker_setup_ref = _ref;
	publicVariable "bunker_setup_ref";
	

	private["_cv"];
	//generic function for placing composition objects
	_cv = object_editor_create;

//composition objects
["Land_Bunker_F",[-6.09998,7.00488,324.112],[180,0,0],false,true,false,"bunker_door1",false,"",false,_ref] call _cv;
["Land_LampShabby_F",[-6.19995,8.00488,323.4],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-14,2.00488,328.412],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Bunker_F",[-13.6,7.00488,324.119],[180,0,0],false,true,false,"bunker_door2",false,"",false,_ref] call _cv;
["Land_LampShabby_F",[-13.7,8.00488,323.4],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_TentHangar_V1_F",[-9.69995,20.0049,324.412],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-5,28.0049,318.412],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[6,27.5049,328.405],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-8.5,27.4248,334.397],[270,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-18.5,27.6353,334.39],[90,5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-19.5,28.0049,318.418],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-25.2931,27.5049,328.311],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_TentHangar_V1_F",[-9.69995,36.0049,324.412],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.4,43.0049,328.387],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[20,51.0049,318.387],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.407,53.0049,334.387],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_HQ_V1_F",[10,58.8047,327],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampHalogen_F",[39,49.5049,322.4],[60,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[45.3931,44.5,328.4],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[20,65.5049,318.394],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-5,69.0049,318.405],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-8.5,69.0049,334.404],[270,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.407,67.5049,334.38],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-18.5,69.2051,334.397],[90,5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-19.5,69.0049,318.411],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-25.3,69.0049,328.311],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_IndPipe1_90degL_F",[36.8,66.0049,330.33],[181.129,-90,90],false,true,false,"",false,"",false,_ref] call _cv;
["Land_IndPipe1_valve_F",[37,70.0049,329.1],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[20,80.0049,318.4],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[6,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[14,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.4139,82.0049,334.374],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Sign_Sphere100cm_F",[30,80,300],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[22,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[30,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampHalogen_F",[-19,88.5049,322.4],[240,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_IndPipe1_20m_F",[37.2,83.0049,329.3],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[15.1,94.7998,328.3],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[54.425,80.02,308],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[45.4,86,328.4],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-25.9,94.79,328.3],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.4199,96.5049,334.369],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[42,92,287.089],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Airport_Tower_F",[42,92,320.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[25.1,100,334.5],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[27.5,103,294.089],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[50.3,95,337.35],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[32.4,102.9,337.35],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[32.2426,103.337,322.299],[-0.546764,90,90],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[27.5,112,294.589],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[52,104,294.089],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[42,111,287.096],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[34.6953,111.79,322.301],[179.758,90,90],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[52.08,112,294.089],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.7,127,305.469],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampStreet_F",[9.69995,130.5,310.989],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6791,130.5,318.99],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_MilOffices_V1_F",[27.7,133.5,312.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[42,130,287.082],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampStreet_F",[43.7,130.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[4.65918,142,315.478],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.693,141,305.476],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.7,144.1,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6791,144.5,318.983],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,143.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[50.6592,142,315.478],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_10m_F",[35.7,147.5,311.389],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_PowLines_Transformer_F",[40.7,146.5,310.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.6699,152.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,149.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[16.653,155.4,311.989],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_pole_F",[36.0499,152.6,311.389],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.686,155,305.483],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_PowLines_Transformer_F",[40.7,152.7,310.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,155.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6721,158.5,318.978],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.6639,160.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_10m_F",[35.7,159.3,311.389],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_PowLines_Transformer_F",[40.7,158.9,310.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[4.66614,165,315.485],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[14.653,165.4,311.989],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,161.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_10m_F",[41,164.69,311.389],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.6589,168.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[50.6522,162,315.485],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6791,169,305.49],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.653,171.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6661,172.5,318.971],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[16.653,175.4,311.989],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6592,183,315.471],[180,1.00179e-005,0],false,true,false,"",false,"",false,_ref] call _cv;

	

	private["_doors"];
	_doors = [bunker_door1, bunker_door2];
	
	{
		private["_door_data"];
		_door_data = [];
		_door_data set [bunker_door_data_action_label, format["Exit %1", (_bunker_data select bunker_data_name)]];
		_door_data set [bunker_door_data_action_callback, "bunker_exit"];
		_door_data set [bunker_door_data_offset, [0,-2,0]];
		_door_data set [bunker_door_data_distance, 3];
		_door_data set [bunker_door_data_target_heading, [180, 0,0]];
		_door_data set [bunker_door_data_target_offset_human, [0,-2,-1]];
		_door_data set [bunker_door_data_target_offset_vehicle, [0,-8,0.5]];
		_door_data set [bunker_door_data_source_netid, (netId _x)];
	
		[_x, "bunker_door_data", _door_data, true] call object_setVariable;
	}  forEach(_doors);
	
	_doors
};

bunker_cleanup_walls = {
	ARGV(0,_bunker);
	ARGV(1,_ref);
	
	{
		[_x, _ref, [0,0,10^10],[0,0,0], false] call object_fake_attach;
	} forEach(nearestObjects [_bunker, ["Land_City_Pillar_F", "Land_Concrete_SmallWall_8m_F"], 25]);
};

bunker_create_entrance = {
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
	[_bunker1,_ref, [0,1.95,-0.02],[0,0,0]] call object_fake_attach;
	_bunker1 setVehicleVarname "_bunker1";
	_bunker1 allowDamage false;
	_objects = _objects + [_bunker1];
	
	
	[[_bunker1,_ref], "bunker_cleanup_walls", true, true] call jip_register;

	
	private["_bunker2"];
	_bunker2 = createVehicle ["Land_Bunker_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	[_bunker2,_bunker1, [-7.5,0,-0.16],[0,0,0]] call object_fake_attach;
	_bunker2 setVehicleVarname "_bunker2";
	_bunker2 allowDamage false;
	_objects = _objects + [_bunker2];
	
	/*
	private["_sphere2"];
	_sphere2 = createVehicle ["Sign_Sphere100cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	[_sphere2,_bunker1, [0,-2,0],[0,0,0]] call object_fake_attach;
	_sphere2 setVehicleVarname "_sphere2";
	_sphere2 allowDamage false;
	_objects = _objects + [_sphere2];
	_sphere2 hideObject true;
	*/
	

	[[_bunker2,_ref], "bunker_cleanup_walls", true, true] call jip_register;

	bunkerobjs = _objects;



	private["_doors"];
	_doors = [_bunker1,_bunker2];
	
	{
		private["_door_data"];
		_door_data = [];
		_door_data set [bunker_door_data_action_label, format["Enter %1", (_bunker_data select bunker_data_name)]];
		_door_data set [bunker_door_data_action_callback, "bunker_enter"];
		_door_data set [bunker_door_data_offset, [0,-2,0]];
		_door_data set [bunker_door_data_distance, 3];
		_door_data set [bunker_door_data_target_heading, [180, 0,0]];
		_door_data set [bunker_door_data_target_offset_human, [0,-2,-1]];
		_door_data set [bunker_door_data_target_offset_vehicle, [0,-8,0.5]];
		_door_data set [bunker_door_data_source_netid, (netId _x)];
	
		[_x, "bunker_door_data", _door_data, true] call object_setVariable;
	}  forEach(_doors);
	
	{ detach _x; } forEach _objects;
	_doors
};

bunker_match_doors = {
	//player groupChat format["bunker_match_doors %1", _this];
	ARGV(0,_doors1);
	ARGV(1,_doors2);
	
	if (undefined(_doors1)) exitWith {};
	if (undefined(_doors2)) exitWith {};
	
	//match the doors with each other
	private["_i"];
	_i = 0;
	while {_i < (count(_doors1)) && _i < (count(_doors2))} do {
		private["_door1", "_door2"];
		_door1 = _doors1 select _i;
		_door2 = _doors2 select _i;
		
		private["_door1_data", "_door2_data"];
		_door1_data = [_door1, "bunker_door_data"] call object_getVariable;
		_door2_data = [_door2, "bunker_door_data"] call object_getVariable;
		
		private["_door1_netid", "_door2_netid"];
		_door1_netid = netId _door1;
		_door2_netid = netId _door2;
		
		_door1_data set [bunker_door_data_target_netid, _door2_netid];
		_door2_data set [bunker_door_data_target_netid, _door1_netid];
		
		[_door1, "bunker_door_data", _door1_data, true] call object_setVariable;
		[_door2, "bunker_door_data", _door2_data, true] call object_setVariable;
	
		_i = _i + 1;
	};
};


bunker_create = {
	ARGV(0,_name);
	ARGV(1,_position);
	if (undefined(_name)) exitWith {};
	if (undefined(_position)) exitWith {};
	
	
	private["_object"];
	_object = createVehicle ["Sign_Sphere100cm_F", _position, [], 0, "CAN_COLLIDE"];
	_object setPos _position;
	[_object, _object,[0,0,0], [0,0,0]] call object_fake_attach;
	_object hideObject true;
	
	[[_object, true], "object_hide", true, true] call jip_register;

	private["_bunker_data"];
	_bunker_data = [];
	_bunker_data set [bunker_data_name, _name];
	
	private["_doors1", "_doors2"];
	_doors1 = [_bunker_data, _object, [0,0,0], [0,0,0]] call bunker_create_entrance;
	_doors2 = [_bunker_data, _object, [0,0,15000], [0,0,0]] call bunker_create_underground;
	
	[_doors1, _doors2] call bunker_match_doors;
};


if (undefined(bunker_actions)) then {
	bunker_actions = [];
};



#define NORMALIZE_ANGLE(a) ((360 + a % 360)) % 360

bunker_player_looking = {
	ARGV(0,_player);
	ARGV(1,_gate);
	
	private["_gate_range"];
	_gate_range = 150;
	private["_gate_angle_mid", "_gate_angle_min", "_gate_angle_max", "_direction"];
	_gate_angle_mid = getDir _gate;
	_gate_angle_min = _gate_angle_mid - _gate_range/2;
	_gate_angle_max = _gate_angle_mid + _gate_range/2;
	_direction = getDir (vehicle player);
	
	_gate_angle_min = NORMALIZE_ANGLE(_gate_angle_min);
	_gate_angle_max = NORMALIZE_ANGLE(_gate_angle_max);
	_direction = NORMALIZE_ANGLE(_direction);
	
	private["_looking"];
	_looking = false;
	if (_gate_angle_min < _gate_angle_max) then {
		_looking = _direction > _gate_angle_min && _direction < _gate_angle_max;
	}
	else {
		_looking = (_direction > _gate_angle_min && _direction < 360) || (_direction > 0 && _direction < _gate_angle_max);
	};
	
	_looking
};



bunker_player_near = {
	//player grouPChat format["bunker_player_near %1", _this];
	ARGV(0,_player);
	if (undefined(_player)) exitWith {null};
	if (not([_player] call object_exists)) exitWith {null};
	
	private["_near_objects"];
	_near_objects = nearestObjects [_player, ["Land_Bunker_F"], 5];
	if (count(_near_objects) == 0) exitWith {null};

	private["_object"];
	_object = _near_objects select 0;	
	
	private["_bunker_door_data"];
	_bunker_door_data = [_object, "bunker_door_data"] call object_getVariable;
	//player groupChat format["_bunker_door_data = %1", _bunker_door_data];
	if (undefined(_bunker_door_data)) exitWith {null};
	
	
	private["_offset", "_distance"];
	_distance = _bunker_door_data select bunker_door_data_distance;
	_offset = _bunker_door_data select bunker_door_data_offset;
	
	private["_position"];
	_position = _object modelToWorld _offset;
	if ((_position distance _player) > _distance) exitWith {null};	
	if (not([_player, _object] call bunker_player_looking)) exitWith {null};
	
	(netId _object)
};

bunker_remove_actions = {
	if (count bunker_actions == 0) exitWith {};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach bunker_actions;
	bunker_actions = [];
};


bunker_add_actions = {
	if (count bunker_actions > 0) exitWith {};
	ARGV(0,_player);
	ARGV(1,_bunker_net_id);
	//player groupChat format["bunker_add_actions %1", _this];

	if (not([_player] call player_human)) exitWith {};
	if (undefined(_bunker_net_id)) exitWith {};
	if (typeName _bunker_net_id != "STRING") exitWith {};

	private["_bunker_door"];
	_bunker_door = objectFromNetId _bunker_net_id;
	if (undefined(_bunker_door)) exitWith {};
	
	
	private["_bunker_door_data"];
	_bunker_door_data = [_bunker_door, "bunker_door_data"] call object_getVariable;
	if (undefined(_bunker_door_data)) exitWith {};
	

	private["_bunker_action_label", "_bunker_door_action_callback"];
	_bunker_action_label = _bunker_door_data select bunker_door_data_action_label;
	_bunker_door_action_callback = _bunker_door_data select bunker_door_data_action_callback;
	private["_action_id"];
	_action_id = player addaction [_bunker_action_label, "action.sqf", [[_player, _bunker_door_data], "bunker_enter"],10,false,false,"", "true"];
	bunker_actions = bunker_actions + [_action_id];
	
	bunker_actions
};

bunker_exit = {
	ARGV(0,_this);
	_this call bunker_traverse_door;
};

bunker_enter = {
	ARGV(0,_this);
	_this call bunker_traverse_door;
};


bunker_traverse_door = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_bunker_door_data);
	
	if (undefined(_player)) exitWith {};
	if (undefined(_bunker_door_data)) exitWith {};
	
	private["_netid"];
	_netid = _bunker_door_data select bunker_door_data_target_netid;
	private["_target"];
	
	_target = objectFromNetId _netid;
	
	if (undefined(_target)) exitWith {};
	
	private["_target_door_data"];
	_target_door_data = [_target, "bunker_door_data"] call object_getVariable;
	

	
	titleText ["", "BLACK OUT", 1];
	[_player] call bunker_door_sound;	

	sleep 2;
	private["_offset_human", "_heading", "_offset_vehicle"];
	_heading = _bunker_door_data select bunker_door_data_target_heading;
	_offset_human = _bunker_door_data select bunker_door_data_target_offset_human;
	_offset_vehicle = _bunker_door_data select bunker_door_data_target_offset_vehicle;
	
	private["_offset"];
	
	_offset = _offset_human;
	if ((vehicle _player) != _player) then {
		_offset = _offset_vehicle;
	};
	
	(vehicle _player) allowDamage false;
	(vehicle _player) enableSimulation false;
	
	[(vehicle _player), _target, _offset, _heading] call object_fake_attach;
	detach (vehicle _player);
	
	(vehicle _player) enableSimulation true;
	
	
	waitUntil {
		if ([_player] call underground_base_player_inside) exitWith {
			not(sunOrMoon > 0)
		};
		true
	};
	
	
	titleText ["", "BLACK IN", 3];
	(vehicle _player) allowDamage true;
	(vehicle _player) setVelocity [0,0,0];

};};



bunker_door_sound_handler = {
	ARGV(0,_player);
	_player say3d "door_bunker";
};

bunker_door_sound = { _this spawn {
	ARGV(0,_player);
	[[_player], "bunker_door_sound_handler", true] call BIS_fnc_MP;
};};


if (isServer) then {
	["Civilian Bunker", [3060.91,6108.9,0.878565]] call bunker_create;
};



underground_base_check_animation = {
	private["_player"];
	_player = player;
	if (([_player] call underground_base_player_inside) && {(animationState _player) == "halofreefall_non"}) then {
		_player switchMove "amovpercmstpsnonwnondnon";
		_player playMoveNow "amovpercmstpsnonwnondnon";
	};
};


bunker_functions_defined = true;
