#include "macro.h"
if (not(undefined(vehicle_storage_functions_defined))) exitWith {null};

vehicle_storage_exists = {
	ARGV(0,_id);
	if (undefined(_id)) exitWith {false};
	if (typeName _id != "STRING") exitWith {false};
	
	([_id] call list_exists)
};

vehicle_storage_create = {
	//player groupChat format["vehicle_storage_create %1", _this];
	ARGV(0,_id);
	ARGV(1,_name);
	
	if ([_id] call vehicle_storage_exists) exitWith {null};
	[_id, _name] call list_create;
};

vehicle_storage_contains = {
	//player groupChat format["vehicle_storage_contains %1", _this];
	ARGV(0,_id);
	ARGV(1,_vehicle_id);
	([_id, _vehicle_id] call list_contains_key)
};


vehicle_storage_data_entry_id = 0;
vehicle_storage_data_entry_class = 1;
vehicle_storage_data_entry_uid = 2;

vehicle_storage_put = {
	//player groupChat format["vehicle_storage_put %1", _this];
	ARGV(0,_id);
	ARGV(1,_player);
	ARGV(2,_vehicle);

	if (not([_id] call vehicle_storage_exists)) exitWith {null};
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	private["_player_vehicle"];
	_player_vehicle = [_vehicle, "isPlayerVehicle"] call object_getVariable;
	_player_vehicle = if (undefined(_player_vehicle)) then {false} else {_player_vehicle};
	_player_vehicle = if (typeName _player_vehicle != "BOOL") then {false} else {_player_vehicle};
	
	if (not(_player_vehicle)) exitWith {null};
	
	private["_vehicle_id", "_vehicle_class", "_player_uid"];
	_vehicle_class = typeOf _vehicle;
	_vehicle_id = str(_vehicle);
	_player_uid = getPlayerUID _player;
	
	private["_data"];
	_data = [];
	_data set [vehicle_storage_data_entry_id, _vehicle_id];
	_data set [vehicle_storage_data_entry_class, _vehicle_class];
	_data set [vehicle_storage_data_entry_uid, _player_uid];
	
	[_id, _vehicle_id, _data] call list_put_value;
};

vehicle_storage_remove = {
	//player groupChat format["vehicle_storage_remove %1", _this];
	ARGV(0,_id);
	ARGV(1,_vehicle_id);
	
	([_id, _vehicle_id] call list_remove_key)
};

vehicle_storage_id = 0;
vehicle_storage_title = 1;
vehicle_storage_data_keys = 2;
vehicle_storage_data_entries = 3;

vehicle_storage_data = {
	//player groupChat format["vehicle_storage_data %1", _this];
	ARGV(0,_id);
	if (not([_id] call vehicle_storage_exists)) exitWith {null};
	([_id] call list_data)
};

//find the specific vehicle entry with the given id
vehicle_storage_get = {
	//player groupChat format["vehicle_storage_get %1", _this];
	ARGV(0,_id);
	ARGV(1,_vehicle_id);
	([_id, _vehicle_id] call list_get_value)
};

//find all the vehicle entries for a given player
//(not necesarily the vehicle owner, it's the player who added the vehicle to the storage)
vehicle_storage_list = {
	//player groupChat format["vehicle_storage_list %1", _this];
	ARGV(0,_id);
	ARGV(1,_player);
	
	if (not([_player] call player_exists)) exitWith {[]};
	
	private["_uid"];
	_uid = getPlayerUID _player;
	
	private["_data"];
	_data = [_id] call vehicle_storage_data;
	if (undefined(_data)) exitWith {[]};
	
	private["_data_values", "_result"];
	_result = [];
	_data_values = _data select vehicle_storage_data;
	
	{
		private["_vehicle_data", "_player_uid"];
		_vehicle_data = _x;
		_player_uid = _vehicle_data select vehicle_storage_data_entry_uid;
		if (_player_uid == _uid) then {
			_result set [count(_result), _vehicle_data];
		};
	} forEach _data_value;
	
	(_result)
};


vehicle_storage_init = {
	if(not(isServer)) exitWith {null};
	//player groupChat format["vehicle_storage_init %1", _this];
	
	["impound_lot", "Vehicle Impound Lot"] call vehicle_storage_create;
};


[] call vehicle_storage_init;


vehicle_storage_functions_defined = true;