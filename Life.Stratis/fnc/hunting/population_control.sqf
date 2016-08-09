// A_hunting_fnc_population_control

#include "..\..\includes\macro.h"


ARGV(0,_animal_class);
ARGV(1,_spawn_logic);
ARGV(2,_spawn_radius);

A_hunting_var_spawned_animals = A_hunting_var_spawned_animals - [objNull];
{if (true) then {
	private["_animal"];
	_animal = _x;
	if (!(_animal isKindOf _animal_class)) exitWith {};
	if ((_animal distance _spawn_logic) > _spawn_radius) then { 
		//player groupChat format["CLEANING ANIMAL: %1 ", _animal];
		//_animal setDamage 1;
		deleteVehicle _animal;
		A_hunting_var_spawned_animals set [_forEachIndex, objNull];
	};
};} forEach A_hunting_var_spawned_animals;
