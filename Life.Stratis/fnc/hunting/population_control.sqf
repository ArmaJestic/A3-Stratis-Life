// A_hunting_fnc_population_control

#include "header.h"


params["_animal_class","_spawn_logic","_spawn_radius"];

{
	private _animal = _x;
	if !(_animal isKindOf _animal_class) exitWith {};
	if ((_animal distance _spawn_logic) > _spawn_radius) then { 
		deleteVehicle _animal;
		A_hunting_var_spawned_animals set [_forEachIndex, objNull];
	};
} forEach A_hunting_var_spawned_animals;
A_hunting_var_spawned_animals = A_hunting_var_spawned_animals - [objNull];