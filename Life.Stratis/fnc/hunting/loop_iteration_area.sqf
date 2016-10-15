// A_hunting_fnc_loop_iteration_area

#include "header.h"


params[["_area",null,[[]]],["_timer",-1,[0]]];

if (UNDEFINED(_area)) exitWith {};
if (_timer < 0) exitWith {};

private _marker = _area select INDEX_AREA_MARKER;
private _animals_data = _area select INDEX_AREA_ANIMALS;
{
	private _animal_data = _x;
	private _animal_class = _animal_data select INDEX_ANIMAL_CLASS;
	private _animal_item = _animal_data select INDEX_ANIMAL_ITEM;
	private _animal_max_count = _animal_data select INDEX_ANIMAL_MAX_COUNT;
	private _animal_min_count = _animal_data select INDEX_ANIMAL_MIN_COUNT;
	private _animal_spawn_radius = _animal_data select INDEX_ANIMAL_SPAWN_RADIUS;
	private _animal_spawn_rate = _animal_data select INDEX_ANIMAL_SPAWN_RATE;
	private _animal_despawn_radius = _animal_data select INDEX_ANIMAL_DESPAWN_RADIUS;
	
	//count how many animals in the area already
	private _position = getPos _marker;
	private _animal_count = count(nearestObjects[_position, [_animal_class], _animal_despawn_radius]);
	
	//cleanup astray animals
	[_animal_class, _marker, _animal_despawn_radius] call A_hunting_fnc_population_control;
	
	// only spawn if under max
	if (_animal_count <= _animal_max_count) then {
		if (_animal_count < _animal_min_count) then {
			//spawn animals at a fast rate to catch up to the minimum
			private _i = _animal_count;
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
				
				_unit addMPEventHandler ["MPKilled", { _this call A_hunting_fnc_unit_handle_mpkilled }];
				[_unit, _animal_item, 1] call A_object_fnc_item_set_data;
				A_hunting_var_spawned_animals set [count(A_hunting_var_spawned_animals), _unit];
				_i = _i + 1;
			};
		}else{
			private _interval_reached = ((_timer % _animal_spawn_rate) == 0);
			if (_interval_reached && _animal_count <= _animal_max_count) then {
				//spawn animals at slow rate to catch up to the maximum
				private _unit =  createAgent [_animal_class, _position, [], _animal_spawn_radius, "CAN_COLLIDE"];
				_unit setDir (random 360);
				
				private _data = ITEM_DATA(_animal_class);
				if (ITEM_DATA_ANIMAL_SEA(_data)) then {
					_position = getPosASL _unit;
					_position set [2, (_position select 2) - (random 10)];
					_unit setPosASL _position;
				};
				
				[_unit, _animal_item, 1] call A_object_fnc_item_set_data;
				_unit addMPEventHandler ["MPKilled", {_this call A_hunting_fnc_unit_handle_mpkilled}];
				A_hunting_var_spawned_animals pushBack _unit;
			};
		};
	};
} forEach _animals_data;