#include "constants.h"
#include "macro.h"

if (not(undefined(towing_functions_defined))) exitWith {};

towing_data_class = 0;
towing_data_towing_hitch_offset = 1;
towing_data_towed_hitch_offset = 2;
towing_data_towed_front_axle = 3;
towing_data_towed_back_axle =  4;
towing_data_towing_enabled = 5;
towing_data_towed_enabled = 6;



towing_data_lookup_class = {
	ARGV(0,_class);
	
	if (undefined(_class)) exitWith {null};
	
	if (_class isKindOf "Man") then {
		_class = "Man";
	};
	
	private["_entry"];
	_entry = null;
	
	{
		private["_centry", "_cclass"];
		_centry = _x;
		_cclass = _centry select towing_data_class;
		if (_cclass == _class) then {
			_entry = _centry;
		};
	} forEach towing_data;
	_entry
};

towing_player_near = {
	ARGV(0,_player);

	private["_object"];
	_object = cursorTarget;
	
	if ((_object distance _player) > 10) exitWith {null};
	
	private["_towing_class"];
	_towing_class = typeOf _object;
	if ((towing_classes find _towing_class) == -1) exitWith {null};
	
	private["_towing_data"];
	_towing_data = [_towing_class] call towing_data_lookup_class;
	if (undefined(_towing_data)) exitWith {null};
	
	private["_towing_hitch_offset", "_pos"];
	_towing_hitch_offset = _towing_data select towing_data_towing_hitch_offset;
	
	_pos = _object modelToWorld _towing_hitch_offset;
	if ((_pos distance _player) > 3) exitWith {null};
	
	(netId _object)
};

towed_player_near = {
	ARGV(0,_player);

	private["_object"];
	_object = cursorTarget;
	
	if ((_object distance _player) > 10) exitWith {null};
	
	private["_towed_class"];
	_towed_class = typeOf _object;
	if ((towed_classes find _towed_class) == -1) exitWith {null};
	
	private["_towed_data"];
	_towed_data = [_towed_class] call towing_data_lookup_class;
	if (undefined(_towed_data)) exitWith {null};
	
	private["_towed_hitch_offset", "_pos"];
	_towed_hitch_offset = _towed_data select towing_data_towed_hitch_offset;
	
	_pos = _object modelToWorld _towed_hitch_offset;
	if ((_pos distance _player) > 3) exitWith {null};
	
	(netId _object)
};

towed_remove_actions = {
	if (count towed_actions == 0) exitWith {};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach towed_actions;
	towed_actions = [];
};

towing_remove_actions = {
	if (count towing_actions == 0) exitWith {};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach towing_actions;
	towing_actions = [];
};

towing_selection_offset = {
	ARGV(0,_object);
	ARGV(1,_selection);
	ARGV(2,_default);
	
	private["_offset"];
	_offset = _object selectionPosition _selection;
	if (str(_offset) == "[0,0,0]") exitWith {_default};
	_offset
};

towing_setup_towing_data = {
	//player groupChat format["towing_setup_towing_data %1", _this];
	ARGV(0,_vehicle);
	if (undefined(_vehicle)) exitWith {};
	
	private["_towing_line"];
	_towing_line = _vehicle getVariable ["towing_line", null];
	if (undefined(_towing_line)) exitWith {};

	private["_towing_data", "_towed_data"];

	towing = _towing_line getVariable ["towing", null];
	towed = _towing_line getVariable ["towed", null];
	if (towing == towed) exitWith {};
	if (towing isKindOf "Man") exitWith {};

	if (undefined(towing)) exitWith {};
	if (undefined(towed)) exitWith {};


	private["_towing_data", "_towed_data"];
	_towing_data = _towing_line getVariable ["towing_data", null];
	_towed_data = _towing_line getVariable ["towing_data", null];
	if (undefined(_towing_data)) exitWith {};
	if (undefined(_towed_data)) exitWith {};

	
	towing_hitch_offset = _towing_data select towing_data_towing_hitch_offset;
	towed_hitch_offset = _towed_data select towing_data_towed_hitch_offset;
	towed_front_axle = _towed_data select towing_data_towed_front_axle;
	towed_back_axle = _towed_data select towing_data_towed_back_axle;
	
	towing_loop_data_setup = true;
};

towing_clear_towing_data = {
	//player groupChat format["towing_clear_towing_data"];
	towing_loop_data_setup = false;
	towing = nil;
	towed = nil;
	towing_hitch_offset = nil;
	towed_hitch_offset = nil;
	towed_front_axle = nil;
	towed_back_axle = nil;
	towed_hitch_position = nil;	
};

towing_loop_data_setup = false;
towing_loop_logic = {
	if (isNil "towing_functions_defined") exitWith {};
	private["_player"];
	_player = player;
	
	private["_vehicle"];
	_vehicle = (vehicle _player);
	
	private["_is_driver"];
	_is_driver  = (driver(_vehicle) == _player && {not(_vehicle == _player)});
	
	if (not(_is_driver) && towing_loop_data_setup) exitWith {
		[] call towing_clear_towing_data;
	};
	
	if (_is_driver && not(towing_loop_data_setup)) exitWith {
		[_vehicle] call towing_setup_towing_data;
	};
	
	if (not(towing_loop_data_setup)) exitWith {};
	
	private["_towing", "_towing_hitch_offset"];
	_towing = towing;
	_towing_hitch_offset = towing_hitch_offset;
	
	private["_towed", "_towed_hitch_offset", "_towed_front_axle", "_towed_back_axle"];
	_towed = towed;
	_towed_hitch_offset = towed_hitch_offset;
	_towed_front_axle = towed_front_axle;
	_towed_back_axle = towed_back_axle;
	
	private["_distance", "_max_angle"];
	_distance = 2.5;
	_max_angle = 60;
	
	private["_anchor", "_towed_target_offset"];
	_anchor = _towing_hitch_offset;
	_towed_target_offset = [(_anchor select 0), ((_anchor select 1) - _distance), (_anchor select 2)];
	
	if (undefined(towed_hitch_position)) then {
		towed_hitch_position = _towed modelToWorld _towed_target_offset;
	};
	
	//[_towing, _anchor, _towed_target_offset]call draw_modelVector;
	
	private["_towed_target_vector"];
	_towed_target_vector = [_towed_target_offset, _anchor] call vector_substract;
	
	private["_towed_actual_offset"];
	_towed_actual_offset = (_towing worldToModel towed_hitch_position);
	//[_towing,_anchor,  _towed_actual_offset] call draw_modelVector;
	
	private["_towed_actual_vector"];
	_towed_actual_vector = [_towed_actual_offset, _anchor] call vector_substract;
	
	private["_angle"];
	_angle = [_towed_target_vector, _towed_actual_vector] call vector_angle;
	
	private["_lin", "_speed"];
	_speed = (speed _towing);
	_lin = [_speed, _angle] call towing_interpolation_percent;
	
	private["_towed_interpolated_vector"];
	_towed_interpolated_vector = [_towed_target_vector, _towed_actual_vector, _lin] call vector_interpolate;
	_towed_interpolated_vector set [2, (_towed_target_vector select 2)];
	_towed_interpolated_vector = [_towed_interpolated_vector, _distance] call vector_resize;
	
	private["_towed_interpolated_offset"];
	_towed_interpolated_offset = [_towed_interpolated_vector, _anchor] call vector_add;
	//[_towing, _anchor,  _towed_interpolated_offset] call draw_modelVector;
	
	private["_dir_vector"];
	_dir_vector = [(_towing modelToWorld _anchor), (_towed modelToWorld _towed_hitch_offset)] call vector_substract;
	
	
	private["_towed_front_axle_offset", "_towed_back_axle_offset"];
	_towed_front_axle_offset = (_towed modelToWorld _towed_front_axle);
	_towed_back_axle_offset = (_towed modelToWorld _towed_back_axle);
	
	private["_towed_front_surface_normal_unit", "_towed_back_surface_normal_unit"];
	_towed_front_surface_normal_unit = (surfaceNormal _towed_front_axle_offset);
	_towed_back_surface_normal_unit = (surfaceNormal _towed_back_axle_offset);
	
	private["_towed_front_surface_normal", "_towed_back_surface_normal"];
	_towed_front_surface_normal = [_towed_front_surface_normal_unit, 10] call vector_resize;
	_towed_back_surface_normal = [_towed_back_surface_normal_unit, 10] call vector_resize;
	
	private["_towed_front_surface_normal_offset", "_towed_back_surface_normal_offset"];
	
	_towed_front_surface_normal_offset = [_towed_front_axle_offset, _towed_front_surface_normal] call vector_add;
	_towed_back_surface_normal_offset = [_towed_back_axle_offset, _towed_back_surface_normal] call vector_add;
	//drawLine3D [_towed_front_axle_offset, _towed_front_surface_normal_offset, [1,0,0,1]];	
	//drawLine3D [_towed_back_axle_offset, _towed_back_surface_normal_offset, [1,0,0,1]];	
	
	private["_interpolated_normal_unit", "_interpolated_normal", "_interpolated_normal_offset"];
	//player groupChat format["%1", _towed_front_surface_normal_unit];
	_interpolated_normal_unit = [_towed_front_surface_normal_unit, _towed_back_surface_normal_unit, 0.5]  call vector_interpolate;
	_interpolated_normal = [_interpolated_normal_unit, 10] call vector_resize;
	_interpolated_normal_offset = [(_towed modelToWorld [0,0,0]), _interpolated_normal] call vector_add;
	//drawLine3D [(_towed modelToWorld [0,0,0]), _interpolated_normal_offset, [1,0,0,1]];	
	
	if (_angle > _max_angle && not(_speed > 0) && _speed < -0.01) exitWith {
		_towing setVelocity [0,0,0];
		_towed setVelocity [0,0,0];
	};
	
	if (abs(_speed) < 0.5) exitWith {};
	if (not(_is_driver)) exitWith {};
	
	towed_hitch_position =  (_towing modelToWorld _towed_interpolated_offset);
	towed_hitch setPos towed_hitch_position;
	towed_hitch setVectorDir _dir_vector;

	[_towing, _towed, towed_hitch, _dir_vector, _interpolated_normal, _anchor, _towed_hitch_offset] call towing_update_position;
};

towing_loop_draw = {
	if (isNil "towing_functions_defined") exitWith {};
	private["_player"];
	_player = player;
	

	private["_objects"];
	_objects = nearestObjects [(getPos _player), ["Air","Ship", "Land"], 20];
	{if (true) then {
		private["_vehicle"];
		_vehicle = _x;
		_towing_line = _vehicle getVariable ["towing_line", null];
		if (undefined(_towing_line)) exitWith {};
		
		private["_towing"];
		_towing = _towing_line getVariable ["towing", null];
		if (undefined(_towing)) exitWith {};
		if (_towing != _vehicle) exitWith {};
		
		private["_towed"];
		_towed = _towing_line getVariable ["towed", null];
		
		if (undefined(_towed)) exitWith {};
		if (_towed == _towing) exitWith {};
		
		private["_towed_data", "_towing_data"];
		_towed_data = _towing_line getVariable "towed_data";
		_towing_data = _towing_line getVariable "towing_data";
		
		private["_towing_hitch_offset", "_towed_hitch_offset"];
		_towing_hitch_offset = _towing_data select towing_data_towing_hitch_offset;
		_towed_hitch_offset = _towed_data select towing_data_towed_hitch_offset;
		
		_towing_hitch_offset = [_towing, "RightHand", _towing_hitch_offset] call towing_selection_offset;
		_towed_hitch_offset = [_towed, "RightHand", _towed_hitch_offset] call towing_selection_offset;
		
		
		drawLine3D [(_towing modelToWorld _towing_hitch_offset), (_towed modelToWorld _towed_hitch_offset), [1,0,0,1]];
		

	};} forEach _objects;
};

towing_update_position = {
	ARGV(0,_towing);
	ARGV(1,_towed);
	ARGV(2,_hitch);
	ARGV(3,_dir_vector);
	ARGV(4,_up_vector);
	ARGV(5,_anchor);
	ARGV(6,_towed_hitch_offset);
	
	private["_dir_vector"];
	_dir_vector = [(_towing modelToWorld _anchor), (_towed modelToWorld _towed_hitch_offset)] call vector_substract;

	private["_towed_pos", "_offset"];
	_offset = [(_towed_hitch_offset select 0), - (_towed_hitch_offset select 1), (_towed_hitch_offset select 2)];
	_towed_pos = _hitch modelToWorld _offset;
	
	_bridge = (nearestObject [_towed, "Land_Bridge_01_PathLod_F"]);
	if ((_towed distance _bridge) < 15) then {
		//special processing when crossing a bridge
		private["_ASL_pos", "_bridge_pos"];
		_bridge_pos = getPosASL _bridge;
		_ASL_pos = getPosASL _towing;
		_towed_pos set [2, (_bridge_pos select 2) + 0.9];
		_towed setPosASL _towed_pos;
		_towed setVectorUp [0,0,1];
		_towed setVectorDir _dir_vector;
	}
	else {
		_towed_pos set [2, 0];
		_towed setPos _towed_pos;
		_towed setVectorUp _up_vector;
		_towed setVectorDir _dir_vector;
		detach _towed;
		
	};
};

towing_interpolation_percent = {
	ARGV(0,_speed);
	ARGV(1,_angle);
	
	private["_percent"];
	
	if (_speed < 0) then {
		//going backwards
		_percent = 0.9999;
		if (_angle < 90) then {
			_percent = 1.001;
		};
	}
	else {
		//going forward
		_percent = 1;
		if (_angle != 0) then {
			_percent = 0.9999;
		};
	};
	
	_percent
};

towing_line_attach = {
	//player groupChat format["towing_line_attach %1", _this];
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_endpoint_type);
	
	if (undefined(_player)) exitWith {};
	if (undefined(_vehicle)) exitWith {};
	if (undefined(_endpoint_type)) exitWith {};
	
	private["_towing_line"];
	_towing_line = _player getVariable ["towing_line", null];
	if (undefined(_towing_line)) exitWith {};
	
	[_towing_line, _endpoint_type, _vehicle] call towing_line_setup_endpoint;
};

towing_line_attached = {
	ARGV(0,_object);
	ARGV(1,_endpoint_type);
	if (undefined(_object)) exitWith {false};
	
	private["_towing_line"];
	_towing_line = _object getVariable ["towing_line", null];
	if (undefined(_towing_line)) exitWith {false};
	
	if (undefined(_endpoint_type)) exitWith {true};
	
	private["_endpoint"];
	_endpoint = _towing_line getVariable [_endpoint_type, null];
	if (undefined(_endpoint)) exitWith {false};
	
	(_endpoint == _object)
};

towing_line_detach = {
	//player groupChat format["towing_line_detach %1", _this];
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_vehicle);
	ARGV(2,_endpoint_type);
	
	if (undefined(_player)) exitWith {};
	if (undefined(_vehicle)) exitWith {};
	if (undefined(_endpoint_type)) exitWith {};
	
	private["_towing_line"];
	_towing_line = _vehicle getVariable ["towing_line", null];
	if (undefined(_towing_line)) exitWith {};
	

	[_towing_line, _endpoint_type] call towing_line_clear_endpoint;
	[_towing_line, _endpoint_type, _player] call towing_line_setup_endpoint;
};

if (undefined(towing_actions)) then {
	towing_actions = [];
};

if (undefined(towed_actions)) then {
	towed_actions = [];
};

towed_add_actions = {
	if (count towed_actions > 0) exitWith {};
	ARGV(0,_player);
	ARGV(1,_towed_net_id);
	//player groupChat format["towed_add_actions %1", _this];

	if (not([_player] call player_human)) exitWith {};
	if (undefined(_towed_net_id)) exitWith {};
	if (typeName _towed_net_id != "STRING") exitWith {};

	private["_towed_vehicle"];
	_towed_vehicle = objectFromNetId _towed_net_id;
	if (undefined(_towed_vehicle)) exitWith {};
	
	
	private["_action_id"];
	_action_id = player addaction ["Attach towing line", "action.sqf", [[_player, _towed_vehicle, "towed"], "towing_line_attach"],10,false,true,"", format['not([%1] call towing_line_attached) && {([%2, "towed"] call towing_line_attached)}', _towed_vehicle, _player]];
	towed_actions = towed_actions + [_action_id];
	
	_action_id = player addaction ["Detach towing line", "action.sqf", [[_player, _towed_vehicle, "towed"], "towing_line_detach"],10,false,true,"", format['([%1, "towed"] call towing_line_attached)', _towed_vehicle]];
	towed_actions = towed_actions + [_action_id];
	
	towed_actions
};

towing_add_actions = {
	if (count towing_actions > 0) exitWith {};
	ARGV(0,_player);
	ARGV(1,_towing_net_id);
	//player groupChat format["towing_add_actions %1", _this];

	if (not([_player] call player_human)) exitWith {};
	if (undefined(_towing_net_id)) exitWith {};
	if (typeName _towing_net_id != "STRING") exitWith {};

	private["_towing_vehicle"];
	_towing_vehicle = objectFromNetId _towing_net_id;
	if (undefined(_towing_vehicle)) exitWith {};
	
	
	private["_action_id"];
	_action_id = player addaction ["Attach towing line", "action.sqf", [[_player, _towing_vehicle, "towing"], "towing_line_attach"],10,false,true,"", format['not([%1] call towing_line_attached) && {([%2, "towing"] call towing_line_attached)}', _towing_vehicle, _player]];
	towing_actions = towing_actions + [_action_id];
	
	_action_id = player addaction ["Detach towing line", "action.sqf", [[_player, _towing_vehicle, "towing"], "towing_line_detach"],10,false,true,"", format['([%1, "towing"] call towing_line_attached)', _towing_vehicle]];
	towing_actions = towing_actions + [_action_id];
	

	towing_actions
};

towing_line_item_use = {
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	if (not([_player] call player_exists)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (undefined(_amount)) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	if (typeName _amount != "SCALAR") exitWith {};
	
	if (_amount == 0) exitWith {};
	
	if (_amount >  1) exitWith {
		player groupChat format["%1-%2, you cannot use multiple towing lines", _player, (name _player)];
	};
	
	[_player, _item, -1] call inventory_add_item;
	
	//cleanup the previous towing line 
	private["_towing_line"];
	_towing_line = _player getVariable ["towing_line", null];
	if (not(undefined(_towing_line))) then {
		[_towing_line] call towing_line_clear_endpoints;
	};
	
	//create a new towing line
	[_player] call towing_line_create;
	player groupChat format["%1-%2, the towing line is now active. You can attach it to vehicles", _player, (name _player)];
};


towing_line_clear_endpoints = {
	ARGV(0,_towing_line);
	if (undefined(_towing_line)) exitWith {};
	if (typeName _towing_line != "OBJECT") exitWith {};
	if (isNull _towing_line) exitWith {};
	
	[_towing_line, "towed"] call towing_line_clear_endpoint;
	[_towing_line, "towing"] call towing_line_clear_endpoint;
};

towing_line_cleanup_wait = {
	ARGV(0,_towing_line);
	if (undefined(_towing_line)) exitWith {};
	if (typeName _towing_line != "OBJECT") exitWith {};
	if (isNull _towing_line) exitWith {};
	
	private["_towed", "_towing"];
	//player groupChat format["towing_line_cleanup_wait[%1]: start", _towing_line];
	waitUntil {
		sleep 1;
		_towed = _towing_line getVariable ["towed", null];
		_towing = _towing_line getVariable ["towing", null];
		
		if (undefined(_towed) && {undefined(_towing)}) exitWith {true};
		if (isNull _towed && {isNull _towing}) exitWith {true};
		if (not(alive _towed) && {not(alive _towing)}) exitWith {true};
		if ((_towed distance _towing) > 10) then {
			[_towing_line] call towing_line_clear_endpoints;
		};
		false
	};
	
	//player groupChat format["towing_line_cleanup_wait[%1]: stop", _towing_line];
	deleteVehicle _towing_line;
};


towing_line_create_request_receive = {
	ARGV(0,_variable);
	ARGV(1,_this);

	ARGV(0,_object);
	if (undefined(_object)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	
	private["_towing_line"];
	_towing_line = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	_towing_line hideObject true;
	
	[_towing_line, "towing", _object] call towing_line_setup_endpoint;
	[_towing_line, "towed", _object] call towing_line_setup_endpoint; 
	

	[_towing_line] spawn towing_line_cleanup_wait;
};

towing_line_create_setup = {
	if (not(isServer)) exitWith {null};
	
	towing_line_create_request_buffer =  " ";
	publicVariableServer "towing_line_create_request_buffer";
	"towing_line_create_request_buffer" addPublicVariableEventHandler { _this call towing_line_create_request_receive;};
};

towing_line_create = {
	ARGV(0,_object);
	if (undefined(_object)) exitWith {};

	towing_line_create_request_buffer = [_object];
	if (isServer) then {
		["", towing_line_create_request_buffer] call towing_line_create_request_receive;
	}
	else {
		publicVariable "towing_line_create_request_buffer";
	};
};

towing_line_clear_endpoint = {
	ARGV(0,_towing_line);
	ARGV(1,_endpoint_type);
	
	if (undefined(_towing_line)) exitWith {};
	if (undefined(_endpoint_type)) exitWith {};
	if (typeName _towing_line != "OBJECT") exitWith {};
	if (isNull _towing_line) exitWith {};
	
	private["_endpoint_object"];
	_endpoint_object = _towing_line getVariable [format["%1", _endpoint_type], null];
	if (not(undefined(_endpoint_object))) then {
		_endpoint_object setVariable ["towing_line", nil, true];
	};
	
	_towing_line setVariable [format["%1", _endpoint_type], nil, true];
	_towing_line setVariable [format["%1_data", _endpoint_type], nil, true];
};

towing_line_setup_endpoint = {
	ARGV(0,_towing_line);
	ARGV(1,_endpoint_type);
	ARGV(2,_endpoint_object);
	
	if (undefined(_towing_line)) exitWith {};
	if (undefined(_endpoint_type)) exitWith {};
	if (undefined(_endpoint_object)) exitWith {};
	if (typeName _towing_line != "OBJECT") exitWith {};
	if (isNull _towing_line) exitWith {};
	
	private["_endpoint_data"];
	_endpoint_data = [typeOf _endpoint_object] call towing_data_lookup_class;
	
	_towing_line setVariable [format["%1", _endpoint_type], _endpoint_object, true];
	_towing_line setVariable [format["%1_data", _endpoint_type], _endpoint_data, true];
	
	_endpoint_object setVariable ["towing_line", _towing_line, true];
};

towing_classes_setup = {
	towing_data = [
		["B_Truck_01_covered_F", [0.05,-4.5,-1], [0.2,4.2,-1], [0,3,-1], [0,-3,-1], true, true],
		["C_Offroad_01_F", [0,-3,-0.7], [0,2.7,-0.5], [0,1.5,-1], [0,-2,-1], true, true],
		["Man", [0,0,0], [0,0,1],[0,0,0], [0,0,0], false, true]
	];

	towing_classes = [];
	towed_classes = [];
	{
		private["_entry", "_towing_enabled", "_class", "_towed_enabled"];
		_entry = _x;
		_class = _entry select towing_data_class;
		_towing_enabled = _entry select towing_data_towing_enabled;
		_towed_enabled = _entry select towing_data_towed_enabled;

		if (_towing_enabled) then {
			towing_classes set [count(towing_classes), _class];
		};

		if (_towed_enabled) then {
			towed_classes set [count(towed_classes), _class];
		};
	} forEach towing_data;
};

towing_object_setup = {
	towed_hitch = createVehicle ["Sign_Sphere25cm_F", [0,0,0], [], 0, "CAN_COLLIDE"];
	towed_hitch hideObject true;
};


[] call towing_clear_towing_data;
[] call towing_classes_setup;
[] call towing_object_setup;
[] call towing_line_create_setup;


towing_functions_defined = true;