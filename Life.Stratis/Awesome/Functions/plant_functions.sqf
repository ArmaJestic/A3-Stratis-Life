#include "macro.h"
#include "constants.h"

if (not(undefined(plant_functions_defined))) exitWith {null};

plant_seed_data_id = 0;
plant_seed_data_name = 1;
plant_seed_data_model = 2;
plant_seed_data_life = 3;
plant_seed_data_scale = 4;
plant_seed_data_yield_item = 5;
plant_seed_data_field_markers = 6;
plant_seed_data_max = 7;


plant_seed_data = 
[
	["coca_seedling", "coca", "\a3\plants_f\bush\b_NeriumO2s_white_F.p3d",  300, [1,1], "Unprocessed_Cocaine", ["cocafield"], 15],
	["marijuana_seedling", "marijuana", "\a3\plants_f\bush\b_NeriumO2s_F.p3d",  300, [1,1], "Unprocessed_Marijuana", ["marifield"], 15],
	["poppy_seedling",  "poppy", "\a3\plants_f\bush\b_NeriumO2d_F", 300, [1,1], "Unprocessed_Heroin", ["heroinfield"], 15]
];


plant_seed_lookup_id = {
	ARGV(0,_id);
	if (undefined(_id)) exitWith {null};
	
	private["_data"];
	_data = null;
	
	{
		private["_cdata", "_cid"];
		_cdata = _x;
		_cid = _cdata select plant_seed_data_id;
		if (_cid == _id) exitWith {
			_data = _cdata;
		};
	} forEach plant_seed_data;
	_data
};


plant_seed_handler_persistent = { _this spawn {
	ARGV(0,_death_time);
	ARGV(1,_position_asl);
	ARGV(2,_seed_id);
	
	
	
	private["_seed_data"];
	_seed_data = [_seed_id] call plant_seed_lookup_id;
	if (undefined(_seed_data)) exitWith {};
	
	
	private["_model", "_scale"];
	_model = _seed_data select plant_seed_data_model;
	_scale = _seed_data select plant_seed_data_scale;
	
	private["_time"];
	_time = serverTime;
	if (_time > _death_time) exitWith {};
	
	private["_life_remaining"];
	_life_remaining = _death_time - _time;
	
	private["_particle", "_anchor"];
	_anchor = "Land_Can_V3_F" createVehicleLocal [0,0,0];
	_anchor hideObject true;
	_anchor setPosASL _position_asl;
	
	_particle = "#particlesource" createVehicleLocal _position_asl;
	_particle setParticleParams [_model, "", "SpaceObject", 0, _life_remaining, [0,0,-0.5], [0, 0, 0], 0,1.275,1,0, _scale, [[0, 1, 0 ,1], [0, 1, 0 ,1], [0, 1, 0 ,1]], [0,0], 0, 0, "", "", _anchor];
	_particle setDropInterval _life_remaining;
	sleep 1;
	deleteVehicle _anchor;
	deleteVehicle _particle;
};};


interact_plant_seedling = {_this spawn {
	ARGV(0,_player);
	ARGV(1,_item);
	ARGV(2,_amount);

	if (not([_player] call player_exists)) exitWith {};
	if (undefined(_item)) exitWith {};
	if (undefined(_amount)) exitWith {};
	
	if (_amount != 1) exitWith {
		player groupChat format["You can only plant one seedling at a time"];
	};
	
	private["_delay"];
	_delay = 60;
	

	private["_seed_data"];
	_seed_data = [_item] call plant_seed_lookup_id;
	if (undefined(_seed_data)) exitWith {};
	
	private["_life_time", "_field_markers", "_name", "_max"];
	_life_time = _seed_data select plant_seed_data_life;
	_field_markers = _seed_data select plant_seed_data_field_markers;
	_name = _seed_data select plant_seed_data_name;
	_max = _seed_data select plant_seed_data_max;
	
	if (([_item] call plant_get_count) >= _max) exitWith {
		player groupChat format["You cannot plant any more of %1. There are already %2 planted", _name, _max];
	};
	
	private["_min_marker", "_min_distance"];
	_min_distance = 1e10;
	_min_marker = null;
	{
		private["_cdistance", "_marker"];
		_marker = _x;
		_cdistance = _player distance (getMarkerPos _marker);
		if (_cdistance < _min_distance) exitWith {
			_min_distance = _cdistance;
			_min_marker = _marker;
		};
	} forEach _field_markers;
	
	if (_min_distance > 50) exitWith {
		player groupChat format["You cannot this seedling here. You must be near a %1 field", _name];
	};
	
	private["_death_time", "_position_asl"];
	_death_time = serverTime + _life_time;
	_position_asl = getPosASL _player;
	
	player groupChat format["You have planted a %1 seedling. It will be ready for harvesting in %2 seconds.", _name, _delay];
	[[_death_time, _position_asl, _item],  "plant_seed_handler_persistent", true, true, _death_time] call jip_register;
	
	private["_plant"];
	
	_plant = "Land_Can_V3_F" createVehicle [0,0,0];
	_plant setPosASL _position_asl;
	_plant hideObject true;
	[[_plant, true], "remote_hideObject", true, true, _plant] call jip_register;	
	[_plant, "isPlant", true, true] call object_setVariable;
	[_plant, "icon", "icons\sapling.paa", true] call object_setVariable;
	[_plant, "label_template", format["%1 plant(%2 yield)", _name, "%1"], true] call object_setVariable;
	[_plant, "draggable", false, true] call object_setVariable;
	[_plant, 0] call plant_update_yield;
	[_plant, "item", _item, true] call object_setVariable;
	
	[_player, _item, -(_amount)] call inventory_add_item;
	
	
	[[_plant, _death_time], "plant_life_loop", false, false] call BIS_fnc_MP;
};};

plant_update_count = {
	ARGV(0,_item);
	ARGV(1,_amount);
	if (typeName _item != "STRING") exitWith {};
	if (undefined(_amount)) exitWith {};
	
	private["_plant_count", "_count_variable"];
	_count_variable = format["%1_count", _item];
	_plant_count = server getVariable [_count_variable, 0];
	
	_plant_count = _plant_count + _amount;
	server setVariable [_count_variable, _plant_count, true];
};

plant_get_count = {
	ARGV(0,_item);
	if (typeName _item != "STRING") exitWith {0};
	private["_plant_count", "_count_variable"];
	_count_variable = format["%1_count", _item];
	(server getVariable [_count_variable, 0])
};




plant_life_loop = { _this spawn {
	ARGV(0,_plant);
	ARGV(1,_death_time);
	
	if (typeName _plant != "OBJECT") exitWith {};
	if (undefined(_death_time)) exitWith {};
	if (typeName _death_time != "SCALAR") exitWith {};
	
	if (not([_plant, "isPlant", false] call object_getVariable)) exitWith {};
	
	private["_item"];
	_item = [_plant, "item", ""] call object_getVariable;
	
	[_item, 1] call plant_update_count;
	
	
	//give a 5 second buffer so that the plant object is removed before the actual plant particle effect disappears
	_death_time = _death_time - 5;
	
	private["_life_time", "_time"];
	_time = serverTime ;
	_life_time = _death_time - _time;
	
	waitUntil {
		_time = round(serverTime);
		//player groupChat format["_time = %1, _dtime = %2",_time, _death_time];
		if ((_time % 30) == 0) then {
			private["_amount"];
			_amount = [_plant, "amount", 0] call object_getVariable;
			if (_amount == 0) then {
				_amount = ceil(random 4);
				[_plant, _amount] call plant_update_yield;
			};
		};
		sleep 1;
		(_time > _death_time)
	};
	
	deleteVehicle _plant;
	[_item, -1] call plant_update_count;
};};

plant_update_yield = {
	ARGV(0,_plant);
	ARGV(1,_amount);
	if (undefined(_plant)) exitWith {};
	if (typeName _plant != "OBJECT") exitWith {};
	if (not([_plant, "isPlant", false] call object_getVariable)) exitWith {};
	if (undefined(_amount)) exitWith {};
	
	private["_label_template"];
	_label_template = [_plant, "label_template", ""] call object_getVariable;
	[_plant, "label", format[_label_template, _amount], true] call object_setVariable;
	[_plant, "amount", _amount, true] call object_setVariable;
};



plant_actions_netid = "";
plant_actions = [];
plant_remove_actions = {
	if (count plant_actions == 0) exitWith {};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach plant_actions;
	plant_actions = [];
	plant_actions_netid = "";
};

plant_add_actions = {
	ARGV(0,_player);
	ARGV(1,_plant_netid);
	
	if ((_plant_netid == plant_actions_netid)) exitWith {};
	
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_plant_netid)) exitWith {};
	if (typeName _plant_netid != "STRING") exitWith {};
	
	
	//remove previous actions
	[_player] call plant_remove_actions;
	
	private["_plant"];
	_plant = objectFromNetId _plant_netid;
	if (isNull _plant) exitWith {};
	
	if (not([_plant, "isPlant", false] call object_getVariable)) exitWith {};
	
	private["_item"];
	_item = [_plant, "item", ""] call object_getVariable;
	

	private["_seed_data"];
	_seed_data = [_item] call plant_seed_lookup_id;
	if (undefined(_seed_data)) exitWith {};
	
	private["_name"];
	_name = _seed_data select plant_seed_data_name;


	private["_action_id"];	

	_action_id = player addaction [format["Harvest %1 yield", _name, _plant_netid], "action.sqf", [[_player, _plant], "plant_harvest_yield"], 1,true,true,"", format['(nearCursorTarget == objectFromNetId "%1") && {(player distance nearCursorTarget) < 3} ',_plant_netid]];
	plant_actions = plant_actions + [_action_id];
	plant_actions_netid = _plant_netid;
};

plant_harvest_yield_active = false;
plant_harvest_yield = {
	ARGV(0,_this);
	if (plant_harvest_yield_active) exitWith {
		player groupChat format["WARNING: plant_harvest_yield already active"];
	};
	plant_harvest_yield_active = true;
	
	[] call interact_play_pickup_animation;
	
	ARGV(0,_player);
	ARGV(1,_plant);
	
	private["_exit_method"];
	_exit_method = {
		plant_harvest_yield_active = false;
	};

	if (not([_player] call player_exists)) exitWith {call _exit_method};
	if (undefined(_plant)) exitWith {call _exit_method};
	
	if (typeName _plant != "OBJECT") exitWith {call _exit_method};
	if (not([_plant, "isPlant", false] call object_getVariable)) exitWith {call _exit_method};
	

	
	private["_item", "_seed_data"];
	_item = [_plant, "item", ""] call object_getVariable;
	_seed_data = [_item] call plant_seed_lookup_id;
	
	private["_yield_item", "_yield_amount"];
	_yield_item = _seed_data select plant_seed_data_yield_item;
	_yield_amount = [_plant, "amount", 0] call object_getVariable;
	
	private["_yield_item_data", "_yield_item_name"];
	_yield_item_data = ITEM_DATA(_yield_item);
	_yield_item_name = ITEM_DATA_NAME(_yield_item_data);
	
	//check if plant can be harvested
	if (_yield_amount == 0) exitWith {
		player groupChat format["This plant has not yield any %1 yet", _yield_item_name];
		call _exit_method
	};
	
	//calculate the amount to harvest
	private["_harvest_amount"];
	_harvest_amount = [_player, _yield_item, _yield_amount] call player_inventory_space;
	if (_harvest_amount <= 0) exitWith {
		player groupChat format["You cannot carry any more %1 in your inventory", _yield_item_name];
		call _exit_method
	};

	//update the plant yield
	private["_remain_amount"];
	_remain_amount = _yield_amount - _harvest_amount;	
	[_plant, _remain_amount] call plant_update_yield;

	//update the player's inventory
	player groupChat format["You harvested %1 of %2", _harvest_amount, _yield_item_name];
	[_player, _yield_item, _harvest_amount] call inventory_add_item;
	
	call _exit_method
};



plant_player_near = {
	//player groupChat format["plant_player_near %1", _this];
	ARGV(0,_player);
	ARGV(1,_distance);
	
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_distance)) exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	_plant = nearCursorTarget;
	if (isNull _plant || {not([_plant, "isPlant", false] call object_getVariable)}) exitWith {null};

	(netId _plant)
};

plant_functions_defined = true;
