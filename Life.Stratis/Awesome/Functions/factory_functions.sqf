#include "macro.h"
#include "constants.h"

if (not(undefined(factory_functions_defined))) exitWith {null};

factory_globals = {
	private["_weaponfactory"];
	_weaponfactory=
	[
		"hgun_ACPC2_F",
		"9Rnd_45ACP_Mag",
		"hgun_Rook40_F",
		"16Rnd_9x21_Mag",
		"SMG_02_F",
		"30Rnd_9x21_Mag",
		"HandGrenade",
		"arifle_TRG21_F",
		"arifle_TRG20_F",
		"arifle_TRG21_GL_F",
		"arifle_Mk20_F",
		"arifle_Mk20C_F",
		"arifle_Mk20_GL_F",
		"30Rnd_556x45_Stanag_Tracer_Yellow",
		"30Rnd_556x45_Stanag",
		"srifle_EBR_F",
		"20Rnd_762x51_Mag",
		"Rnd_HE",
		"Rnd_Smoke",
		"Rnd_RedSmoke",
		"Rnd_GreenSmoke",
		"Rnd_YellowSmoke",
		"Rnd_PurpleSmoke",
		"Rnd_BlueSmoke",
		"Rnd_OrangeSmoke",
		"Rnd_FlareWhite",
		"Rnd_FlareGreen",
		"muzzle_snds_L",
		"muzzle_snds_M",
		"acc_flashlight",
		"acc_pointer_IR",
		"optic_Holosight",
		"optic_Aco",
		"optic_ACO_grn",
		"optic_Arco"
	];

	private["_terrorfactory"];
	_terrorfactory=
	[
	];


	private["_vehiclefactory"];
	_vehiclefactory=
	[
		"O_Quadbike_01_F",
		"C_Offroad_01_F_red",
		"C_Offroad_01_F_white",
		"C_Offroad_01_F_tan",
		"C_Offroad_01_F_dark_blue",
		"C_Offroad_01_F_bur",
		"C_Offroad_01_F_rider",
		"C_Offroad_01_F_sky_blue",
		"C_Offroad_01_F_hot_pink",
		"C_Hatchback_01_F_light_tan",
		"C_Hatchback_01_F_dark_tan",
		"C_Hatchback_01_F_light_gray",
		"C_Hatchback_01_F_dark_gray",
		"C_Hatchback_01_F_light_blue",
		"C_Hatchback_01_F_dark_blue",
		"C_Hatchback_01_F_light_green",
		"C_Hatchback_01_F_light_yellow",
		"C_Hatchback_01_F_black",
		"C_Hatchback_01_F_white",
		"C_Hatchback_01_sport_F_red",
		"C_Hatchback_01_sport_F_blue",
		"C_Hatchback_01_sport_F_orange",
		"C_Hatchback_01_sport_F_white",
		"C_Hatchback_01_sport_F_light_gray",
		"C_Hatchback_01_sport_F_dark_green",
		"C_SUV_01_F_red",
		"C_SUV_01_F_black",
		"C_SUV_01_F_gray",
		"C_SUV_01_F_orange",
		"C_SUV_01_F_hot_pink",
		"C_Van_01_transport_F_fwhite_bwhite",
		"C_Van_01_transport_F_fcamo_bcamo",
		"C_Van_01_transport_F_fred_bred",
		"C_Van_01_fuel_F_fwhite_bwhite",
		"C_Van_01_fuel_F_fred_bred",
		"C_Van_01_fuel_F_fcamo_bcamo",
		"C_Van_01_box_F_fwhite",
		"C_Van_01_box_F_fred",  
		"C_Van_01_box_F_fcamo",
		"I_Truck_02_covered_F",
		"I_Truck_02_transport_F"
	];

	private["_aircraft_factory"];
	_aircraft_factory =
	[
		"B_Heli_Light_01_F_nobenches_adddoors",
		"I_Heli_Transport_02_F_dahoman"
	];

	private["_itemfactory"];
	_itemfactory=
	[
		"hgun_ACPC2_F",
		"16Rnd_9x21_Mag",
		"9Rnd_45ACP_Mag",
		"reparaturkit",
		"kleinesreparaturkit",
		"kanister",
		"nitro",
		"lockpick",
		"medikit",
		"Firstaidkit",
		"Toolkit",
		"lighter",
		"defuser",
		"fernzuender",
		"vclammo",
		"fishingpole",
		"knife",
		"shovel",
		"pickaxe",
		"JackHammer",
		"supgrade1",
		"supgrade2",
		"supgrade3",
		"supgrade4",
		"supgrade5"
	];

	private["_tairfactory"];
	_tairfactory =
	[
		"O_MRAP_02_F",
		"O_MRAP_02_hmg_F",
		"O_MRAP_02_gmg_F",
		"O_APC_Wheeled_02_rcws_F",
		"O_APC_Tracked_02_cannon_F",
		"O_Heli_Light_02_unarmed_F",
		"O_Heli_Light_02_F_nodagr",
		"O_Heli_Attack_02_F_noscalpel_noskyfire",
		"O_Heli_Attack_02_black_F_noscalpel_noskyfire"
	];

	private["_alcoholfactory"];
	_alcoholfactory = 
	[
		"beer",
		"fanta",
		"vodka",
		"smirnoff",
		"wiskey",
		"redgull",
		"water"
	];

	private["_ringfactory"];
	_ringfactory = 
	[
		"Diamondring",
		"EDiamondring",
		"Platinumring",
		"EPlatinumring"
	];

	private["_furnace"];
	_furnace = ["steel"];

	factory_object = 0;
	factory_id = 1;
	factory_name = 2;
	factory_crate = 3;
	factory_spawn = 4;
	factory_items = 5;
	factory_cost = 6;
	factory_storage = 7;
	factory_queue = 8;

	all_factories =
	[
		[Vehiclefactory, "factory1", "Vehicle Factory", dummyobj, vfacspawn, _vehiclefactory, 2500000, "Fabrikablage1", "vehiclequeue"],
		//[ Aircraftfactory, "factory2", "Aircraft Factory", dummyobj, airfacspawn, _aircraft_factory, 5000000, "AircraftFactory1", "aircraftqueue"],
		[ItemFabrik_1, "factory3", "General Factory", igunbox,dummyobj, _itemfactory, 250000, "Fabrikablage3", "itemqueue"],
		[weaponfactory, "factory4", "Weapon Factory", wfgunbox,dummyobj, _weaponfactory, 5000000, "Fabrikablage4", "weaponqueue"],
		[tairshop, "factory6", "Terrorist Vehicle Factory", dummyobj, tairspawn, _tairfactory, 10000000, "Fabrikablage6", "tavehiclequeue"]
		//[ alcoholfactory, "factory7", "Alcohol Factory", dummyobj, dummyobj, _alcoholfactory, 450000, "Fabrikablage7", "alcoholfactoryqueue"] ,
		//[ ringfactory, "factory9", "Ring Factory", dummyobj, dummyobj, _ringfactory, 2500000, "Fabrikablage9", "diamondqueue"],
		//[ Furnace, "factory10","Furnace", dummyobj, dummyobj, _furnace, 1500000, "Fabrikablage10","furnacequeue"]
	];
};

factory_init = {
	//player groupChat format["factory_init %1", _this];
	ARGV(0,_player);
	ARGV(1,_factory_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	
	private["_factory"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {null};
	
	//initialize the factory queue
	private["_queue_name"];
	_queue_name = _factory select factory_queue;
	[_queue_name, []] call stats_init_variable;
	
	
	//initialize the factory items
	private["_items"];
	_items = _factory select factory_items;
	
	private["_workers_name", "_workers"];
	_workers_name = format["%1workers", _queue_name];
	[_workers_name, 0] call stats_init_variable;

	{
		private["_item", "_prod_name", "_eta_name", "_pend_name", "_avail_name"];
		_item = _x;
		_avail_name = format["%1avail", _item];
		_pend_name = format["%1pend", _item];
		_eta_name = format["%1eta", _item];
		_prod_name = format["%1prod", _item];
		
		[_avail_name, 0] call stats_init_variable;
		missionNamespace setVariable [_pend_name, 0];
		missionNamespace setVariable [_eta_name, 0];
		missionNamespace setVariable [_prod_name, 0];
	} forEach _items;
	
	private["_queue"];
	_queue = missionNamespace getVariable [_queue_name, []];
	{
		private["_item", "_pend_name"];
		_item = _x;
		_pend_name = format["%1pend", _item];
		_pend = missionNamespace getVariable [_pend_name, 0];
		_pend = _pend + 1;
		missionNamespace setVariable [_pend_name, _pend]; 
	} forEach _queue;
};

factory_save_storage = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};
	
	{
		private["_factory", "_storage_name", "_storage"];
		_factory = _x;
		_storage_name = _factory select factory_storage;
		_storage = [_player, _storage_name] call player_get_array;
		[_player, _storage_name, _storage, false] call player_set_array_checked;
	} forEach all_factories;
};

factory_calculate_production_cost = {
	//player groupChat format["factory_calculate_production_cost %1", _this];
	ARGV(0,_item);
	if (undefined(_item)) exitWith {0};
	if (typeName _item != "STRING") exitWith {0};
	
	private["_buy_price"];
	_buy_price = (_item call inventory_get_item_buy_cost);
	_sell_price = (_item call inventory_get_item_sell_cost);
	
	
	// simple forumla for calculating the production cost
	// in order for factory owner, to make a profit, the production cost 
	// must be lower than the amount the items sells for ... 
	// whatever extra money the factory owner makes after selling the item is
	// called the profit margin.
	// We are fixing here the profit margin to 10%
	private["_profit_margin"];
	_profit_margin = 0.1; 
	
	private["_cost"];
	_cost = _sell_price - _sell_price * _profit_margin;
	(_cost)
};

factory_calculate_production_time = {
	//player groupChat format["factory_calculate_production_time %1", _this];
	ARGV(0,_item);
	ARGV(1,_workers);
	
	if (undefined(_item)) exitWith {0};
	if (undefined(_workers)) exitWith {0};
	if (typeName _item != "STRING") exitWith {0};
	if (typeName _workers != "SCALAR") exitWith {0};
	
	if (_workers <= 0) exitWith {0};
	
	private["_item_cost"];
	
	_item_cost = (_item call inventory_get_item_buy_cost);
	
	// simple linear formula for calculating the production time ... 
	// the more workers you have, the lower the production time
	// the more expensive the item is the higher the production time
	private["_eta"];
	_eta = (_item_cost * 0.01125);
	_eta = (_eta) min( maxmanitime);
	_eta = (_eta * 5) / _workers;
	_eta = round(_eta);
	_eta	
};


factory_lookup_id = {
	ARGV(0,_id);
	if (undefined(_id)) exitWith {null};
	if (typeName _id != "STRING") exitWith {null};
	
	private["_factory"];
	_factory = null;
	{
		private["_cfactory", "_cid"];
		_cfactory = _x;
		_cid = _cfactory select factory_id;
		if (_id == _cid) exitWith {
			_factory = _cfactory;
		};
	} forEach all_factories;
	_factory
};

factory_player_near = {
	//player groupChat format["factory_player_near %1", _this];
	ARGV(0,_player);
	ARGV(1,_distance);
	
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_distance)) exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	private["_min_distance", "_min_factory"];
	_min_distance = _distance;
	_min_factory = null;
	
	{
		private["_cfactory", "_cdistance", "_cobject"];
		_cfactory = _x;
		_cobject = _cfactory select factory_object;
		_cdistance = _player distance _cobject;
		if (_cdistance < _min_distance) then {
			_min_distance = _cdistance;
			_min_factory = _cfactory;
		};
	} forEach all_factories;
	
	_min_factory
};

factory_loop = {
	//player groupChat format["factory_loop %1", _this];
	ARGV(0,_factory_id);
	
	private["_player"];
	_player = player;
	
	if (not([_player] call player_human)) exitWith {
		player groupChat "Error (factory_loop): Not a player";
	};
	
	if (undefined(_factory_id)) exitWith {
		player groupChat "Error (factory_loop): No factory";
		_this spawn factory_loop;
	};
	
	if (typeName _factory_id != "STRING") exitWith {
		player groupChat "Error (factory_loop): Invalid factory id";
		_this spawn factory_loop;
	};
	
	private["_factory", "_queue_name"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {
		player groupChat "Error (factory_loop): Invalid factory";
		_this spawn factory_loop;
	};
	
	_queue_name = _factory select factory_queue;
	
	call factory_update_queue_list;
	call factory_update_dequeue_item;
	call factory_update_enqueue_item;
	
	//wait for an item to be put on queue
	//player groupChat format["Waiting for queue item at %1", _factory_id];
	waitUntil { (count(missionNamespace getVariable [_queue_name,[]]) > 0)};
	//player groupChat format["Queue item %1 received at %2",((missionNamespace getVariable _queue_name) select 0), _factory_id];
	
	//item on queue, production started
	private["_queue", "_item"];
	_queue = missionNamespace getVariable [_queue_name, []];
	_item = _queue select 0;
	
	private["_prod", "_pend", "_avail", "_prod_name", "_pend_name", "_avail_name"];
	
	_prod_name = format["%1prod", _item];
	_pend_name = format["%1pend", _item];
	_avail_name = format["%1avail", _item];
	
	_prod = missionNamespace getVariable [_prod_name, 0];
	_pend = missionNamespace getVariable [_pend_name, 0];
	_avail = missionNamespace getVariable [_avail_name, 0];
	
	//update the production, and pending value
	_prod = (_prod + 1) max (0);
	_pend = (_pend - 1) max (0);
	
	[_prod_name, _prod] spawn stats_client_save;
	[_pend_name, _pend] spawn stats_client_save;
	
	missionNamespace setVariable [_prod_name, _prod];
	missionNamespace setVariable [_pend_name, _pend];

	private["_workers_name"];
	_workers_name = format["%1workers", _queue_name];
	
	//wait for workers
	//player groupChat format["Waiting for workers at %1", _factory_id];
	waitUntil { (missionNamespace getVariable _workers_name) > 0 };
	//player groupChat format["Workers recieved at %1", _factory_id];
	
	private["_workers"];
	_workers = missionNamespace getVariable _workers_name;
	
	//calculate the manufacture time
	private["_eta", "_item_cost"];
	_item_cost = (_item call inventory_get_item_buy_cost);
	_eta = [_item, _workers] call factory_calculate_production_time;

	private["_item_name", "_factory_name"];
	_factory_name = (_factory select factory_name);
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
	
	player groupChat format["Production of %1 started at your %2, it will take %3 seconds(s) to complete", _item_name, _factory_name, _eta];
	
	//countdown the manufacture time
	private["_eta_name", "_original_production", "_production_canceled"];
	
	_production_canceled = false;
	_original_production = missionNamespace getVariable _prod_name;
	_eta_name = format["%1eta", _item];
	while { _eta > 0 } do {
		sleep 1;
		
		// For debug:
		//player groupChat format["_eta = %1, _item = %2, _workers = %3", _eta, _item, _workers];

		private["_current_production"];
		_current_production = missionNamespace getVariable _prod_name;
		
		if ((_current_production < _original_production) ) exitWith {
			[_prod_name, _current_production] spawn stats_client_save;
			_production_canceled = true;
		};
		
		_workers = missionNamespace getVariable _workers_name;
		if (_workers > 0) then {
			_eta = _eta - 1;
			missionNamespace setVariable [_eta_name, _eta];
			call factory_update_production_stats;
		};
		
	};
	
	if (_production_canceled) exitWith {
		//player canceled the production of the item
		sleep 1;
		_this spawn factory_loop;
	};

	_prod = missionNamespace getVariable _prod_name;
	_avail = missionNamespace getVariable _avail_name;
	
	//production complete, update the values
	_prod = (_prod - 1) max (0);
	_avail = _avail + 1;
	
	missionNamespace setVariable [_prod_name, _prod];
	missionNamespace setVariable [_avail_name, _avail];
	
	_queue = missionNamespace getVariable _queue_name;
	_queue set [0,0];
	_queue = _queue - [0];
	missionNamespace setVariable [_queue_name, _queue];
	
	player groupChat format["A %1 was produced at your %2", _item_name, _factory_name];
	
	//update the stats
	[_prod_name, _prod] spawn stats_client_save;
	[_avail_name, _avail] spawn stats_client_save;
	[_queue_name, _queue] spawn stats_client_save;
	
	sleep 1;
	_this spawn factory_loop;
};




factory_item_dequeue = {
	//player groupChat format["factory_item_dequeue %1", _this];
	ARGV(0,_player);
	ARGV(1,_factory_id);
	ARGV(2,_item);
	ARGV(3,_index);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (undefined(_index)) exitWith {null};
	if (typeName _index != "SCALAR") exitWith {null};
	if (_index < 0) exitWith {null};
	
	private["_factory"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {null};
	
	private["_factory_name", "_queue_name", "_factory_storage"];
	_factory_name = _factory select factory_name;
	_factory_storage = _factory select factory_storage;
	_queue_name = _factory select factory_queue;
	
	
	private["_info", "_item_type", "_item_name"];
	_info = (_item call inventory_get_item_array);
	_item_type = _item call inventory_get_item_type;
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));


	private["_queue", "_eta_name", "_pend_name"];
	_eta_name = format["%1eta", _item];
	_pend_name = format["%1pend", _item];

	private["_eta"];
	
	_queue = missionNamespace getVariable _queue_name;
	_eta = missionNamespace getVariable _eta_name;

	private["_minimum_time"];
	_minimum_time = 5; 
	if (_index == 0 && _eta < _minimum_time) exitWith {
		player groupChat format["%1-%2, you are not allowed to cancel when production time is less than %3 seconds", _player, (name _player), _minimum_time];
	};
	
	
	//simple case, item is not being produced yet
	private["_pend_name", "_pend", "_prod_name", "_prod"];
	_pend_name = format["%1pend", _item];
	_pend = missionNamespace getVariable _pend_name;
	_prod_name = format["%1prod", _item];
	_prod = missionNamespace getVariable _prod_name;
	
	if (not(_prod > 0 || _pend > 0)) exitWith {
		player groupChat format["%1-%2, you do not have any %3 in production, or pending", _player, (name _player), _item_name];
	};
	
	//update the production and pending values
	if (_index == 0 && _prod > 0) then {
		_prod = _prod - 1;
		_prod = (_prod) max (0);
		
		//player groupChat format["%1-%2, your %3 was in production, it has been canceled", _player, (name _player), _item_name];
	}
	else { if (_pend > 0) then {
		_pend = _pend - 1;
		_pend = (_pend) max (0);
		//player groupChat format["%1-%2, you had a %3 pending production, it has been canceled", _player, (name _player), _item_name];
	};};
		
	
	//look for the item in the queue
	private["_i", "_index"];
	_i = 0;
	_index = -1;
	while { _i < (count _queue) } do {
		private["_citem"];
		_citem = _queue select _i;
		if (_citem == _item) exitWith {
			_index = _i;
		};
		_i = _i + 1;
	};
	
	
	//remove the item from the queue
	if (_index >= 0) then {
		_queue set [_index, 0];
		_queue = _queue - [0];
	};
	
	//reimburse the player for the production cost
	private["_production_cost"];
	_production_cost = [_item] call factory_calculate_production_cost;
	[_player, "money", _production_cost, _factory_storage] call inventory_storage_add_item;
	[_factory_storage, ([_player, _factory_storage] call object_getVariable)] call stats_client_save;
	
	//player groupChat format["%1-%2, you have been reimbursed $%3 for %4", _player, (name _player), _production_cost, _item_name];
	//player groupChat format["_queue = %1", _queue];
	missionNamespace setVariable [_queue_name, _queue];
	missionNamespace setVariable [_pend_name, _pend];
	missionNamespace setVariable [_prod_name, _prod];
	[_prod_name, _prod] spawn stats_client_save;
	[_queue_name, _queue] spawn stats_client_save;
	call factory_update_queue_list;
};

factory_item_enqueue = {
	//player groupChat format["factory_item_enqueue %1", _this];	
	ARGV(0,_player);
	ARGV(1,_factory_id);
	ARGV(2,_item);
	ARGV(3,_amount);
	
	factory_enqueue_active = if(undefined(factory_enqueue_active)) then {false} else {factory_enqueue_active};
	if (factory_enqueue_active) exitWith {null};
	
	if (not([_player] call player_human)) exitWith {null};
	if(undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCAlAR") exitWith {null};
	
	if (_amount == 0) exitWith {null};
	factory_enqueue_active = true;
	
	
	private["_factory", "_factory_storage", "_factory_queue", "_factory_name", "_factory_money", "_starttime"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {factory_enqueue_active = false;};
	
	_factory_storage = _factory select factory_storage;
	_factory_queue = _factory select factory_queue;
	_factory_name = _factory select factory_name;
	_factory_money = [_player, "money", _factory_storage] call inventory_get_storage_amount;
	
	private["_info", "_item_type", "_item_name", "_production_cost"];
	_info = (_item call inventory_get_item_array);
	_item_type = _item call inventory_get_item_type;
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
	
	private["_workers_name", "_workers"];
	_workers_name = format["%1workers", _factory_queue];
	_workers = missionNamespace getVariable _workers_name;
	
	if (_workers <= 0) exitWith {
		factory_enqueue_active = false;
		player groupChat format["%1-%2, you cannot start production at your %3, because you have not hired any workers", _player, (name _player), _factory_name];
	};
	
	_production_cost = [_item, _workers] call factory_calculate_production_cost;
	
	private["_total_due"];
	_total_due = (_amount * _production_cost);
	
	if (_factory_money < _total_due) exitWith {
		factory_enqueue_active = false;
		player groupChat format["%1-%2, you do not have enough money in your %3 storage to produce %4 %5", _player, (name _player), _factory_name, _amount, _item_name];
	};
	
	
	[_player, "money", -(_total_due), _factory_storage] call inventory_storage_add_item;
	[_factory_storage, ([_player, _factory_storage] call object_getVariable)] call stats_client_save;
	
	
	player groupChat format["%1-%2, you have added %3 %4 to the production queue of your %5", _player, (name _player), _amount, _item_name, _factory_name];
	
	private["_pend_name", "_pend", "_queue"];
	_pend_name = format["%1pend", _item];	
	
	while { _amount > 0 } do {
		_queue = missionNamespace getVariable _factory_queue;
		_pend = missionNamespace getVariable _pend_name;
		
		_queue = _queue + [_item];
		_pend = _pend + 1;
	
		missionNamespace setVariable [_pend_name, _pend];
		missionNamespace setVariable [_factory_queue, _queue];
		
		[_pend_name, _pend] call stats_client_save;
		[_factory_queue, _queue] call stats_client_save;
		_amount = _amount - 1;
	};
	
	call factory_update_queue_list;
	factory_enqueue_active = false;
};


factory_item_create = { 
	//player groupChat format["factory_item_create %1", _this];
	ARGV(0,_player);
	ARGV(1,_factory_id);
	ARGV(2,_item);
	ARGV(3,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if(undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	if (undefined(_item)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCAlAR") exitWith {null};
	
	if (_amount <= 0) exitWith {null};

	private["_factory", "_factory_storage", "_factory_spawn", "_factory_crate"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {null};
	
	_factory_storage = _factory select factory_storage;
	_factory_spawn = _factory select factory_spawn;
	_factory_crate = _factory select factory_crate;
	
	private["_info", "_item_type", "_item_name"];
	_info = (_item call inventory_get_item_array);
	_item_type = _item call inventory_get_item_type;
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
	
	if (not(_item_type in ["Item", "Weapon", "Magazine", "Vehicle"])) exitWith {null};
	
	if (_item_type == "Vehicle" && _amount > 1) exitWith {
		player groupChat format["%1-%2, you can only create one %3 at a time", _player, (name _player), _item_name];
	};
	
	private["_avail_name", "_avail"];
	_avail_name = format["%1avail", _item];
	_avail = missionNamespace getVariable _avail_name;
	
	if (_avail  < _amount) exitWith {
		player groupChat format["%1-%2, you have not produced enough %3 to create", _player, (name _player), _item_name];
	};
		
	player groupChat format["%1-%2, you have created %3 %4", _player, (name _player), _amount, _item_name];

	_avail = missionNamespace getVariable _avail_name;
	while { _amount > 0 && _avail > 0} do {
		_avail = _avail - 1;
		missionNamespace setVariable [_avail_name, _avail];
		[_avail_name, _avail] spawn stats_client_save;
		
		switch _item_type do {
			case "Item": {
				[_player, _item, 1, _factory_storage] spawn INV_CreateItem;
			};
			case "Weapon": {
				[(_info call inventory_get_item_class), 1, _factory_crate] spawn INV_CreateWeapon;
			};
			case "Magazine": {
				[(_info call inventory_get_item_class), 1, _factory_crate] spawn INV_CreateMag;
			};
			case "Vehicle": {
				private["_vehicle_class"];
				_vehicle_class = (_info call inventory_get_item_class);
				_vehicle_script_name = (_info call inventory_get_item_script_name);
				[_factory_spawn, _vehicle_class, _vehicle_script_name, false] spawn vehicle_create_shop_extended;
			};
		};
		
		_avail = missionNamespace getVariable _avail_name;
		_amount = _amount - 1;
	};
	
	call factory_update_enqueue_item;
};

factory_selected = null;
factory_actions = [];

factory_remove_actions = {
	if (count factory_actions == 0) exitWith {null};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach factory_actions;
	factory_actions = [];
};

factory_update_enqueue_list = { 
	if (undefined(factory_selected)) exitWith {null};
	private["_factory"];
	_factory = factory_selected;
	
	private["_queue_name", "_queue", "_items", "_workers_name", "_workers"];
	_queue_name = _factory select factory_queue;
	_queue = missionNamespace getVariable _queue_name;
	_items = _factory select factory_items;
	_workers_name = format["%1workers", _queue_name];
	_workers = missionNamespace getVariable _workers_name;
	
	lbClear factory_enqueue_list_idc;
	
	{
		if (!dialog) exitWith {null};
		
		private["_index", "_item", "_eta", "_item_name", "_minutes"];
		_item = _x;
		_eta = [_item, _workers] call factory_calculate_production_time;
		_minutes = _eta / 60;
		_minutes = (floor(_minutes * 10)/10); //truncate to leave only 1 decimal digit
		_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
		_index = lbAdd [factory_enqueue_list_idc, format["%1 (%2 min/s)", _item_name, _minutes]];
		lbSetData [factory_enqueue_list_idc, _index, _x];
	} forEach _items;
		
	call factory_update_enqueue_item;
};




factory_update_queue_list = { 
	if (undefined(factory_selected)) exitWith {null};
	private["_factory"];
	_factory = factory_selected;
	
	private["_queue_name", "_queue"];
	_queue_name = _factory select factory_queue;
	_queue = missionNamespace getVariable _queue_name;
	
	private["_index"];
	_index = (lbCurSel factory_dequeue_list_idc);
	
	lbClear factory_dequeue_list_idc;
	
	private["_i"];
	_i = 0;
	private["_previous_item", "_previous_item_count", "_logical_index"];
	_previous_item = "";
	_previous_item_count = -1;
	_logical_index = 0;
	
	//build the merged list 
	private["_list"];
	_list = [];
	while { _i < (count _queue) } do {
		private["_citem", "_citem_info", "_citem_name", "_index"];
		_citem = _queue select _i;
		_citem_info = (_citem call inventory_get_item_array);
		_citem_name = (MASTER_ARRAY_ITEM_NAME(_citem_info));
		
		if (_citem == _previous_item) then {
			_previous_item_count = _previous_item_count + 1;
			_previous_item = _citem;
			_list set [((count _list) - 1), [format["%1. %2 (%3 item)",_logical_index, _citem_name, _previous_item_count], _citem]];
		}
		else {
			_logical_index = _logical_index + 1;
			_previous_item_count = 1;
			_previous_item = _citem;
			_list set [(count _list), [format["%1. %2 (%3 item)",_logical_index, _citem_name, 1], _citem]];
		};
		_i = _i + 1;
	};
	
	//player groupChat format["_list = %1", _list];
	_i = 0;
	while { _i < (count _list) } do {
		private["_entry", "_text", "_item", "_index"];
		_entry = _list select _i;
		_text = _entry select 0;
		_item = _entry select 1;
		
		//player groupChat format["Adding %1, %2", _text, _item];
		_index = lbAdd [factory_dequeue_list_idc, _text];
		lbSetData [factory_dequeue_list_idc, _index, _item];
		_i = _i + 1;
	};
	
	lbSetCurSel [factory_dequeue_list_idc, _index];
	call factory_update_dequeue_item; 
};

factory_update_status_fields = {
	ARGV(0,_messages);
	if (undefined(_messages)) exitWith {null};
	if (typeName _messages != "ARRAY") exitWith {null};
	if (count(_messages) != 2) exitWith {null};

	private["_message1", "_message2"];
	_message1 = _messages select 0;
	_message2 = _messages select 1;
	
	ctrlSetText [factory_status_field1_idc, _message1];
	ctrlSetText [factory_status_field2_idc, _message2];
};

factory_update_enqueue_item = {
	private["_index", "_item"];
	_index = (lbCurSel factory_enqueue_list_idc);
	
	private["_production_cost", "_avail"];
	_production_cost = 0;
	_avail = 0;
	
	if (_index > 0) then {
		_item = (lbData [factory_enqueue_list_idc, _index ]);
		
		if (undefined(_item)) exitWith {null};
		if (typeName _item != "STRING") exitWith {null};
		
		private["_info", "_item_name", "_avail_name"];
		
		_info = (_item call inventory_get_item_array);
		_item_name = (MASTER_ARRAY_ITEM_NAME(_info));
		_avail_name =  format["%1avail", _item];
		_avail = missionNamespace getVariable _avail_name;
		
		private["_amount"];
		_amount = (ctrlText factory_amount_field_idc);
		_amount = [_amount] call parse_number;
		
		_production_cost = ([_item] call factory_calculate_production_cost) * _amount;
	};
	
	ctrlSetText [factory_item_cost_field_idc, format["$%1", strM(_production_cost)]];
	ctrlSetText [factory_item_produced_field_idc, str(_avail)];
	
	private["_messages"];
	_messages = call factory_validate_enqueue_item;
	[_messages] call factory_update_status_fields;
};

factory_validate_enqueue_item = {
	//player groupChat format["factory_validate_enqueue_item"];
	ctrlEnable[factory_enqueue_button_idc, false];
	ctrlEnable[factory_create_button_idc, false];
	
	if (undefined(factory_selected)) exitWith {[]};
	private["_factory"];
	_factory = factory_selected;
	
		
	private["_player", "_item", "_index"];	
	_player = player;
	_index = (lbCurSel factory_enqueue_list_idc);
	
	if (_index < 0 ) exitWith {
		(["You have not selected any item to produce or create", ""])
	};
	
	_item = (lbData [factory_enqueue_list_idc, _index]);
	
	private["_message1", "_message2"];
	_message1 = "";
	_message2 = "";
	
	private["_amount", "_amount_str"];
	_amount_str = (ctrlText factory_amount_field_idc);
	
	_amount = if (_amount_str == "") then { 0 } else {[_amount_str] call parse_number };
	_amount = if (_amount < 0 ) then { ctrlSetText [factory_amount_field_idc, "1"]; 1 } else {_amount};
	_amount = if (_amount > 100) then { ctrlSetText [factory_amount_field_idc, "100"]; 100 } else { _amount };
	
	
	
	if (_amount == 0) exitWith {
		["The value entered in the amount field is not valid", ""]
	};
	
	private["_factory_queue", "_workers_name", "_workers"];
	_factory_queue = _factory select factory_queue;
	_workers_name = format["%1workers", _factory_queue];
	_workers = missionNamespace getVariable _workers_name;
		

	private["_avail_name", "_avail"];
	_avail_name = format["%1avail", _item];
	_avail = missionNamespace getVariable _avail_name;
	
	private["_factory_storage", "_factory_money", "_production_cost"];
	_factory_storage = _factory select factory_storage;
	_factory_money = [_player, "money", _factory_storage] call inventory_get_storage_amount;
	_production_cost = ([_item] call factory_calculate_production_cost) * _amount;
	
	private["_created_allowed", "_enqueue_allowed"];
	_create_allowed = true;
	_enqueue_allowed = true;
	
	
	
	if (_amount > _avail) then {
		_message1 = "The amount of items create is higher than the amount of items produced";
		_create_allowed = false;
	};
	
	if (_production_cost > _factory_money) then {
		_message2 = "There is not enough money in the factory storage to produce this item";
		_enqueue_allowed = false;
	};
	
	if (not(_workers > 0)) then {
		_message2 = "Production cannot start because you have not hired any workers";
		_enqueue_allowed = false;
	};
	
	
	ctrlEnable[factory_create_button_idc, _create_allowed];
	ctrlEnable[factory_enqueue_button_idc, _enqueue_allowed];
	
	([_message1, _message2])
};

factory_update_dequeue_item = {
	call factory_update_production_stats;
	private["_messages"];
	_messages = call factory_validate_dequeue_item;
	[_messages] call factory_update_status_fields;
};

factory_validate_dequeue_item = {
	ctrlEnable[factory_dequeue_button_idc, false];
	
	if (undefined(factory_selected)) exitWith {[]};
	private["_factory"];
	_factory = factory_selected;
	
		
	private["_player", "_item", "_index"];	
	_player = player;
	_index = (lbCurSel factory_dequeue_list_idc);
	if (_index < 0 ) exitWith {
		(["You have not selected any item to cancel", ""])
	};
	
	_item = (lbData [factory_dequeue_list_idc, _index]);

	private["_message1", "_message2", "_dequeue_allowed"];
	_message1 = "";
	_message2 = "";
	_dequeue_allowed = true;
	
	if (_index == 0) then {
		private["_eta_name", "_eta", "_min", "_prod", "_prod_name"];
		_min = 5;
		_eta_name = format["%1eta", _item];
		_eta = missionNamespace getVariable _eta_name;
		
		_prod_name = format["%1prod", _item];
		_prod = missionNamespace getVariable _prod_name;
		if (_eta < _min && _prod > 0) then {
			_message1 = format["Cancel not allowed if production time is less than %1 seconds", _min];
			_dequeue_allowed = false;
		};
	};
	
	ctrlEnable[factory_dequeue_button_idc, _dequeue_allowed];
	([_message1, _message2])
};


factory_update_production_stats = {
	if (undefined(factory_selected)) exitWith {null};
	private["_factory"];
	_factory = factory_selected;
	
	private["_item", "_index"];	
	_index = (lbCurSel factory_dequeue_list_idc);
	_item = (lbData [factory_dequeue_list_idc, _index]);
	
	if (undefined(_item)) exitWith {null};
	if (typeName _item != "STRING") exitWith {null};
	if (_item == "") exitWith {null};
	
	private["_info", "_item_name"];
	_info = (_item call inventory_get_item_array);
	_item_name = (MASTER_ARRAY_ITEM_NAME(_info));
		
	private["_eta"];
	_eta = 0;
	if (_index < 0) then {
		_eta = 0;
		_item_name = "(none)";
	}
	else { if (_index == 0) then {
		private["_eta_name"];
		_eta_name = format["%1eta", _item];
		_eta = missionNamespace getVariable _eta_name;
	}
	else {
		private["_queue_name", "_workers_name", "_workers"];
		_queue_name = _factory select factory_queue;
		_workers_name = format["%1workers", _queue_name];
		_workers = missionNamespace getVariable _workers_name;
		private["_production_time"];
		_eta = [_item, _workers] call factory_calculate_production_time;
	};};
	
	
	ctrlSetText [factory_production_field_idc, _item_name];
	ctrlSetText [factory_production_eta_field_idc, format["%1 seconds", _eta]];
};



factory_production_menu = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_factory_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	
	private["_factory"];
	_factory = [_factory_id] call factory_lookup_id;
	
	if (!(createDialog "factory_dialog")) exitWith {hint "Dialog Error!";};
	
	disableSerialization;
	
	//set the factory being used, for other UI functions
	factory_selected = _factory;
	[] spawn {
		waitUntil { not(ctrlVisible factory_enqueue_list_idc) };
		factory_selected = null;
	};
	
	private["_factory_name"];
	_factory_name = _factory  select factory_name;
	
	[_factory_name] call factory_menu_setup;
	

	call factory_update_enqueue_list;
	call factory_update_queue_list;
	
	private["_player", "_factory_id", "_item"];

	buttonSetAction [factory_enqueue_button_idc, format['[%1, "%2", (lbData [factory_enqueue_list_idc, (lbCurSel factory_enqueue_list_idc)]), ([(ctrlText factory_amount_field_idc)] call parse_number)] call factory_item_enqueue;', _player, _factory_id]];
	buttonSetAction [factory_create_button_idc, format['[%1, "%2", (lbData [factory_enqueue_list_idc, (lbCurSel factory_enqueue_list_idc)]), ([(ctrlText factory_amount_field_idc)] call parse_number)] call factory_item_create;', _player, _factory_id]];
	buttonSetAction [factory_dequeue_button_idc, format['[%1, "%2", (lbData [factory_dequeue_list_idc, (lbCurSel factory_dequeue_list_idc)]), (lbCurSel factory_dequeue_list_idc)] call factory_item_dequeue;', _player, _factory_id]]; 
};};


factory_hire_workers = {
	ARGV(0,_player);
	ARGV(1,_factory_id);
	ARGV(2,_workers_count);
	ARGV(3,_workers_cost);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_factory_id)) exitWith {null};
	if (undefined(_workers_count)) exitWith {null};
	if (undefined(_workers_cost)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	if (typeName _workers_count != "SCALAR") exitWith {null};
	if (typeName _workers_cost != "SCALAR") exitWith {null};
	
	
	private["_factory", "_queue_name", "_factory_name"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {null};
	
	_queue_name = _factory select factory_queue;
	_factory_name = _factory select factory_name;
	
	private["_workers_name", "_workers"];
	_workers_name = format["%1workers", _queue_name];
	_workers = missionNamespace getVariable _workers_name;
	
	private["_max"];
	_max = maxfacworkers;
	if (_workers >= _max) exitWith {
		player groupChat format["%1-%2, your %3 has already reached maximum of %4 workers", _player, (name _player), _factory_name, _max];
	};
	
	private["_money", "_total_cost"];
	_money = [_player, "money"] call inventory_get_item_amount;
	_total_cost = (_workers_count * _workers_cost);
	
	if (_money < _total_cost) exitWith {
		player groupChat format["%1-%2, you do not have enough money in your inventory to hire %3 workers for your %4", _player, (name _player), _workers_count, _factory_name];
	};
	
	[player, "money", -(_total_cost)] call inventory_add_item;
	
	_workers = _workers + _workers_count;
	player groupChat format["%1-%2, you have hired %3 workers for your %4", _player, (name _player), _workers_count, _factory_name];
	missionNamespace setVariable [_workers_name, _workers];
	[_workers_name, _workers] call stats_client_save;
	

	//adjust the ETA for the current item in queue
	private["_queue"];
	_queue = missionNamespace getVariable _queue_name;
	if (count _queue > 0) then {
		private["_eta", "_eta_name"];
		_eta_name = format["%1eta", _queue_name];
		_eta = missionNamespace getVariable _eta_name;
		_eta =  _eta - ((_eta / maxfacworkers) * _workers_count);
		_eta = _eta max 0;
		missionNamespace setVariable [_eta_name, _eta];
	};
};

factory_add_actions = {
	if (count factory_actions > 0) exitWith {null};
	ARGV(0,_player);
	ARGV(1,_factory_id);

	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	
	private["_factory"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory_id)) exitWith {null};
	
	private["_factory_id", "_factory_cost", "_factory_storage", "_factory_name"];
	_factory_name = _factory select factory_name;
	_factory_cost = _factory select factory_cost;
	_factory_storage = _factory select factory_storage;
	
	if (_factory_id  in INV_FabrikOwner) then {
		private["_action_id"];
		_action_id = player addaction ["Storage", "noscript.sqf", format['[%1, "%2"] call storage_menu_factory_storage;', _player, _factory_storage]];
		factory_actions = factory_actions + [_action_id];
		
		_action_id = player addaction ["Manufacture", "noscript.sqf", format['[%1, "%2"] call factory_production_menu;', _player, _factory_id]];
		factory_actions = factory_actions + [_action_id];
		
		_action_id = player addaction [format["Hire one worker ($%1)", strM(facworkercost)], "noscript.sqf", format['[%1, "%2", %3, %4] call factory_hire_workers;', _player, _factory_id, 1, facworkercost]];
		factory_actions = factory_actions + [_action_id];
		
		_action_id = player addaction [format["Hire ten workers ($%1)", strM(10*facworkercost)], "noscript.sqf", format['[%1, "%2", %3, %4] call factory_hire_workers;', _player, _factory_id, 10, facworkercost]];
		factory_actions = factory_actions + [_action_id];
	}
	else {
		private["_action_id"];
		_action_id = player addaction [format["Buy %1 ($%2)", _factory_name, strM(_factory_cost)], "noscript.sqf", format['[%1, "%2"] call factory_buy;', _player, _factory_id]];
		factory_actions = factory_actions + [_action_id];
	};
};

factory_buy = {
	ARGV(0,_player);
	ARGV(1,_factory_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_factory_id)) exitWith {null};
	if (typeName _factory_id != "STRING") exitWith {null};
	
	private["_factory", "_factory_cost"];
	_factory = [_factory_id] call factory_lookup_id;
	if (undefined(_factory)) exitWith {null};
	_factory_cost = _factory select factory_cost;
	
	if (_factory_id in INV_Fabrikowner) exitWith {
		player groupChat format["%1-%2, you already own this factory", _player, (name _player)];
	};

	private["_money"];	
	_money = [_player, "money"] call inventory_get_item_amount;
	if (_money < _factory_cost) exitWith {
		player groupChat format["%1-%2, you do not have enough money in your inventory to buy this factory", _player, (name _player)];
	};
	
	[_player, "money", -(_factory_cost)] call inventory_add_item;
	INV_Fabrikowner = INV_Fabrikowner + [ _factory_id ];
	["INV_Fabrikowner", INV_Fabrikowner] spawn stats_client_save;
	
	
	player groupChat format["%1-%2, you bought this factory for $%3", _player, (name _player), strM(_factory_cost)];
	[_player] call factory_remove_actions;
};

factory_lookup_storage = {
	ARGV(0,_storage_name);
	
	if (undefined(_storage_name)) exitWith {null};
	if (typeName _storage_name != "STRING") exitWith {null};
	
	private["_factory"];
	_factory = null;
	{
		private["_cfactory", "_cstorage_name"];
		_cfactory = _x;
		_cstorage_name = _cfactory select factory_storage;
		if (_storage_name == _cstorage_name) exitWith {
			_factory = _cfactory;
		};
	} forEach all_factories;
	_factory
};

factory_menu_setup = {
	disableSerialization;
	player groupChat format["factory_menu_setup"];
	ARGV(0,_factory_name);
	
	private["_display"];
	_display = uiNamespace getVariable "FACTORY_MENU";
	
	_factory_dialog = _display displayCtrl factory_dialog_idd;
	_factory_left_background = _display displayCtrl factory_left_background_idc;
	_factory_left_header = _display displayCtrl factory_left_header_idc;
	_factory_enqueue_list = _display displayCtrl factory_enqueue_list_idc;
	_factory_item_produced_label = _display displayCtrl factory_item_produced_label_idc;
	_factory_item_produced_field = _display displayCtrl factory_item_produced_field_idc;
	_factory_item_cost_label = _display displayCtrl factory_item_cost_label_idc;
	_factory_item_cost_field = _display displayCtrl factory_item_cost_field_idc;
	_factory_amount_label = _display displayCtrl factory_amount_label_idc;
	_factory_amount_field_background = _display displayCtrl factory_amount_field_background_idc;
	_factory_amount_field = _display displayCtrl factory_amount_field_idc;
	_factory_enqueue_button = _display displayCtrl factory_enqueue_button_idc;
	_factory_create_button = _display displayCtrl factory_create_button_idc;
	_factory_right_background = _display displayCtrl factory_right_background_idc;
	_factory_right_header = _display displayCtrl factory_right_header_idc;
	_factory_dequeue_list = _display displayCtrl factory_dequeue_list_idc;
	_factory_in_production_label = _display displayCtrl factory_in_production_label_idc;
	_factory_production_field = _display displayCtrl factory_production_field_idc;
	_factory_in_production_eta_label = _display displayCtrl factory_in_production_eta_label_idc;
	_factory_production_eta_field = _display displayCtrl factory_production_eta_field_idc;
	_factory_dequeue_button = _display displayCtrl factory_dequeue_button_idc;
	_factory_close_button = _display displayCtrl factory_close_button_idc;
	_factory_status_frame1 = _display displayCtrl factory_status_frame1_idc;
	_factory_status_background1 = _display displayCtrl factory_status_background1_idc;
	_factory_status_field1 = _display displayCtrl factory_status_field1_idc;
	_factory_status_frame2 = _display displayCtrl factory_status_frame2_idc;
	_factory_status_background2 = _display displayCtrl factory_status_background2_idc;
	_factory_status_field2 = _display displayCtrl factory_status_field2_idc;

	private["_x", "_y", "_ysep", "_sep", "_w", "_h"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.45;
	_h = 0.65;
	_ysep = 0.003;
	_sep = 0.01;
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	_factory_left_header ctrlSetText toUpper(format["%1 Items", _factory_name]);
	_factory_right_header ctrlSetText toUpper(format["%1 Queue", _factory_name]);
	
	//items header
	private["_ihx", "_ihy", "_ihw", "_ihh"];
	_ihx = _x;
	_ihy = _y;
	_ihw = _w;
	_ihh = 0.045;
	
	_factory_left_header ctrlSetPosition [_ihx, _ihy, _ihw, _ihh];
	_factory_left_header ctrlSetFontHeight _button_font_height;
	_factory_left_header ctrlSetFont _font_family;
	_factory_left_header ctrlCommit 0;
	
	//items background
	private["_ibx", "_iby", "_ibw", "_ibh"];
	_ibx = _ihx;
	_iby = _ihy + _ihh + _ysep;
	_ibw = _w;
	_ibh = _h - _ihh - _ihh - _ysep - _ysep;
	
	_factory_left_background ctrlSetPosition [_ibx, _iby, _ibw, _ibh];
	_factory_left_background ctrlSetBackgroundColor [0,0,0,0.65];
	_factory_left_background ctrlCommit 0;
	
	//items produce button
	private["_ipx", "_ipy", "_ipw", "_iph"];
	_ipw = 0.18;
	_iph = _ihh;
	_ipx = _ihx;
	_ipy = _iby + _ibh + _ysep;
	
	_factory_enqueue_button ctrlSetText "Produce item";
	_factory_enqueue_button ctrlSetPosition [_ipx, _ipy, _ipw, _iph];
	buttonSetAction [(ctrlIDC _factory_enqueue_button), "closeDialog 0"];
	_factory_enqueue_button ctrlCommit 0;
	
	//items create button
	private["_icx", "_icy" ,"_icw", "_ich"];
	_icx = _ipx + _ipw + _sep;
	_icy = _ipy;
	_icw = _ipw;
	_ich = _iph;
	
	_factory_create_button ctrlSetText "Create item";
	_factory_create_button ctrlSetPosition [_icx, _icy, _icw, _ich];
	_factory_create_button ctrlCommit 0;
	
	//items list
	private["_ilx", "_ily", "_ilw", "_ilh"];
	_ilx = _ibx + _sep;
	_ily = _iby + _sep;
	_ilw = _ibw - _sep * 2;
	_ilh = _ibh * 0.55;
	
	_factory_enqueue_list ctrlSetPosition [_ilx, _ily, _ilw, _ilh];
	_factory_enqueue_list ctrlSetFontHeight _button_font_height * 0.9;
	_factory_enqueue_list ctrlCommit 0;
	
	//items produced label
	private["_iplx", "_iply", "_iplw", "_iplh"];
	_iplx = _ilx; 
	_iply = _ily + _ilh + _sep * 4;
	_iplw = _ilw / 2  - _sep;
	_iplh = 0.04;

	_factory_item_produced_label ctrlSetText "Produced:";
	_factory_item_produced_label ctrlSetPosition [_iplx, _iply, _iplw, _iplh];
	_factory_item_produced_label ctrlSetFontHeight _button_font_height - 0.003;
	_factory_item_produced_label ctrlCommit 0;
	
	//items produced field
	private["_ipfx", "_ipfy", "_ipfw", "_ipfh"];
	_ipfx = _iplx + _iplw + _sep ;
	_ipfy = _iply;
	_ipfw = _iplw;
	_ipfh = _iplh;
	
	_factory_item_produced_field ctrlSetFontHeight _button_font_height - 0.003;;
	_factory_item_produced_field ctrlSetFont _font_family;
	_factory_item_produced_field ctrlSetPosition [_ipfx, _ipfy, _ipfw, _ipfh];
	_factory_item_produced_field ctrlSetBackgroundColor [1,1,1,0.08];
	_factory_item_produced_field ctrlCommit 0;
	
	//item production cost label
	private["_iclx", "_icly", "_iclw", "_iclh"];
	_iclx = _iplx; 
	_icly = _iply + _iplh + _ysep * 2;
	_iclw = _iplw;
	_iclh = _iplh;

	_factory_in_production_eta_label ctrlSetText "Production cost:";
	_factory_in_production_eta_label ctrlSetPosition [_iclx, _icly, _iclw, _iclh];
	_factory_in_production_eta_label ctrlSetFontHeight _button_font_height - 0.003;
	_factory_in_production_eta_label ctrlCommit 0;
	
	//item prodcution cost field
	private["_icfx", "_icfy", "_icfw", "_icfh"];
	_icfx = _iclx + _iclw + _sep ;
	_icfy = _icly;
	_icfw = _iclw;
	_icfh = _iclh;
	
	_factory_item_cost_field ctrlSetFontHeight _button_font_height - 0.003;;
	_factory_item_cost_field ctrlSetFont _font_family;
	_factory_item_cost_field ctrlSetPosition [_icfx, _icfy, _icfw, _icfh];
	_factory_item_cost_field ctrlSetBackgroundColor [1,1,1,0.08];
	_factory_item_cost_field ctrlCommit 0;
	
	//items amount label
	private["_ialx", "_ialy", "_ialw", "_ialh"];
	_ialx = _iclx; 
	_ialy = _icly + _iclh + _ysep * 2;
	_ialw = _iclw;
	_ialh = _iclh;

	_factory_amount_label ctrlSetText "Amount:";
	_factory_amount_label ctrlSetPosition [_ialx, _ialy, _ialw, _ialh];
	_factory_amount_label ctrlSetFontHeight _button_font_height - 0.003;
	_factory_amount_label ctrlCommit 0;
	
	//items amount field
	private["_iafx", "_iafy", "_iafw", "_iafh"];
	_iafx = _ialx + _ialw + _sep ;
	_iafy = _ialy;
	_iafw = _ialw;
	_iafh = _ialh;
	
	_factory_amount_field ctrlSetFontHeight _button_font_height - 0.003;;
	_factory_amount_field ctrlSetFont _font_family;
	_factory_amount_field ctrlSetPosition [_iafx, _iafy, _iafw, _iafh];
	_factory_amount_field ctrlSetBackgroundColor [1,1,1,0.08];
	_factory_amount_field ctrlCommit 0;
	
	//queue header
	private["_qhx", "_qhy", "_qhw", "_qhh"];
	_qhx = _ihx + _ihw + _sep * 2;
	_qhy = _ihy;
	_qhw = _ihw;
	_qhh = _ihh;
	
	_factory_right_header ctrlSetPosition [_qhx, _qhy, _qhw, _qhh];
	_factory_right_header ctrlSetFontHeight _button_font_height;
	_factory_right_header ctrlSetFont _font_family;
	_factory_right_header ctrlCommit 0;
	
	//queue close button
	private["_qox", "_qoy", "_qow", "_qoh"];
	_qow = 0.14;
	_qoh = _qhh;
	_qox = _qhx + _qhw - _qow;
	_qoy = _qhy + _h - _qoh;
	
	_factory_close_button ctrlSetText "Close";
	_factory_close_button ctrlSetPosition [_qox, _qoy, _qow, _qoh];
	buttonSetAction [(ctrlIDC _factory_close_button), "closeDialog 0"];
	_factory_close_button ctrlCommit 0;
	
	//queue background
	private["_qbx", "_qby", "_qbw", "_qbh"];
	_qbx = _qhx;
	_qby = _qhy + _qhh + _ysep;
	_qbw = _w;
	_qbh = (_qoy ) - (_qhy ) - _qoh - _ysep - _ysep;
	
	_factory_right_background ctrlSetPosition [_qbx, _qby, _qbw, _qbh];
	_factory_right_background ctrlSetBackgroundColor [0,0,0,0.65];
	_factory_right_background ctrlCommit 0;
	
	//queue cancel button
	private["_qcx", "_qcy" ,"_qcw", "_qch"];
	_qcx = _qhx;
	_qcy = _qby + _qbh + _ysep;
	_qcw = _qow * 1.2;
	_qch = _qoh;
	
	_factory_dequeue_button ctrlSetText "Cancel item";
	_factory_dequeue_button ctrlSetPosition [_qcx, _qcy, _qcw, _qch];
	_factory_dequeue_button ctrlCommit 0;
	
	//queue list
	private["_qlx", "_qly", "_qlw", "_qlh"];
	_qlx = _qbx + _sep;
	_qly = _qby + _sep;
	_qlw = _qbw - _sep * 2;
	_qlh = _qbh * 0.55;
	
	_factory_dequeue_list ctrlSetPosition [_qlx, _qly, _qlw, _qlh];
	_factory_dequeue_list ctrlSetFontHeight _button_font_height * 0.9;
	_factory_dequeue_list ctrlCommit 0;
	
	//queue production label
	private["_qplx", "_qply", "_qplw", "_qplh"];
	_qplx = _qlx; 
	_qply = _qly + _qlh + _sep * 4;
	_qplw = _qlw / 2  - _sep;
	_qplh = 0.04;
	
	_factory_in_production_label ctrlSetText "Production:";
	_factory_in_production_label ctrlSetPosition [_qplx, _qply, _qplw, _qplh];
	_factory_in_production_label ctrlSetFontHeight _button_font_height - 0.003;
	_factory_in_production_label ctrlCommit 0;
	
	//queue production field
	private["_qpfx", "_qpfy", "_qpfw", "_qpfh"];
	_qpfx = _qplx + _qplw + _sep ;
	_qpfy = _qply;
	_qpfw = _qplw;
	_qpfh = _qplh;
	
	_factory_production_field ctrlSetFontHeight _button_font_height - 0.003;;
	_factory_production_field ctrlSetFont _font_family;
	_factory_production_field ctrlSetPosition [_qpfx, _qpfy, _qpfw, _qpfh];
	_factory_production_field ctrlSetBackgroundColor [1,1,1,0.08];
	_factory_production_field ctrlCommit 0;
	
	//queue production time label
	private["_qtlx", "_qtly", "_qtlw", "_qtlh"];
	_qtlx = _qplx; 
	_qtly = _qply + _qplh + _ysep * 2;
	_qtlw = _qplw;
	_qtlh = _qplh;

	_factory_item_cost_label ctrlSetText "Production time:";
	_factory_item_cost_label ctrlSetPosition [_qtlx, _qtly, _qtlw, _qtlh];
	_factory_item_cost_label ctrlSetFontHeight _button_font_height - 0.003;
	_factory_item_cost_label ctrlCommit 0;
	
	//queue prodcution time field
	private["_qtfx", "_qtfy", "_qtfw", "_qtfh"];
	_qtfx = _qtlx + _qtlw + _sep ;
	_qtfy = _qtly;
	_qtfw = _qtlw;
	_qtfh = _qtlh;
	
	_factory_production_eta_field ctrlSetFontHeight _button_font_height - 0.003;;
	_factory_production_eta_field ctrlSetFont _font_family;
	_factory_production_eta_field ctrlSetPosition [_qtfx, _qtfy, _qtfw, _qtfh];
	_factory_production_eta_field ctrlSetBackgroundColor [1,1,1,0.08];
	_factory_production_eta_field ctrlCommit 0;
	
	//error label1
	private["_e1x", "_e1y", "_e1w", "_e1h"];
	_e1x = _ipx; 
	_e1y = _ipy + _iph + _sep * 2;
	_e1w = (_qhx + _qhw) - (_ihx);
	_e1h = _iph;
	
	_factory_status_field1 ctrlSetText "Status field1";
	_factory_status_field1 ctrlSetPosition [_e1x, _e1y - 0.003, _e1w, _e1h];
	_factory_status_field1 ctrlSetFontHeight _button_font_height - 0.003;
	_factory_status_field1 ctrlSetBackgroundColor [0,0,0,0];
	_factory_status_field1 ctrlCommit 0;
	
	_factory_status_frame1 ctrlSetPosition [_e1x, _e1y, _e1w, _e1h];
	_factory_status_frame1 ctrlCommit 0;
	
	_factory_status_background1 ctrlSetPosition [_e1x, _e1y, _e1w, _e1h];
	_factory_status_background1 ctrlSetBackgroundColor [0,0,0,0.65];
	_factory_status_background1 ctrlCommit 0;
	
	//error label2
	private["_e2x", "_e2y", "_e2w", "_e2h"];
	_e2x = _e1x; 
	_e2y = _e1y + _e1h + _sep * 2;
	_e2w = _e1w;
	_e2h = _e1h;
	
	_factory_status_field2 ctrlSetText "Status field2";
	_factory_status_field2 ctrlSetPosition [_e2x, _e2y - 0.003, _e2w, _e2h];
	_factory_status_field2 ctrlSetFontHeight _button_font_height - 0.003;
	_factory_status_field2 ctrlSetBackgroundColor [0,0,0,0];
	_factory_status_field2 ctrlCommit 0;
	
	_factory_status_frame2 ctrlSetPosition [_e2x, _e2y, _e2w, _e2h];
	_factory_status_frame2 ctrlCommit 0;
	
	_factory_status_background2 ctrlSetPosition [_e2x, _e2y, _e2w, _e2h];
	_factory_status_background2 ctrlSetBackgroundColor [0,0,0,0.65];
	_factory_status_background2 ctrlCommit 0;
};

factory_setup = {
	{
		private["_factory", "_factory_id"];
		_factory = _x;
		
		_factory_id = _factory select factory_id;
		[player, _factory_id] call factory_init;
		[_factory_id] spawn factory_loop;
	} forEach all_factories;
};

[] call factory_globals;
if (isClient) then {
	call factory_setup;
};

factory_functions_defined = true;