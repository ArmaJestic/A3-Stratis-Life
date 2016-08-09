// A_hunting_fnc_loop_iteration_area

#include "..\..\includes\macro.h"


//player groupChat format["A_hunting_fnc_loop_iteration_area %1", _this];
ARGV(0,_area);
ARGV(1,_timer);
if (undefined(_area)) exitWith {null};
if (typeName _area != "ARRAY") exitWith {null};
if (undefined(_timer)) exitWith {null};
if (typeName _timer != "SCALAR") exitWith {null};
if (_timer < 0) exitWith {null};

private["_animals_data", "_marker"];
_marker = _area select A_hunting_var_area_marker;

_animals_data = _area select A_hunting_var_area_animals;
{
	private["_animal_data", "_animal_class", "_animal_item", "_animal_spawn_radius", 
			"_animal_max_count", "_animal_min_count", "_animal_spawn_rate",
			"_animal_despawn_radius"];
			
	_animal_data = _x;
	_animal_class = _animal_data select A_hunting_var_area_animal_class;
	_animal_item = _animal_data select A_hunting_var_area_animal_item;
	_animal_max_count = _animal_data select A_hunting_var_area_animal_max_count;
	_animal_min_count = _animal_data select A_hunting_var_area_animal_min_count;
	_animal_spawn_radius = _animal_data select A_hunting_var_area_animal_spawn_radius;
	_animla_spawn_rate = _animal_data select A_hunting_var_area_animal_spawn_rate;
	_animal_despawn_radius = _animal_data select A_hunting_var_area_animal_despawn_radius;
	
	//count how many animals in the area already
	private["_animal_count", "_position"];
	_position = getPos _marker;

	//_animal_count = count( nearestObjects [_position, [_animal_class], _animal_despawn_radius]);
	_animal_count = count( nearestObjects [_position, [_animal_class], _animal_despawn_radius]);
	//player groupChat format["_position = %1, _animal_despawn_radius = %2, _animal_class = %3", _position, _animal_despawn_radius, _animal_class];
	//player grouPChat format["count = %1", _animal_count];
	if (_animal_count > _animal_max_count) exitWith {};
	
	//cleanup astray animals
	[_animal_class, _marker, _animal_despawn_radius] call A_hunting_fnc_population_control;

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
			
			//_unit_name = [format["%1_%2_%3",_animal_class, _timer, _i]] call A_hunting_fnc_generate_name;
			//[[_unit, _unit_name], "A_object_fnc_name_init_handler", true, true, _unit] call A_jip_fnc_register;
			
			_unit addMPEventHandler ["MPKilled", { _this call A_hunting_fnc_unit_handle_mpkilled }];
			[_unit, _animal_item, 1] call A_object_fnc_item_set_data;
			A_hunting_var_spawned_animals set [count(A_hunting_var_spawned_animals), _unit];
			_i = _i + 1;
		};
	}else{ if (_interval_reached && _animal_count <= _animal_max_count) then {
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
		
		//_unit_name = [format["%1_%2",_animal_class, _timer]] call A_hunting_fnc_generate_name;
		//[[_unit, _unit_name], "A_object_fnc_name_init_handler", true, true, _unit] call A_jip_fnc_register;


		[_unit, _animal_item, 1] call A_object_fnc_item_set_data;
		_unit addMPEventHandler ["MPKilled", { _this call A_hunting_fnc_unit_handle_mpkilled }];
		A_hunting_var_spawned_animals set [count(A_hunting_var_spawned_animals), _unit];
	};};
} forEach _animals_data;
