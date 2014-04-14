#include "macro.h"
if (not(undefined(object_functions_defined))) exitWith {null};

object_hide = {
	ARGV(0,_object);
	ARGV(1,_state);
	if (undefined(_object)) exitWith {};
	if (undefined(_state)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (typeName _state != "BOOL") exitWith {};
	
	_object hideObject _state;
};

object_setVariable = {
	ARGV(0,_object);
	ARGV(1,_variable_name);
	ARGV(2,_variable_value);
	ARGV(3,_remote);

	if (undefined(_remote)) then {
		_remote =  false;
	};
	
	if (undefined(_variable_name)) exitWith {null};
	
	private["_storage_object"];
	_storage_object = _object getVariable ["storage", null];
	if (defined(_storage_object)) then {
		_object = _storage_object;
	};
	
	//player groupChat format["%1 setVariable [""%2"", %3, %4];", _object, _variable_name, _variable_value, _remote];
	if (undefined(_variable_value)) then {
		_object setVariable [_variable_name, nil, _remote];
	}
	else {
		_object setVariable [_variable_name, _variable_value, _remote];
	};
};


object_getVariable = {
	ARGV(0,_object);
	ARGV(1,_variable_name);
	ARGV(2,_default);
	if (typeName _object != "OBJECT") exitWith {null};
	if (undefined(_variable_name)) exitWith {null};
	if (undefined(_default)) then {
		_default = null;
	};
	
	
	private["_storage_object"];
	_storage_object = _object getVariable ["storage", _object];
	if (not(isNull _storage_object)) then {
		_object = _storage_object;
	};
	
	//player groupChat format["_object = %1", _object];
	private["_result"];
	_result = _object getVariable [_variable_name, _default];

	if (undefined(_result)) exitWith {_default};
	_result
};




object_createStorage = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {null};
	
	private["_storage_object", "_player_uid"];
	_storage_object = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	_storage_object hideObject true;
	[[_storage_object, true], "object_hide", true, true, _storage_object] call jip_register;
	_player_uid = (getPlayerUID _player);
	server setVariable [format["%1_storage", _player_uid], _storage_object, true];
	_player setVariable ["storage", _storage_object, true];
	_storage_object setVariable ["storage", _storage_object, true];
	//player groupChat format["created: _storage_object = %1", _storage_object];
	//player groupChat format["created2: %1", ([_player] call object_getStorage)];
	_storage_object
};

object_attachStorage = {
	ARGV(0,_player);
	private["_storage_object"];
	_storage_object = [_player] call object_getStorage;
	//player groupChat format["_storage_object = %1", _storage_object];
	if (undefined(_storage_object)) exitWith {null};
	_storage_object attachTo [_player, [0,0,0]];
	_player setVariable ["storage", _storage_object, true];
};

object_getStorage = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {null};
	
	private["_player_uid", "_storage_object"];
	_player_uid = (getPlayerUID _player);
	_storage_object = server getVariable [format["%1_storage", _player_uid], null];
	if (undefined(_storage_object)) exitWith {null};
	_storage_object
};

object_exists = {
	ARGV(0,_object);
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	true
};



object_fake_attach = {
	ARGV(0,_source);
	ARGV(1,_target);
	ARGV(2,_offset);
	ARGV(3,_heading);
	ARGV(4,_attached);

	if (undefined(_heading)) then {
		_heading = [0,0,0];
	};
	
	_source attachTo [_target, _offset];
	[_source, _heading] call object_set_heading;
	
	if (undefined(_attached) || {not(_attached)}) then {
		//hack to have the objects not being attached
		_source attachTo [_source, [0,0,0]];
		detach _source;
	};
};

object_set_heading = {
	ARGV(0,_object);
	ARGV(1,_data);
	
	private["_vectors"];
	_vectors = [_data] call object_calcualte_vectors;
	_object setVectorDirAndUp _vectors;
};



object_calcualte_vectors = {
	ARGV(0,_data);
	private["_direction", "_angle", "_pitch"];
	
	_direction = _data select 0;
	_angle = _data select 1;
	_pitch = _data select 2;
	
	_vecdx = sin(_direction) * cos(_angle);
	_vecdy = cos(_direction) * cos(_angle);
	_vecdz = sin(_angle);

	_vecux = cos(_direction) * cos(_angle) * sin(_pitch);
	_vecuy = sin(_direction) * cos(_angle) * sin(_pitch);
	_vecuz = cos(_angle) * cos(_pitch);
	
	private["_dir_vector"];
	private["_up_vector"];
	_dir_vector = [_vecdx,_vecdy,_vecdz];
	_up_vector = [_vecux,_vecuy,_vecuz];
	
	([_dir_vector, _up_vector])
};

object_set_owner = {
	private["_object", "_owner"];
	_object = _this select 0;
	_owner = _this select 1;
	
	if (not(isServer)) exitWith {};
	if (isNil "_object" || {typeName _object != "OBJECT" || {isNull _object}}) exitWith {};
	if (isNil "_owner" || {typeName _owner != "OBJECT" || {isNull _owner}}) exitWith {};
	
	_object setOwner (owner _owner);
};

object_create_attach_ref = {
	private["_object"];
	_object = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	_object setPos [0,0,0];
	[_object, [0,0,0]] call object_set_heading;
	_object
};

object_setVectorUp = {
	ARGV(0,_object);
	ARGV(1,_vector);
	if (not([_object] call object_exists)) exitWith {};
	if (undefined(_vector)) exitWith {};
	if (typeName _vector != "ARRAY") exitWith {};
	
	_object allowDamage false;
	_object setVectorUp _vector;
	_object allowDamage true;
};



object_baptize = {
	private["_object", "_persistent"];
	_object = _this select 0;
	if (isNil "_object" || {typeName _object != "OBJECT" || { isNull _object}}) exitWith {};
	
	private["_player"];
	_player =  player;
	
	_persistent = false;
	if ((count _this) > 1) then {
		_persistent = _this select 1;
	};
	
	private["_item"];
	_item =  _object getVariable ["item", ""];
	if (_item != "") exitWith {};
	
	private["_class"];
	_class = typeOf _object;
	private["_info"];
	_infos = ITEM_DATA(_class);
	if (count(_infos) == 0) exitWith {};
	
	player grouPChat format["Baptizing %1", _object];
	private["_object_name"];
	_object_name = format["%1_%2_%3_%4", _class, (getPlayerUID _player), round(time), round(random(time))];
	
	if (_persistent) then {
		[[_object, _object_name], "object_name_init_handler", true, true, _object] call jip_register;
		waitUntil {not(isNil _object_name)};
	}
	else {
		[_object, _object_name] call object_name_init_handler;
	};

	[_object, _class, 1] call object_item_set_data;
};


object_name_init_handler = {
	ARGV(0,_object);
	ARGV(1,_name);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_name)) exitWith {};
	if (isNull _object) exitWith {};
	if (typeName _name != "STRING") exitWith {};
	
	missionNamespace setVariable [_name, _object];
	_object setVehicleVarName _name;
};


object_item_set_data = {
	//player groupChat format["object_item_set_data %1", _this];
	ARGV(0,_object);
	ARGV(1,_item);
	ARGV(2,_amount);
	ARGV(3,_data);
	
	if (undefined(_object)) exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	

	private["_name", "_type", "_class", "_label_template"];
	_name = MASTER_ARRAY_ITEM_NAME(_item);
	_type = MASTER_ARRAY_ITEM_TYPE(_item);
	_class = typeOf _object;
	_icon = [_item, _class, _type] call object_icon;
	
	[_object, _item] call object_item_update_template;
	[_object, "item", _item, true] call object_setVariable;
	[_object, "name", _name, true] call object_setVariable;
	[_object, "icon", _icon, true] call object_setVariable;
	[_object, "type", _type, true] call object_setVariable;
	[_object, _amount] call object_item_update_amount;
	
	if (not(undefined(_data))) then {
		[_object, "data", _data, true] call object_setVariable;
	};
};


object_item_update_amount = {
	//player groupChat format["object_item_update_amount %1", _this];
	ARGV(0,_object);
	ARGV(1,_amount);
	
	if (typeName _object != "OBJECT") exitWith {};
	if (undefined(_amount)) exitWith {};
	
	private["_label_template"];
	_label_template = [_object, "label_template", ""] call object_getVariable;
	[_object, "label", format[_label_template, _amount], true] call object_setVariable;
	[_object, "amount", ([_amount] call encode_number), true] call object_setVariable;
};

object_item_update_template = {
	ARGV(0,_object);
	ARGV(1,_item);
	
	if (typeName _object != "OBJECT") exitWith {};
	if (typeName _item != "STRING") exitWith {};
	
	_name = MASTER_ARRAY_ITEM_NAME(_item);
	private["_label_template", "_prefix"];
	_prefix = if (_item == "money") then {"$"} else{""};
	_label_template = format["%1 (%2)", _name, _prefix + "%1"];
	[_object, "label_template", _label_template, true] call object_setVariable;
};

object_nonNetwork_convert = {
	player groupChat format["object_nonNetwork_convert %1", _this];
	ARGV(0,_object);
	if (undefined(_object)) exitWith {objNull};
	
	
	player groupChat format["TYPE: %1", typeName _object];
	//if (true) exitWIth {_object};

	if ((netId _object) != "0:0") exitWith {_object};
	
	private["_class"];
	_class = typeOf _object;
	
	private["_new_object"];

	//player groupChat format["damage = %1", (damage _object)];
	_new_object = createAgent [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
	if (not(alive _object)) then {
		//player groupChat format["Object was dead!"];
		_new_object setDamage 1;
	};
	 
	_new_object attachTo [_object, [0,0,0]];
	[_new_object, true] call object_baptize;
	detach _new_object;
	deleteVehicle _object;
	player groupChat format["_new_object = %1", _new_object];
	_new_object
};

remote_playActionNow = {
	ARGV(0,_player);
	ARGV(1,_action);
	if (undefined(_player)) exitWith {};
	if (undefined(_action)) exitWith {};
	
	_player playActionNow _action;
};

object_underwater_bleed = { _this spawn {
	ARGV(0,_object);
	ARGV(1,_duration);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_duration)) exitWith {};
	
	
	private["_timeout"];
	_timeout = time + _duration;
	waitUntil {
		drop[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 9, 0], "", "Billboard", 0, 10, [random 0.1,random 0.1, random 0.1],[0,0,0], random 2, 12.75, 10.025, 0, [0.2, (random 1.5) + 0.5],  [[0.2,0,0,0.5],[0.2,0,0,0.4],[0.2,0,0,0.3],[0.2,0,0,0.22],[0.2,0,0,0.16],[0.2,0,0,0.08],[0.2,0,0,0.01]],[0.4,0.1], 0, 3, "", "", _object];
		sleep 0.05;
		(time > _timeout)
	}
};};


object_item_icon = { 
	ARGV(0,_item);
	
	if (undefined(_item)) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	
	private["_data"];
	_data = ITEM_DATA(_item);
	if (count(_data) == 0) exitWith {""};
	
	private["_icon"];
	_icon = ITEM_DATA_ICON(_data);
	
	if (undefined(_icon) || {_icon == ""}) exitWith{
		private["_class"];
		_class = ITEM_DATA_CLASS(_data);
		_icon = [_class] call generic_icon_path;
		(_icon call BIS_fnc_textureVehicleIcon)
	};
		
	_icon
};

object_icon = {
	//player groupChat format["object_icon %1", _this];
	ARGV(0,_item)
	ARGV(1,_class);
	ARGV(2,_type);

	if (toLower(_type) == "item") exitWith {
		//player groupChat format["_item = %1, _type = %2", _item, _type];
		private["_icon"];
		_icon = ([_item] call object_item_icon);
		//player groupChat format["_icon = %1", _icon];
		_icon
	};
	
	private["_picture"];
	_picture = ([_class] call generic_picture_path);	
	_picture
};

object_nearest_strstr = {
	ARGV(0,_position);
	ARGV(1,_str);
	ARGV(2,_distance);
	
	if (undefined(_position)) exitWith {null};
	if (undefined(_str)) exitWith {null};
	if (undefined(_distance)) exitWith{null};
	if (typeName _position != "ARRAY") exitWith {null};
	if (typeName _str != "STRING") exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	
	 private["_objects", "_object"];
	 _object = objNull;
	 _objects = (nearestObjects [_position, [], _distance]);
	 //player groupChat format["_objects = %1", _objects];
	 {
		private["_cobject"];
		_cobject = _x;
		if ([_str, str(_cobject)] call BIS_fnc_inString) exitWith {
			_object = _cobject;
		};
	 } forEach _objects;
	 
	 if (isNull _object) exitWith {null};
	 
	 _object
};

remote_hideObject = {
	ARGV(0,_object);
	ARGV(1,_state);
	if (undefined(_object)) exitWith {};
	if (undefined(_state)) exitWith {};
	_object hideObject _state;
};

object_atm_classes = ["Man", "Land_CargoBox_V1_F", "BarrelBase", "Barrels", "Land_Laptop_unfolded_F", "Land_CampingTable_F", "Land_CampingTable_small_F"];
object_atm = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in bankflagarray)
};

object_shop = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in shopusearray)
};

object_vendor = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
		
	(_object in vendors_list)
};

object_item = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	private["_item"];
	_item = _object getVariable ["item", ""];
	not(_item == "")
};


object_in_water = {
	ARGV(0,_object);
	if (not([_object] call object_exists)) exitWith {false};
	
	private["_pos"];
	_pos = _object modelToWorld [0,0,0];
	
	if (not(surfaceIsWater _pos)) exitWith {false};
	if ((_pos select 2) >= 0) exitWith {false};
	true
};

object_remote_attach = {
	ARGV(0,_object);
	ARGV(1,_target);
	ARGV(2,_offset);
	_object attachTo [_target, _offset];
};



object_editor_create = {
	//player grouPChat format["object_editor_create %1", _this];
	private["_class", "_offset", "_heading", "_damage", "_simulation", "_attached", "_name", "_hidden", "_ref"];
	ARGV(0,_class);
	ARGV(1,_offset);
	ARGV(2,_heading);
	ARGV(3,_damage);
	ARGV(4,_simulation);
	ARGV(5,_attached);
	ARGV(6,_name);
	ARGV(7,_hidden);
	ARGV(8,_id);
	ARGV(9,_zref);
	ARGV(10,_ref);
	
	private["_roffset"];
	_roffset = _ref modelToWorld _offset;
	private["_object"];
	_object = createVehicle [(_this select 0), _roffset, [], 0, "CAN_COLLIDE"];
	_object enableSimulation false;
	_object allowDamage _damage;
	
	if (_zref) then {
		[_object, _ref,  (_ref worldToModel _offset), _heading, _attached] call object_fake_attach;
	}
	else {
		[_object, _ref, _offset, _heading, _attached] call object_fake_attach;
	};
	
	//it's important that we attach before setting simulation, otherwise the object may drop some distance before simulation is disabled
	_object enableSimulation _simulation;
	_object setVariable ["tracked", true];
	_object setVariable ["offset", (_object modelToWorld [0,0,0]), true];
	_object setVariable ["heading", _heading, true];
	
	if (_damage) then {
		_object setVariable ["damage", _damage, true];
	};
	
	if (_attached) then {
		_object setVariable ["attached", _attached, true];
	};
	
	if (_hidden) then {
		[[_object, true], "remote_hideObject", true, true, _object] call jip_register;
		_object setVariable ["hidden", _hidden, true];
	};
	
	if (_name != "") then {
		_name = _name + _id;
		missionNamespace setVariable [_name, _object];
		_object setVehicleVarName _name;
		_object setVariable ["name", _name, true];
		publicVariable _name;
	};
	
	_object
};

object_create_attach_reference = {
	object_attach_reference = "Sign_Sphere10cm_F" createVehicle [0,0,0];
	object_attach_reference setPosASL [0,0,0];
	private["_heading"];
	_heading = [0,0,0];
	[object_attach_reference, _heading] call object_set_heading;
	[object_attach_reference, "heading", _heading] call object_setVariable;
};

[] call object_create_attach_reference;
[player] call object_createStorage;

object_functions_defined = true;