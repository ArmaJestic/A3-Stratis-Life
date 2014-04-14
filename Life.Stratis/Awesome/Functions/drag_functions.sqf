#include "constants.h"
#include "macro.h"

if (not(undefined(drag_functions_defined))) exitWith {};





drag_attach_class = 0;
drag_attach_points = 1;
drag_attach_point_selection_name = 0;
drag_attach_point_selection_id = 1;
drag_attach_point_offset = 2;
drag_attach_point_heading = 3;


drag_attach_data =
[
	["Skeet_Clay_F", [["Left Hand", "LeftHandMiddle1", [0,0,-0.05], [90,90,0]]]],
	["Land_HandyCam_F", [["Left Hand", "LeftHandMiddle1", [0,0,-0.05], [180,0,0]]]],
	["CatShark_F", [["Left Hand", "LeftHandMiddle1", [0.1,0.3,-0.25], [10,-35,0]]]],
	["Rabbit_F", [["Left Hand", "LeftHandMiddle1", [0,-0.1,0.35], [-10,-45,90]]]],
	["Tuna_F", [["Left Hand", "LeftHandMiddle1", [0.1,0.45,-0.32], [10,-35,0]]]],
	["Mackerel_F", [["Left Hand", "LeftHandMiddle1", [0.02,0.1,-0.1], [5,-35,0]]]],
	["Salema_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.1], [0,0,0]]]],
	["Land_Bucket_F", [["Left Hand", "LeftHandMiddle1", [-0.115,0,-0.15], [0,0,0]]]],
	["Land_File2_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.1], [0,0,-90]]]],
	["Land_Axe_fire_F", [["Left Hand", "LeftHandMiddle1", [0,0.2,-0.1], [90,-90,0]]]],
	["Land_Shovel_F", [["Left Hand", "LeftHandMiddle1", [0,0.2,-0.15], [0,-30,0]]]],
	["Land_Axe_F", [["Left Hand", "LeftHandMiddle1", [0,0.2,0], [90,90,0]]]],
	["Land_Money_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,0], [0,0,-90]]]],
	["Land_Suitcase_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.18], [90,0,0]]]],
	["Land_CanisterFuel_F", [["Right Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.28], [-90,0,0]]]],
	["Land_Grinder_F", [["Right Hand", "LeftHandMiddle1", [-0.05,0,0], [180,0,0]]]],
	["Land_File_F", [["Right Hand", "LeftHandMiddle1", [0,0.1,0], [180,0,0]]]],
	["Land_CanisterPlastic_F", [["Left Hand", "LeftHandMiddle1", [-0.3,-0.05,-0.27], [0,0,25]]]]
];

drag_attach_index = [];
{
	private["_entry", "_class"];
	_entry = _x;
	_class = _entry select drag_attach_class;
	drag_attach_index set [_forEachIndex, _class];
} forEach drag_attach_data;

drag_remote_attach = { _this spawn {
	player grouPChat format["drag_remote_attach %1", _this];
	ARGV(0,_object);
	ARGV(1,_player);
	
	detach _object;
	[_object, "last_holder", _player, true] call object_setVariable;
	

	private["_class", "_selection", "_point", "_weapon"];
	_class = typeOf _object;
	_selection = "LeftHandMiddle1";
	_point = [_class, _selection] call  drag_attach_lookup_class_selection;
	_weapon = currentWeapon _player;
	

	
	if (_weapon == "" && not(undefined(_point))) exitWith {
		private["_heading", "_offset"];
		_heading = _point select drag_attach_point_heading;
		_offset = _point select drag_attach_point_offset;
		sleep 1;
		_object attachTo [_player, _offset, _selection];
		[_object, _heading] call object_set_heading;
	};
	
	private["_offset", "_up", "_dir"];
	//_up = vectorUp _object;
	_offset = _player worldToModel (_object modelToWorld [0,0,0]);
	_dir = [(_player worldToModel ([(vectorDir _object), (getPos _object)] call vector_add)), _offset] call vector_substract;
	_dir = [_dir] call vector_nomalize;
	
	_up = [(_player worldToModel ([(vectorUp _object), (getPos _object)] call vector_add)), _offset] call vector_substract;
	_up = [_up] call vector_nomalize;
	
	sleep 1;
	_object attachTo [_player, _offset];
	_dir set [2, 0];
	_object setVectorDirAndUp [_dir , (vectorUp _player)];
};};


weightless_classes = ["Land_WoodPile_F", "Animal", "Land_MetalBarrel_F"];
drag_object_weightless = {
	ARGV(0,_object);
	if (undefined(_object)) exitWith {false};
	
	private["_weightless"];
	_weightless = false;
	{
		if (_object isKindOf _x) exitWith {
			_weightless = true;
		};
	} forEach weightless_classes;
	_weightless
};



drag_remote_detach = {
	player grouPChat format["drag_remote_detach %1", _this];
	ARGV(0,_object);
	ARGV(1,_player);
	
	if (undefined(_object)) exitWith {};
	detach _object;
	
	
	//player grouPChat format["ishelper %1", (_object isKindOf "Helper_Base_F")];
	
	if (([_object] call drag_object_weightless) && {not(surfaceIsWater position _object)}) then {
		private["_pos"];
		_pos =  getPos _object;
		_pos set [2,0];
		
		if (_object isKindOf "Animal") then {
			_object setPos _pos;
			_object setVectorUp [0,0,1];
		}
		else {
			private["_vup", "_vdir"];
			_vup = vectorUp _object;
			_vdir = vectorDir _object;
			_object setPos _pos;
			_object setVectorDirAndUp [_vdir, [0,0,1]];
		};
	}
	else { if (_object isKindOf "Skeet_Clay_F") then {
		_object setVectorUp [0,0,1];
	};};
	
	private["_last_holder"];
	_last_holder = [_object, "last_holder", objNull] call object_getVariable;
	if (_last_holder == _player) then {
		player groupChat format["Usetting last holder"];
		[_object, "last_holder", nil, true] call object_setVariable;
	};
	
	if (not(isPlayer _object)) exitWith {};
	if (undefined(_player)) exitWith {};

	private["_pos", "_off"];
	_off = _player worldToModel (_object modelToWorld [0,0,0]);
	_pos = ATLtoASL(_player modelToWorld _off);
	private["_z_terrain", "_z_player"];
	_z_player = _pos select 2;
	_z_terrain = getTerrainHeightASL _pos;
	if (_z_player < _z_terrain) then {
		_pos set [2, _z_terrain];
	};
	_object setPosASL (_pos);
};




drag_object_attach = {
	player grouPChat format["drag_object_attach %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);

	if (not([_player] call player_exists)) exitWith {};
	if (not([_object] call object_exists)) exitWith {};
	
	_object = [_object] call object_nonNetwork_convert;

	private["_last_holder"];
	_last_holder = [_object, "last_holder", objNull] call object_getVariable;
	if (isNull _last_holder) then {
		[] call interact_play_pickup_animation;
	}
	else {
		_player playActionNow "PutDown";
	};
	
	if (not(local _object)) then {
		player groupChat format["object is NOT lcoal"];
		[[_object, _player], "drag_remote_attach", _object, false] call BIS_fnc_MP;
	}
	else {
		player groupChat format["object is local"];
		[_object, _player] call drag_remote_attach;
	};


	
	player groupChat format["Waiting for last holder"];
	waitUntil {
		
		_last_holder = [_object, "last_holder", objNull] call object_getVariable;
		//player groupChat format["_last_holder = %1", _last_holder];
		(_last_holder == _player)
	};
	
	player groupChat format["Last holder wait complete"];

	[_player, "held_target", _object, true] call object_setVariable;
	
	[_player, _object] call drag_object_add_attach_actions;
	
	_player forceWalk true;
	waitUntil {
		//player groupChat format["_object = %1", _object];
		if (isNil "_player" || {isNull _player || {not(alive _player) || {not((vehicle _player) == _player)}}}) exitWith {true};
		if (isNil "_object" || {isNull _object || {isPlayer _object && {not(alive _object)}}}) exitWith {true};
		if (not([_player] call drag_object_active)) exitWith {true};
		
		//player groupChat format["owner(object) = %1, owner(player) = %2", (owner _object), (owner player)];
		private["_last_holder"];
		_last_holder = [_object, "last_holder", objNull] call object_getVariable;
		//player groupChat format["_last_holder = %1", _last_holder];
		if (not(_last_holder == _player)) exitWith {true};
		
		false
	};
	
	[[_player]] call drag_object_release;
	_player forceWalk false;
	//[[_object, _player], "drag_remote_detach", _object, false] call BIS_fnc_MP;
	
	if (not(local _object)) then {
		[[_object, _player], "drag_remote_detach", _object, false] call BIS_fnc_MP;
	}
	else {
		[_object, _player] call drag_remote_detach;
	};
	
	[_player] call drag_object_remove_attach_actions;
};




drag_object_active = {
	ARGV(0,_player);

	private["_held_target"];
	_held_target = [_player, "held_target", objNull] call object_getVariable;
	if (isNull _held_target) exitWith {false};
	
	
	private["_last_holder"];
	_last_holder = [_held_target, "last_holder", objNull] call object_getVariable;
	(_last_holder == _player)
};





drag_object_release = {
	ARGV(0,_this);
	ARGV(0,_player);
	
	[_player, "held_target", nil, true] call object_setVariable;
};


drag_object_label = {
	ARGV(0,_object);
	if (undefined(_object)) exitWith {""};
	
	if (not(isNull _object) && {isPlayer _object}) exitWith {name _object};
	(_object getVariable ["label", "item"])
};




drag_attach_lookup_class = {
	ARGV(0,_class);
	if (undefined(_class)) exitWith {null};
	if (typeName _class != "STRING") exitWith {null};
	
	private["_entry_index"];
	_entry_index = (drag_attach_index find _class);
	if (_entry_index == -1) exitWith {null};
	
	private["_entry"];
	_entry = drag_attach_data select _entry_index;
	_entry
};


drag_attach_lookup_class_selection = {
	ARGV(0,_class);
	ARGV(1,_selection);
	
	if (undefined(_class)) exitWith {null};
	if (undefined(_selection)) exitWith {null};
	
	private["_entry"];
	_entry = [_class] call drag_attach_lookup_class;
	
	if (undefined(_entry)) exitWith {null};
	private["_points"];
	_points =  _entry select drag_attach_points;
	
	private["_point"];
	_point = null;
	{
		private["_cselection", "_cpoint"];
		_cpoint = _x;
		_cselection = _cpoint select drag_attach_point_selection_id;
		if (_cselection == _selection) exitWith {
			_point = _cpoint;
		};
	} forEach _points;
	_point
};


drag_put_vehicle_active = {
	ARGV(0,_player);
	ARGV(1,_object);
	
	private["_vehicle"];
	_vehicle = cursorTarget;
	if ((isNull _vehicle) || {not(_vehicle isKindOf "LandVehicle")}) exitWith {false};
	
	if ((isPlayer _object) && {(locked _vehicle < 2) && {([_vehicle] call vehicle_empty_cargo_slots) > 0}}) exitWith {true};

		
	false
};

drag_target_vehicle = {
	private["_vehicle"];
	_vehicle = nearCursorTarget;
	if ((isNull _vehicle) || {not(_vehicle isKindOf "LandVehicle")}) exitWith {null};
	_vehicle
};

interact_object_put_vehicle = {
	ARGV(0,_this);
	ARGV(0,_player);
	ARGV(1,_object);
	
	if (not([_player] call player_exists)) exitWith {};
	if (not([_object] call object_exists)) exitWith {};
	
	private["_vehicle"];
	_vehicle =  call drag_target_vehicle;
	if (undefined(_vehicle)) exitWith {};

	if ((isPlayer _object) && {(locked _vehicle < 2) && {([_vehicle] call vehicle_empty_cargo_slots) > 0}}) exitWith {
		[[_object, _vehicle, true], "player_enter_vehicle_cargo", _object, false] call BIS_fnc_MP;
		
		[[_player]] call drag_object_release;
	};
};




drag_take_object_available = {
	//player grouPChat format["drag_take_object_available %1", _this];
	ARGV(0,_player);
	ARGV(1,_object);
	if (not([_player] call player_exists)) exitWith {false};
	if (undefined(_object)) exitWith {false};

	if ([_player] call drag_object_active) exitWith {false};
	//player groupChat format["_object = %1", _object];
	if (isNull _object) exitWith {false};
	
	if ((_player distance _object) > 2) exitWith {false};

	true
};


drag_put_inventory_avalable = {
	ARGV(0,_object);
	ARGV(1,_player);
	
	if (undefined(_object)) exitWith {false};
	if (undefined(_player)) exitWith {false};
	if (isNull _object) exitWith {false};
	if (isNull _player) exitWith {false};
	if (alive _object && {_object isKindOf "Animal" || {_object isKindOf "Man"}}) exitWith {false};
	
	([_player] call drag_object_active)
};



drag_take_object = {
	ARGV(0,_player);
	ARGV(1,_target);
	if (undefined(_player)) exitWith {};
	if (undefined(_target)) exitWith {};
	
	[_player] call drag_remove_action;
	[_player, _target] call drag_object_attach;
};


drag_add_action = {	
	ARGV(0,_player);
	ARGV(1,_target);
	if (undefined(_player)) exitWith {};
	if (undefined(_target)) exitWith {};
	if ([_player, "restrained", false] call object_getVariable) exitWith {};
	if (typeName _target != "OBJECT" || {isNull _target}) exitWith {};
	
	
	if ((_player distance _target) > 2) exitWith {};
	if (not(isPlayer _target) && {([_target, "item", ""] call object_getVariable) == ""}) exitwith {};
	if ((isPlayer _target) && {not([_target, "restrained", false] call object_getVariable)}) exitWith {};
	if (not([_target, "draggable", true] call object_getVariable)) exitwith {};
	
	
	private["_label"];
	_label = [_target] call drag_object_label;
		
	private["_action_id"];
	_action_id = _player addAction [
		format["Take %1", _label], "noscript.sqf", 
		format['[%1, objectFromNetId("%2")] call drag_take_object', _player, netId(_target)], 1, false, true, "", 
		format['([%1, objectFromNetId("%2")] call drag_take_object_available)',  _player, netId(_target)]
	];
	
	//player groupChat format["ADDED: _action_id = %1", _action_id];
	[_player, "active_target", _target] call object_setVariable;
	[_player, "active_action", _action_id] call object_setVariable;
	
};

drag_remove_action = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {};
	
	private["_active_actions"];
	_active_action = [_player, "active_action", -1] call object_getVariable;
	if (_active_action < 0) exitWith {};
	
	_player removeAction _active_action;
	
	[_player, "active_target", nil] call object_setVariable;
	[_player, "active_action", nil] call object_setVariable;
	
	//player groupChat format["REMOVED: _action_id = %1", _active_action];
};



drag_object_add_attach_actions = {
	ARGV(0,_player);
	ARGV(1,_object);
	
	
	private["_actions"];
	
	private["_action_id", "_label"];
	_label = [_object] call drag_object_label;
	private["_actions"];
	_actions = [];
	_action_id = _player addAction [format["Release %1", _label], "action.sqf",
		[[_player], "drag_object_release"],10,false,true,"", "([" + str(_player) + "] call drag_object_active)"];
	_actions set [count(_actions), _action_id];
	
	private["_type"];
	_type = [_object, "type", ""] call object_getVariable;
	if (not((_type == "Fort")  || (isPlayer _object))) then {
		_action_id = _player addAction [format["Put %1 in inventory", _label], "action.sqf",
		[[_player, _object], "interact_object_put"],10,false,true,"",  "([(objectFromNetId(" + str(netId(_object)) + ")), " + str(_player) + "] call drag_put_inventory_avalable)"];
		_actions set [count(_actions), _action_id];
	};
	
	
	_action_id = _player addAction [format["Put %1 in vehicle", _label], "action.sqf", 
		[[_player, _object], "interact_object_put_vehicle"],10,false,true,"", 
		"([" + str(_player) + "] call drag_object_active) && {([" + str(_player) + ", objectFromNetId("+  str(netId(_object)) + ")] call drag_put_vehicle_active)}"];
	_actions set [count(_actions), _action_id];
	
	private["_item_actions"];
	_item_actions = [_player, _object] call drag_object_add_item_actions;
	_actions = _actions + _item_actions;
	
	[_player, "attach_actions", _actions] call object_setVariable;
};

drag_object_remove_attach_actions = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {};
	
	private["_actions"];
	_actions = [_player, "attach_actions", []] call object_getVariable;
	{
		_player removeAction _x;
	} forEach _actions;
};



drag_object_add_item_actions = {
	ARGV(0,_player)
	ARGV(1,_object);
	
	private["_default"];
	_default = [];
	
	if (not([_player] call player_exists)) exitWith {_default};
	if (not([_object] call object_exists)) exitWith {_default};
	
	private["_item"];
	_item = [_object, "item", ""] call object_getVariable;
	if (_item == "") exitWith {_default};
	
	private["_data"];
	_data = _item call inventory_get_item_array;
	if (count(_data) == 0) exitWith {_default};
	
	private["_actions"];
	_actions = [];
	
	if (_item == "knife") then {
		//_action_id = _player addAction [format["Use knife", _label], "action.sqf", 
		//	[[_player, _object], "interact_use_knife"],10,false,true,"", 
		//	"([" + str(_player) + "] call drag_object_active) && {([" + str(_player) + ", "+  str(_object) + "] call interact_use_knife_available)}"];
		//_actions set [count(_actions), _action_id];
	};
	
	_actions
};

drag_functions_defined = true;