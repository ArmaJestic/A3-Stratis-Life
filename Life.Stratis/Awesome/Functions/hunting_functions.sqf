#include "macro.h"

if (not(undefined(hunting_functions_defined))) exitWith {null};

hunting_area_name = 0;
hunting_area_marker = 1;
hunting_area_animals = 2;

hunting_area_animal_name = 0;   //this is the animal display name
hunting_area_animal_class = 1;  //this is the Arma class name 
hunting_area_animal_item = 2;   //this is the item name from master array
hunting_area_animal_min_count = 3;
hunting_area_animal_max_count = 4;
hunting_area_animal_spawn_radius = 5;
hunting_area_animal_spawn_rate = 6;
hunting_area_animal_despawn_radius = 7;


hunting_setup = {
	if (not(isServer)) exitWith {null};
	//Create turtle hunting Area
	private["_turtle_area"];
	_turtle_area = [];
	_turtle_area set [hunting_area_name, "Hunting Area - Tutles"];
	_turtle_area set [hunting_area_marker, turtlelogic];

	private["_turtle_area_animal_data", "_land_turtle_data"];
	_turtle_area_animal_data = [];
	
	//Setup the turtle area
	_land_turtle_data = [];
	_land_turtle_data set [hunting_area_animal_name, "Land Turtle"];
	_land_turtle_data set [hunting_area_animal_class, "Turtle_F"];
	_land_turtle_data set [hunting_area_animal_item, "Turtle_F"];
	_land_turtle_data set [hunting_area_animal_min_count, 15];
	_land_turtle_data set [hunting_area_animal_max_count, 30];
	_land_turtle_data set [hunting_area_animal_spawn_radius, 30];
	_land_turtle_data set [hunting_area_animal_despawn_radius, 100];
	_land_turtle_data set [hunting_area_animal_spawn_rate, 60];
	_turtle_area_animal_data set [count(_turtle_area_animal_data), _land_turtle_data];
	
	_turtle_area set [hunting_area_animals, _turtle_area_animal_data];
	
	
	
	//Create goat hunting Area
	private["_goat_area"];
	_goat_area = [];
	_goat_area set [hunting_area_name, "Hunting Area - Goat"];
	_goat_area set [hunting_area_marker, goatarealogic];

	private["_goat_area_animal_data", "_goat_data"];
	_goat_area_animal_data = [];
	
	//Setup the goat area
	_goat_data = [];
	_goat_data set [hunting_area_animal_name, "Random Goat"];
	_goat_data set [hunting_area_animal_class, "Goat_random_F"];
	_goat_data set [hunting_area_animal_item, "Goat_random_F"];
	_goat_data set [hunting_area_animal_min_count, 15];
	_goat_data set [hunting_area_animal_max_count, 30];
	_goat_data set [hunting_area_animal_spawn_radius, 30];
	_goat_data set [hunting_area_animal_despawn_radius, 100];
	_goat_data set [hunting_area_animal_spawn_rate, 60];
	_goat_area_animal_data set [count(_goat_area_animal_data), _goat_data];
	
	_goat_area set [hunting_area_animals, _goat_area_animal_data];
	
	
	//Create sheep hunting area
	private["_sheep_area"];
	_sheep_area = [];
	_sheep_area set [hunting_area_name, "Hunting Area - Sheep"];
	_sheep_area set [hunting_area_marker, sheeplogic];

	private["_sheep_area_animal_data", "_sheep_data"];
	_sheep_area_animal_data = [];
	
	//Setup the sheep area
	_sheep_data = [];
	_sheep_data set [hunting_area_animal_name, "Random Sheep"];
	_sheep_data set [hunting_area_animal_class, "Sheep_random_F"];
	_sheep_data set [hunting_area_animal_item, "Sheep_random_F"];
	_sheep_data set [hunting_area_animal_min_count, 15];
	_sheep_data set [hunting_area_animal_max_count, 30];
	_sheep_data set [hunting_area_animal_spawn_radius, 30];
	_sheep_data set [hunting_area_animal_despawn_radius, 100];
	_sheep_data set [hunting_area_animal_spawn_rate, 60];
	_sheep_area_animal_data set [count(_sheep_area_animal_data), _sheep_data];
	
	_sheep_area set [hunting_area_animals, _sheep_area_animal_data];
	
	
	
	
	
	
	
	
	//Create chicken hunting area
	private["_chicken_area"];
	_chicken_area = [];
	_chicken_area set [hunting_area_name, "Hunting Area - Chicken"];
	_chicken_area set [hunting_area_marker, chickenlogic];

	private["_chicken_area_animal_data", "_chicken_data"];
	_chicken_area_animal_data = [];
	
	//Setup the chicken area
	_chicken_data = [];
	_chicken_data set [hunting_area_animal_name, "Random Chicken"];
	_chicken_data set [hunting_area_animal_class, "Hen_random_F"];
	_chicken_data set [hunting_area_animal_item, "Hen_random_F"];
	_chicken_data set [hunting_area_animal_min_count, 15];
	_chicken_data set [hunting_area_animal_max_count, 30];
	_chicken_data set [hunting_area_animal_spawn_radius, 30];
	_chicken_data set [hunting_area_animal_despawn_radius, 100];
	_chicken_data set [hunting_area_animal_spawn_rate, 60];
	_chicken_area_animal_data set [count(_chicken_area_animal_data), _chicken_data];
	
	_chicken_area set [hunting_area_animals, _chicken_area_animal_data];
	
	
	
	
	
	//Create catshark hunting area
	private["_catshark_area"];
	_catshark_area = [];
	_catshark_area set [hunting_area_name, "Hunting Area - Catshark"];
	_catshark_area set [hunting_area_marker, catsharklogic];

	private["_catshark_area_animal_data", "_catshark_data"];
	_catshark_area_animal_data = [];
	
	//Setup the catshark area
	_catshark_data = [];
	_catshark_data set [hunting_area_animal_name, "Catshark"];
	_catshark_data set [hunting_area_animal_class, "CatShark_F"];
	_catshark_data set [hunting_area_animal_item, "CatShark_F"];
	_catshark_data set [hunting_area_animal_min_count, 15];
	_catshark_data set [hunting_area_animal_max_count, 30];
	_catshark_data set [hunting_area_animal_spawn_radius, 30];
	_catshark_data set [hunting_area_animal_despawn_radius, 100];
	_catshark_data set [hunting_area_animal_spawn_rate, 60];
	_catshark_area_animal_data set [count(_catshark_area_animal_data), _catshark_data];
	
	_catshark_area set [hunting_area_animals, _catshark_area_animal_data];
	
	
	
	//Create tuna hunting area
	private["_tuna_area"];
	_tuna_area = [];
	_tuna_area set [hunting_area_name, "Hunting Area - Tuna"];
	_tuna_area set [hunting_area_marker, tunalogic];

	private["_tuna_area_animal_data", "_tuna_data"];
	_tuna_area_animal_data = [];
	
	//Setup the tuna area
	_tuna_data = [];
	_tuna_data set [hunting_area_animal_name, "Tuna"];
	_tuna_data set [hunting_area_animal_class, "Tuna_F"];
	_tuna_data set [hunting_area_animal_item, "Tuna_F"];
	_tuna_data set [hunting_area_animal_min_count, 15];
	_tuna_data set [hunting_area_animal_max_count, 30];
	_tuna_data set [hunting_area_animal_spawn_radius, 30];
	_tuna_data set [hunting_area_animal_despawn_radius, 100];
	_tuna_data set [hunting_area_animal_spawn_rate, 60];
	_tuna_area_animal_data set [count(_tuna_area_animal_data), _tuna_data];
	
	_tuna_area set [hunting_area_animals, _tuna_area_animal_data];
	
	
	
	
	hunting_areas = [];
	hunting_areas set [count(hunting_areas), _turtle_area];
	hunting_areas set [count(hunting_areas), _goat_area];
	hunting_areas set [count(hunting_areas), _sheep_area];
	hunting_areas set [count(hunting_areas), _chicken_area];
	hunting_areas set [count(hunting_areas), _catshark_area];
	hunting_areas set [count(hunting_areas), _tuna_area];
};



hunting_set_init = {
	player grouPChat format["hunting_set_init %1", _this];
	ARGV(0,_unit);
	ARGV(1,_name);
	if (undefined(_unit)) exitWith {null};
	if (typeName _unit != "OBJECT") exitWith {null};
	if (isNull _unit) exitWith {null};
	if (undefined(_name)) exitWith {null};
	if (typeName _name != "STRING") exitWith {null};
	
	_name = [_name] call hunting_generate_name;
	
	missionNamespace setVariable [_name, _unit];
	_unit setVehicleVarname _name;
};

hunting_generate_name = {
	ARGV(0,_base);
	_base = if (undefined(_base)) then {"generated"} else {_base};
	
	private["_restart_count", "_name"];
	_restart_count = server getVariable "restart_count";
	_name = format["%1_%2_%3_%4", _base, "server", _restart_count, round(time)];
	_name
};

hunting_spawned_animals = [];



hunting_population_control = {
	ARGV(0,_animal_class);
	ARGV(1,_spawn_logic);
	ARGV(2,_spawn_radius);
	
	hunting_spawned_animals = hunting_spawned_animals - [objNull];
	{if (true) then {
		private["_animal"];
		_animal = _x;
		if (not(_animal isKindOf _animal_class)) exitWith {};
		if ((_animal distance _spawn_logic) > _spawn_radius) then { 
			//player groupChat format["CLEANING ANIMAL: %1 ", _animal];
			//_animal setDamage 1;
			deleteVehicle _animal;
			hunting_spawned_animals set [_forEachIndex, objNull];
		};
	};} forEach hunting_spawned_animals;
};



hunting_loop_iteration_area = {
	//player groupChat format["hunting_loop_iteration_area %1", _this];
	ARGV(0,_area);
	ARGV(1,_timer);
	if (undefined(_area)) exitWith {null};
	if (typeName _area != "ARRAY") exitWith {null};
	if (undefined(_timer)) exitWith {null};
	if (typeName _timer != "SCALAR") exitWith {null};
	if (_timer < 0) exitWith {null};
	
	private["_animals_data", "_marker"];
	_marker = _area select hunting_area_marker;
	
	_animals_data = _area select hunting_area_animals;
	{
		private["_animal_data", "_animal_class", "_animal_item", "_animal_spawn_radius", 
				"_animal_max_count", "_animal_min_count", "_animal_spawn_rate",
				"_animal_despawn_radius"];
				
		_animal_data = _x;
		_animal_class = _animal_data select hunting_area_animal_class;
		_animal_item = _animal_data select hunting_area_animal_item;
		_animal_max_count = _animal_data select hunting_area_animal_max_count;
		_animal_min_count = _animal_data select hunting_area_animal_min_count;
		_animal_spawn_radius = _animal_data select hunting_area_animal_spawn_radius;
		_animla_spawn_rate = _animal_data select hunting_area_animal_spawn_rate;
		_animal_despawn_radius = _animal_data select hunting_area_animal_despawn_radius;
		
		//count how many animals in the area already
		private["_animal_count", "_position"];
		_position = getPos _marker;

		//_animal_count = count( nearestObjects [_position, [_animal_class], _animal_despawn_radius]);
		_animal_count = count( nearestObjects [_position, [_animal_class], _animal_despawn_radius]);
		//player groupChat format["_position = %1, _animal_despawn_radius = %2, _animal_class = %3", _position, _animal_despawn_radius, _animal_class];
		//player grouPChat format["count = %1", _animal_count];
		if (_animal_count > _animal_max_count) exitWith {};
		
		//cleanup astray animals
		[_animal_class, _marker, _animal_despawn_radius] call hunting_population_control;

		private["_interval_reached"];
		_interval_reached = ((_timer % _animla_spawn_rate) == 0);
		
		//player groupChat format["_animal_count(%2) = %1", _animal_count, _animal_class];
		if (_animal_count < _animal_min_count) then {
			//spawn animals at a fast rate to catch up to the minimum
			private["_i"];
			
			_i = _animal_count;
			while {_i <= _animal_min_count} do {
				//player groupChat format["FAST-RATE: Spawn(%1)", _animal_class];
				private["_unit"];
				_unit =  createAgent [_animal_class, _position, [], _animal_spawn_radius, "CAN_COLLIDE"];
				_unit setDir (random 360);
				
				private["_data"];
				_data = ITEM_DATA(_animal_class);
				if (ITEM_DATA_ANIMAL_SEA(_data)) then {
					_position = getPosASL _unit;
					_position set [2, (_position select 2) - (random 10)];
					_unit setPosASL _position;
				};
				
				//_unit_name = [format["%1_%2_%3",_animal_class, _timer, _i]] call hunting_generate_name;
				//[[_unit, _unit_name], "object_name_init_handler", true, true, _unit] call jip_register;
				
				_unit addMPEventHandler ["MPKilled", { _this call hunting_unit_handle_mpkilled }];
				[_unit, _animal_item, 1] call object_item_set_data;
				hunting_spawned_animals set [count(hunting_spawned_animals), _unit];
				_i = _i + 1;
			};
		}
		else { if (_interval_reached && _animal_count <= _animal_max_count) then {
			//spawn animals at slow rate to catch up to the maximum
			private["_unit"];
			//player groupChat format["SLOW-RATE: Spawn(%1)", _animal_class];
			_unit =  createAgent [_animal_class, _position, [], _animal_spawn_radius, "CAN_COLLIDE"];
			_unit setDir (random 360);
			private["_data"];
			_data = ITEM_DATA(_animal_class);
			if (ITEM_DATA_ANIMAL_SEA(_data)) then {
				_position = getPosASL _unit;
				_position set [2, (_position select 2) - (random 10)];
				_unit setPosASL _position;
			};
			
			//_unit_name = [format["%1_%2",_animal_class, _timer]] call hunting_generate_name;
			//[[_unit, _unit_name], "object_name_init_handler", true, true, _unit] call jip_register;


			[_unit, _animal_item, 1] call object_item_set_data;
			_unit addMPEventHandler ["MPKilled", { _this call hunting_unit_handle_mpkilled }];
			hunting_spawned_animals set [count(hunting_spawned_animals), _unit];
		};};
	} forEach _animals_data;
};

hunting_loop_iteration = {
	ARGV(0,_timer);
	{
		private["_hunting_area"];
		_hunting_area = _x;
		[_hunting_area, _timer] call hunting_loop_iteration_area;
	} forEach hunting_areas;
};

hunting_loop = {
	//player groupChat format["hunting_loop %1", _this];
	if (not(isServer)) exitWith {null};
	
	private["_hunting_loop_i", "_sleep", "_timer"];
	_hunting_loop_i = 0;
	_sleep = 1;
	
	while {_hunting_loop_i < 5000 } do {
		[_hunting_loop_i] call hunting_loop_iteration;
		_hunting_loop_i = _hunting_loop_i + 1; 
		sleep _sleep;
	};
	
	[] spawn hunting_loop;
};

hunting_unit_despawn = { _this spawn {
	player groupChat format["hunting_unit_despawn %1", _this];
	ARGV(0,_unit);
	ARGV(1,_delay);
	
	if (undefined(_unit)) exitWith {null};
	if (typeName _unit != "OBJECT") exitWith {null};
	if (isNull _unit) exitWith {null};
	if (undefined(_delay)) exitWith {null};
	if (typeName _delay != "SCALAR") exitWith {null};

	_delay = ((_delay - 5) max (0));
	player groupChat format["hunting_unit_despawn waiting %1, %2", _unit, _delay];
	[_delay] call isleep;
	
	player groupChat format["hunting_unit_despawn hiding %1", _unit];
	private["_i"];
	_i = 0;
	while { _i < 5 } do {
		hideBody _unit;
		sleep 1;
		_i = _i + 1;
	};
	
	if (isServer) then {
		sleep 5;
		deleteVehicle _unit;
	};
};};

hunting_unit_handle_mpkilled = { _this spawn {
	//player groupChat format["hunting_unit_handle_mpkilled %1", _this];
	if (not(isServer)) exitWith {null};
	ARGV(0,_unit);
	ARGV(1,_killer);
	
	[_unit, 60] spawn hunting_unit_despawn;
};};

[] call hunting_setup;
[] spawn hunting_loop;


hunting_functions_defined = true;
