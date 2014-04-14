#include "constants.h"
#include "macro.h"

if (not(undefined(tree_functions_defined))) exitWith {};

tree_near = {
	ARGV(0,_position);
	ARGV(1,_names);
	ARGV(2,_distance);
	
	private["_objects", "_found_objects"];
	
	_objects = nearestObjects [_position, [], _distance];
	_found_objects = [];
	
	{
		 private["_object_name", "_object"];
		 _object = _x;
		 _object_name = str(_object);
		 //player grouPChat format["_object_name = %1", _object_name];
		 private["_found"];
		 _found = false;
		 {
			private["_name"];
			_name = _x;
			if ([_name, _object_name] call BIS_fnc_inString) exitWith {
				_found_objects set [count(_found_objects), _object];
			};
		 } forEach _names;
	} forEach _objects;
	_found_objects
};


tree_get_object = {
	ARGV(0,_tree);
	if (undefined(_tree)) exitWith {};
	
	private["_variable_name"];
	_variable_name = netId _tree;
	
	private["_tree_soul"];
	_tree_soul = server getVariable [_variable_name, objNull];
	if (isNull _tree_soul) then {
		_tree_soul =  "Sign_Sphere25cm_F" createVehicle[0,0,10000]; 
		server setVariable [_variable_name, _tree_soul, true];
		player groupChat format["SPAWNING TREE: %1", _variable_name];
		_tree_soul setVariable ["health", 1, true];
	};
	_tree_soul
};

tree_delete_object = {
	ARGV(0,_tree);
	if (undefined(_tree)) exitWith {};
	
	private["_variable_name"];
	_variable_name = netId _tree;
	
	private["_tree_soul"];
	_tree_soul = server getVariable [_variable_name, objNull];
	
	if (isNull _tree_soul) exitWith {};
	player groupChat format["CLEANING TREE: %1", _variable_name];
	deleteVehicle _tree_soul;
};



if (undefined(tree_registry)) then {
	tree_registry = [];
};


tree_register_setup = {
	if (not(isServer)) exitWith {};

	[format["tree_register_setup %1", _this]] call jip_message;
	tree_register_request_buffer =  "";
	publicVariableServer "tree_register_request_buffer";
	"tree_register_request_buffer" addPublicVariableEventHandler { _this call tree_register_request_receive;};
	server setVariable ["tree_register_setup_complete", true, true];
};

tree_register = {
	player groupChat format["tree_register %1", _this];
	if (undefined(_this)) exitWith {};

	tree_register_request_buffer = _this;
	if (isServer) then {
		["", tree_register_request_buffer] call tree_register_request_receive;
	}
	else {
		publicVariableServer "tree_register_request_buffer";
	};
};

tree_register_request_receive = {
	[format["tree_register_request_receive %1", _this]] call jip_message;

	ARGV(0,_variable);
	ARGV(1,_this);
	ARGV(0,_tree_id);

	
	if (undefined(_tree_id)) exitWith {};
	if (typeName _tree_id != "STRING") exitWith {};
	if (_tree_id == "") exitWith {};
	
	tree_registry set [count(tree_registry), _tree_id];
};


tree_hide = {
	player groupChat format["tree_hide %1", _this];
	ARGV(0,_tree);
	ARGV(1,_target);
	
	private["_grade"];
	_grade = [(getPos _tree)] call tree_average_grade;
	player grouPchat format["AVERGAGE GRADE: %1", _grade];
	
	if (_grade > 15) exitWith {
		_tree setDamage 1;
	};

	
	if (not((damage _tree) >= 1)) then {
		_tree setDamage 1;
		sleep 2;
	};
	
	if (typeName _target == "OBJECT" && {local(_target)}) then {
		[_tree] call tree_local_hide;
	}
	else {
		[[_tree], "tree_local_hide", _target, false] call BIS_fnc_MP;
	};
	
	if ((damage _tree) >= 1) then {
		sleep 2;
		_tree setDamage 0;
	};
	
};


tree_set_dead = {
	ARGV(0,_tree);
	ARGV(1,_state);
	if (undefined(_tree)) exitWith {};
	missionNamespace setVariable [format["%1_dead", netId(_tree)], _state];
};

tree_dead = {
	ARGV(0,_tree);
	if (undefined(_tree)) exitWith {false};
	(missionNamespace getVariable [format["%1_dead", netId(_tree)], false])
};

tree_local_hide = { _this spawn {
	player groupChat format["tree_local_hide %1", _this];
	ARGV(0,_tree);
	if ([_tree] call tree_dead) exitWith {};	
	_tree setVectorDirAndUp [([(vectorDir _tree), -1] call BIS_fnc_vectorMultiply), ([(vectorUp _tree), -1] call BIS_fnc_vectorMultiply)];
	[_tree, true] call tree_set_dead;
};};



tree_sort_by_distance = {
	ARGV(0,_location);
	ARGV(1,_unsorted_tree_list);
	
	if (undefined(_unsorted_tree_list)) exitWith {};
	if (typeName _unsorted_tree_list != "ARRAY") exitWith {};
	if (undefined(_location)) exitWith {_unsorted_tree_list};
	if (typeName _location != "ARRAY") exitWith {_unsorted_tree_list};
	if ((count _location) != 3) exitWith {_unsorted_tree_list};
	
	private["_list_to_sort", "_i", "_count"];
	_list_to_sort = [];
	_i = 0;
	_count = count _unsorted_tree_list;
	while {_i < _count} do {
		private["_tree_id", "_distance", "_object"];
		_tree_id = _unsorted_tree_list select _i;
		_object = objectFromNetId _tree_id;
		_distance = _location distance _object;
		_element = [];
		_element set [sort_key, _distance];
		_element set [sort_data, _object];
		_list_to_sort set[_i, _element];
		_i = _i + 1;
	};
	
	_list_to_sort call quicksort;
	_list_to_sort
};


tree_joined_sync = {
	player groupChat format["tree_joined_sync: start"];
	private["_player"];
	_player = player;
	
	private["_object", "_jip_variable"];
	_object = player;
	_jip_variable = "tree_registry";
	
	private["_tree_registry"];
	_tree_registry = [_object, _jip_variable, {sleep (_this select 0);}] call jip_wait;

	diag_log str(_tree_registry);
	
	private["_sorted_list"];
	_sorted_list = [getPos player, _tree_registry] call tree_sort_by_distance;
	
	diag_log str(_sorted_list);
	

	{
		private["_tree"];
		_tree = _x select sort_data;
		private["_pvup", "_tvup"];
		_pvup = vectorUp _player;
		_tvup = vectorUp _tree;
		
		private["_angle"];
		_angle = [_pvup, _tvup] call vector_angle;
		
		if (_angle < 150) then {
			[_tree, _player] call tree_hide;
		};
	} forEach _sorted_list;
	player groupChat format["tree_joined_sync: complete"];
};

tree_create_item = {
	ARGV(0,_position);
	private["_object"];
	_object = createVehicle ["Land_WoodPile_F", _position, [] , 0, "NONE"];
	[_object, true] call object_baptize;
	[_object, "wood", 1] call object_item_set_data;
};



tree_average_grade = {
	ARGV(0,_pos);
	
	private["_i", "_px", "_py", "_step", "_x", "_y", "_angle"];
	_i = 360;
	_radius = 10;
	_step = 4;
	_px = _pos select 0;
	_py = _pos select 1;
	
	private["_total", "_count"];
	_total = 0;
	_count = 0;
	while { _i > 0 } do {
		_x = _px + _radius * cos(_i);
		_y = _py + _radius * sin(_i);
		_angle = [(surfaceNormal [_x, _y]), [0,0,1]] call vector_angle;
		//player groupchat format["_x = %1, _y = %2, _a = %3", _x, _y, _angle];
		_total = _total +  _angle;
		_i = _i - _step;
		_count = _count + 1;
	};
	(_total / _count)
};


if (isServer) then {
	player groupChat format["server side tree-setup: start"];
	[] call tree_register_setup;
	player groupChat format["server side tree-setup: complete"];
};

if (isClient) then {
	//wait until the server side has been setup
	player groupChat format["client side tree-setup: start"];
	waitUntil {(server getVariable ["tree_register_setup_complete", false])};
	[] call tree_joined_sync;
	player groupChat format["client side tree-setup: complete"];
};

tree_functions_defined = true;
